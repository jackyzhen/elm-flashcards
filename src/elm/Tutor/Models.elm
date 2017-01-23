module Tutor.Models exposing (..)


type alias TutorId =
    String


type alias Tutor =
    { id : TutorId
    , name : String
    }


new : Tutor
new =
    { id = ""
    , name = ""
    }
