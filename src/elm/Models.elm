module Models exposing (..)

import Routing
import Game.Model
import Student.Models
import Tutor.Models
import Flashcards.Models


type alias Model =
    { route : Routing.Route
    , game : Game.Model.Model
    , tutor : Maybe Tutor.Models.Tutor
    , students : Student.Models.Students
    , flashcards : List Flashcards.Models.Flashcard
    , currentFlashCard : Flashcards.Models.Flashcard
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , game = Game.Model.initialModel
    , tutor = Nothing
    , students = []
    , flashcards = []
    , currentFlashCard = Flashcards.Models.Flashcard "" "" "" ""
    }
