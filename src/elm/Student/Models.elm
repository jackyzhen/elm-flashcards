module Student.Models exposing (..)


type alias StudentId =
    String


type alias Student =
    { id : StudentId
    , name : String
    }


new : Student
new =
    { id = ""
    , name = ""
    }
