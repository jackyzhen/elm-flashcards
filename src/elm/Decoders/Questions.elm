module Decoders.Questions exposing (..)

import Json.Decode as Decode exposing (field, Decoder, string)
import Json.Decode.Pipeline exposing (decode, required, hardcoded)

import Game.FlashCard exposing (Model)

collectionQuestionDecoder : Decode.Decoder (List Game.FlashCard.Model)
collectionQuestionDecoder =
    Decode.list memberQuestionDecoder


memberQuestionDecoder : Decode.Decoder Game.FlashCard.Model
memberQuestionDecoder =
    decode Game.FlashCard.Model
    |> required "id" string
    |> required "question" string
    |> required "answer" string
    |> hardcoded False
