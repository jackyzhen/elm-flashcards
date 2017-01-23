module Flashcards.Models exposing (..)


type alias FlashcardId =
    String


type alias Flashcard =
    { id : FlashcardId
    , question : String
    , subject : String
    , answer : String
    }
