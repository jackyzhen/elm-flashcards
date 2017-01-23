module Student.Models exposing (..)


type alias StudentId =
    String


type alias Student =
    { id : StudentId
    , name : String
    , subject : String
    }


type alias Students =
    List Student


new : Student
new =
    { id = ""
    , name = ""
    , subject = ""
    }
