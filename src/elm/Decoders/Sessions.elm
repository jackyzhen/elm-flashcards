module Decoders.Sessions exposing (..)

import Json.Decode as Decode exposing (field, Decoder, string)
import Json.Decode.Pipeline exposing (decode, required, hardcoded)

import Models.Session exposing (Session)

collectionSessionDecoder : Decode.Decoder (List Session)
collectionSessionDecoder =
    Decode.list memberSessionDecoder


memberSessionDecoder : Decode.Decoder Session
memberSessionDecoder =
    decode Session
    |> required "id" string
    |> required "datetime" string
    |> required "studentId" string
