module Model exposing (..)


type alias ListItem =
    { item : String
    , done : Bool
    }


type alias Model =
    { currentItem : String
    , listOfItems : List ListItem
    }


model : Model
model =
    { currentItem = "", listOfItems = [] }
