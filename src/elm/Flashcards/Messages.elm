module Flashcards.Messages exposing (..)

import Flashcards.Models exposing (Flashcard, FlashcardId)
import Http


type Msg
    = OnFetchFlashcards (Result Http.Error (List Flashcard))
    | ViewEditFlashcard FlashcardId
    | ShowFlashCards
