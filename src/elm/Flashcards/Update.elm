module Flashcards.Update exposing (..)

import Flashcards.Messages exposing (Msg(..))
import Flashcards.Models exposing (Flashcard)


update : Msg -> List Flashcard -> ( List Flashcard, Cmd Msg )
update message flashcards =
    case message of
        OnFetchFlashcards (Ok flashcards) ->
            ( flashcards, Cmd.none )

        OnFetchFlashcards (Err error) ->
            ( flashcards, Cmd.none )
