module Flashcards.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Flashcards.Models exposing (Flashcard)
import Flashcards.Messages exposing (..)


fetchFlashcards : Cmd Msg
fetchFlashcards =
    Http.get fetchFlashcardsUrl collectionDecoder
        |> Http.send OnFetchFlashcards


fetchFlashcardsUrl : String
fetchFlashcardsUrl =
    "http://localhost:4000/questions"


collectionDecoder : Decode.Decoder (List Flashcard)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Flashcard
memberDecoder =
    Decode.map4 Flashcard
        (field "id" Decode.string)
        (field "question" Decode.string)
        (field "subject" Decode.string)
        (field "answer" Decode.string)
