module Models exposing (..)

import Routing
import Game.Model
import Student.Models
import Tutor.Models


type alias Model =
    { route : Routing.Route
    , game : Game.Model.Model
    , tutor : Maybe Tutor.Models.Tutor
    , students : Student.Models.Students
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , game = Game.Model.initialModel
    , tutor = Nothing
    , students = []
    }
