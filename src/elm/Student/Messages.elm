module Student.Messages exposing (..)

import Http
import Student.Models exposing (Student)


type Msg
    = ShowPlay
    | ShowHistory
    | OnFetchStudent (Result Http.Error (List Student))
