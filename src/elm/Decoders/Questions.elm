module Decoders.Questions exposing (..)

import Json.Decode as Decode exposing (field, Decoder, string)
import Json.Decode.Pipeline exposing (decode, required, hardcoded)

import Game.FlashCard exposing (Model)
import Models.Question exposing (Question)

-- I'm going to leave this as it is, even though it is really bad. We should be using a specific model, instead of the Game.FlashCard.Model.......

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


collectionModelQuestionDecoder : Decode.Decoder (List Question)
collectionModelQuestionDecoder =
    Decode.list memberModelQuestionDecoder


memberModelQuestionDecoder : Decode.Decoder Question
memberModelQuestionDecoder =
    decode Question
    |> required "id" string
    |> required "question" string
    |> hardcoded ""
    |> required "answer" string
