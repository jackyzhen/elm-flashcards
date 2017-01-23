module Student.Models exposing (..)


type alias StudentId =
    String


type alias Student =
    { id : StudentId
    , name : String
    }


new : Student
new =
    { id = "1"
    , name = "Steve"
    }
