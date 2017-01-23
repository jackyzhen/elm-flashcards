module Decoders.Answers exposing (..)

import Json.Decode as Decode exposing (field, Decoder, string)
import Json.Decode.Pipeline exposing (decode, required, hardcoded)
import Json.Encode as Encode

import Models.Answer exposing (Answer)

collectionAnswerDecoder : Decode.Decoder (List Answer)
collectionAnswerDecoder =
    Decode.list memberAnswerDecoder


memberAnswerDecoder : Decode.Decoder Answer
memberAnswerDecoder =
    decode Answer
    |> required "sessionId" string
    |> required "questionId" string
    |> required "answer" string
    |> required "id" string

memberAnswerEncoder : Answer -> Encode.Value
memberAnswerEncoder answer =
    let
        list =
            [ ( "sessionId", Encode.string answer.sessionId )
            , ( "questionId", Encode.string answer.questionId )
            , ( "answer", Encode.string answer.answer )
            , ( "id", Encode.string answer.id)
            ]
    in
        list
            |> Encode.object