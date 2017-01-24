module Flashcards.Update exposing (..)

import Flashcards.Messages exposing (Msg(..))
import Flashcards.Models exposing (Flashcard, FlashCardsModel)
import Navigation
import Flashcards.Commands


update : Msg -> FlashCardsModel -> ( FlashCardsModel, Cmd Msg )
update message flashcards =
    case message of
        OnFetchFlashcards (Ok fc) ->
            ( { flashcards | currentList = fc }, Cmd.none )

        OnFetchFlashcards (Err error) ->
            ( flashcards, Cmd.none )

        ViewEditFlashcard flashcardId ->
            ( flashcards, Navigation.newUrl ("/tutor/flashcards/" ++ flashcardId) )

        ShowFlashCards ->
            ( flashcards, Navigation.newUrl "/tutor/flashcards/" )

        UpdateCard flashcard ->
            ( flashcards, updateFlashcardCommands flashcard flashcards.currentList |> Cmd.batch )

        OnSaveFlashcard (Ok updatedCard) ->
            ( { flashcards | currentList = updateFlashcard updatedCard flashcards.currentList }, Cmd.none )

        OnSaveFlashcard (Err error) ->
            ( flashcards, Cmd.none )


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
        List.map cmdForFlashcards flashcards
