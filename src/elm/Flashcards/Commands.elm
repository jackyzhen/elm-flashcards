module Flashcards.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Json.Encode as Encode
import Flashcards.Models exposing (Flashcard, FlashcardId)
import Flashcards.Messages exposing (..)


fetchFlashcardsWithId : FlashcardId -> Cmd Msg
fetchFlashcardsWithId id =
    Http.get fetchFlashcardsUrl collectionDecoder
        |> Http.send (OnFetchFlashcardsWithId id)


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


saveUrl : Flashcards.Models.FlashcardId -> String
saveUrl flashcardId =
    fetchFlashcardsUrl ++ "/" ++ flashcardId


save : Flashcard -> Cmd Msg
save flashcard =
    saveRequest flashcard
        |> Http.send OnSaveFlashcard


saveRequest : Flashcard -> Http.Request Flashcard
saveRequest flashcard =
    Http.request
        { body = memberEncoded flashcard |> Http.jsonBody
        , expect = Http.expectJson memberDecoder
        , headers = []
        , method = "PATCH"
        , timeout = Nothing
        , url = saveUrl flashcard.id
        , withCredentials = False
        }


memberEncoded : Flashcard -> Encode.Value
memberEncoded flashcard =
    let
        list =
            [ ( "id", Encode.string flashcard.id )
            , ( "question", Encode.string flashcard.question )
            , ( "answer", Encode.string flashcard.answer )
            , ( "subject", Encode.string flashcard.subject )
            ]
    in
        list
            |> Encode.object
