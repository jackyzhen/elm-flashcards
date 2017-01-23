module Tutor.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Tutor.Models exposing (TutorId, Tutor)
import Tutor.Messages exposing (..)


fetchTutor : Cmd Msg
fetchTutor =
    Http.get fetchTutorUrl collectionDecoder
        |> Http.send OnFetchTutor


fetchTutorUrl : String
fetchTutorUrl =
    "http://localhost:4000/tutors"


collectionDecoder : Decode.Decoder (List Tutor)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Tutor
memberDecoder =
    Decode.map2 Tutor
        (field "id" Decode.string)
        (field "name" Decode.string)
