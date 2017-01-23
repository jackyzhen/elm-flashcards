module Decoders.Answers exposing (..)

import Json.Decode as Decode exposing (field, Decoder, string)
import Json.Decode.Pipeline exposing (decode, required, hardcoded)

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
