module Tutor.Messages exposing (..)

import Http
import Tutor.Models exposing (Tutor)


type Msg
    = ShowStudents
    | ShowFlashCards
    | OnFetchTutor (Result Http.Error (List Tutor))
