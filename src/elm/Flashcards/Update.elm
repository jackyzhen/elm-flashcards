module Flashcards.Update exposing (..)

import Flashcards.Messages exposing (Msg(..))
import Flashcards.Models exposing (Flashcard)
import Navigation
import Flashcards.Commands


update : Msg -> List Flashcard -> ( List Flashcard, Cmd Msg )
update message flashcards =
    case message of
        OnFetchFlashcards (Ok flashcards) ->
            ( flashcards, Cmd.none )

        OnFetchFlashcards (Err error) ->
            ( flashcards, Cmd.none )

        ViewEditFlashcard flashcardId ->
            ( flashcards, Navigation.newUrl ("/tutor/flashcards/" ++ flashcardId) )

        ShowFlashCards ->
            ( flashcards, Navigation.newUrl "/tutor/flashcards/" )

        UpdateCard flashcard ->
            ( flashcards, updateFlashcardCommands flashcard flashcards |> Cmd.batch )

        OnSaveFlashcard (Ok updatedCard) ->
            ( updateFlashcard updatedCard flashcards, Cmd.none )

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
