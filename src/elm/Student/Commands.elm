module Student.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Student.Models exposing (StudentId, Student)
import Student.Messages exposing (..)


fetchStudent : Cmd Msg
fetchStudent =
    Http.get fetchStudentUrl collectionDecoder
        |> Http.send OnFetchStudent


fetchStudentUrl : String
fetchStudentUrl =
    "http://localhost:4000/students"


collectionDecoder : Decode.Decoder (List Student)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Student
memberDecoder =
    Decode.map2 Student
        (field "id" Decode.string)
        (field "name" Decode.string)
