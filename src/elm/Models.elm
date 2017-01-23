module Models exposing (..)

import Routing
import Game.Model


type alias Model =
    { route : Routing.Route
    , game : Game.Model.Model
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , game = Game.Model.inititialModel
    }
