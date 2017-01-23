module Flashcards.Messages exposing (..)

import Flashcards.Models exposing (Flashcard)
import Http


type Msg
    = OnFetchFlashcards (Result Http.Error (List Flashcard))
