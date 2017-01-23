module Models exposing (..)

import Routing
import Game.Model
import Student.Models


type alias Model =
    { route : Routing.Route
    , game : Game.Model.Model
    , student : Maybe Student.Models.Student
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , game = Game.Model.inititialModel
    , student = Nothing
    }
