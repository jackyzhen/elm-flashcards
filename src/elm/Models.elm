module Models exposing (..)

import Routing
import Game.Model
import Student.Models
import Tutor.Models


type alias Model =
    { route : Routing.Route
    , game : Game.Model.Model
    , student : Maybe Student.Models.Student
    , tutor : Maybe Tutor.Models.Tutor
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , game = Game.Model.initialModel
    , student = Nothing
    , tutor = Nothing
    }
