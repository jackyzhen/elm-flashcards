module Flashcards.Messages exposing (..)

import Flashcards.Models exposing (Flashcard, FlashcardId)
import Http


type Msg
    = OnFetchFlashcards (Result Http.Error (List Flashcard))
    | ViewEditFlashcard FlashcardId
    | ShowFlashCards
    | OnSaveFlashcard (Result Http.Error Flashcard)
    | UpdateCard Flashcard
    | UpdateQuestion String
    | UpdateSubject String
    | UpdateAnswer String
    | ShowTutor
    | OnFetchFlashcardsWithId FlashcardId (Result Http.Error (List Flashcard))
