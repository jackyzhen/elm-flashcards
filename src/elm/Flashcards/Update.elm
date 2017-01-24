module Flashcards.Update exposing (..)

import Flashcards.Messages exposing (Msg(..))
import Flashcards.Models exposing (Flashcard, FlashCardsModel, FlashcardId)
import Navigation
import Flashcards.Commands


update : Msg -> FlashCardsModel -> ( FlashCardsModel, Cmd Msg )
update message flashcards =
    case message of
        OnFetchFlashcards (Ok fc) ->
            ( { flashcards | currentList = fc }, Cmd.none )

        OnFetchFlashcards (Err error) ->
            ( flashcards, Cmd.none )

        OnFetchFlashcardsWithId id (Ok fc) ->
            ( { currentList = fc, currentEditCard = (getFlashcardById fc id) }, Cmd.none )

        OnFetchFlashcardsWithId id (Err error) ->
            ( flashcards, Cmd.none )

        ViewEditFlashcard flashcardId ->
            ( setFlashcardInEdit flashcards flashcardId, Navigation.newUrl ("/tutor/flashcards/" ++ flashcardId) )

        ShowFlashCards ->
            ( flashcards, Navigation.newUrl "/tutor/flashcards/" )

        ShowTutor ->
            ( flashcards, Navigation.newUrl "/tutor" )

        UpdateCard flashcard ->
            ( flashcards, updateFlashcardCommands flashcard flashcards.currentList |> Cmd.batch )

        OnSaveFlashcard (Ok updatedCard) ->
            ( { flashcards | currentList = updateFlashcard updatedCard flashcards.currentList }, Cmd.none )

        OnSaveFlashcard (Err error) ->
            ( flashcards, Cmd.none )

        UpdateQuestion question ->
            ( setFlashcardQuestion flashcards question, Cmd.none )

        UpdateAnswer answer ->
            ( setFlashcardAnswer flashcards answer, Cmd.none )

        UpdateSubject subject ->
            ( setFlashcardSubject flashcards subject, Cmd.none )


getFlashcardById : List Flashcard -> FlashcardId -> Flashcard
getFlashcardById flashcards id =
    let
        maybeCard =
            flashcards |> List.filter (\card -> card.id == id) |> List.head
    in
        case maybeCard of
            Just card ->
                card

            Nothing ->
                Flashcard "" "" "" ""


setFlashcardInEdit : FlashCardsModel -> String -> FlashCardsModel
setFlashcardInEdit flashcardModel id =
    { currentList = flashcardModel.currentList, currentEditCard = getFlashcardById flashcardModel.currentList id }


setFlashcardQuestion : FlashCardsModel -> String -> FlashCardsModel
setFlashcardQuestion flashcardModel question =
    let
        oldRecord =
            flashcardModel.currentEditCard

        newRecord =
            { oldRecord | question = question }
    in
        { flashcardModel | currentEditCard = newRecord }


setFlashcardAnswer : FlashCardsModel -> String -> FlashCardsModel
setFlashcardAnswer flashcardModel answer =
    let
        oldRecord =
            flashcardModel.currentEditCard

        newRecord =
            { oldRecord | answer = answer }
    in
        { flashcardModel | currentEditCard = newRecord }


setFlashcardSubject : FlashCardsModel -> String -> FlashCardsModel
setFlashcardSubject flashcardModel subject =
    let
        oldRecord =
            flashcardModel.currentEditCard

        newRecord =
            { oldRecord | subject = subject }
    in
        { flashcardModel | currentEditCard = newRecord }


updateFlashcard : Flashcard -> List Flashcard -> List Flashcard
updateFlashcard flashcard flashCards =
    let
        select existingCard =
            if existingCard.id == flashcard.id then
                flashcard
            else
                existingCard
    in
        if (List.any (\card -> card.id == flashcard.id) flashCards) then
            List.map select flashCards
        else
            flashcard :: flashCards


updateFlashcardCommands : Flashcard -> List Flashcard -> List (Cmd Msg)
updateFlashcardCommands flashcard flashcards =
    let
        cmdForFlashcards existingCard =
            if existingCard.id == flashcard.id then
                Flashcards.Commands.save flashcard
            else
                Cmd.none
    in
        Navigation.newUrl "/tutor/flashcards/" :: (List.map cmdForFlashcards flashcards)
