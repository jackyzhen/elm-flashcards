module Game.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field, Decoder, string)
import Json.Decode.Pipeline exposing (decode, required, hardcoded)
import Game.Messages exposing (Msg)
import Game.FlashCard exposing (Model)


fetchStudent : Cmd Msg
fetchStudent =
    Http.get fetchQuestionsUrl collectionDecoder
        |> Http.send Game.Messages.OnFetchQuestions


fetchQuestionsUrl : String
fetchQuestionsUrl =
    "http://localhost:4000/questions"


collectionDecoder : Decode.Decoder (List Game.FlashCard.Model)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Game.FlashCard.Model
memberDecoder =
    decode Game.FlashCard.Model
    |> required "id" string
    |> required "question" string
    |> required "answer" string
    |> hardcoded False
