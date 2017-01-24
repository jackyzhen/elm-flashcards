module Models exposing (..)

import Routing
import Game.Model
import Student.Models
import Tutor.Models
import Flashcards.Models
import History.Models

type alias Model =
    { route : Routing.Route
    , game : Game.Model.Model
    , tutor : Maybe Tutor.Models.Tutor
    , students : Student.Models.Students
    , flashcards : List Flashcards.Models.Flashcard
    , historyModel : History.Models.HistoryModel
    , currentFlashCard : Flashcards.Models.Flashcard
    }


initialModel : Routing.Route -> Model
initialModel route =
    { route = route
    , game = Game.Model.initialModel
    , tutor = Nothing
    , students = []
    , flashcards = []
    , historyModel = History.Models.initialModel
    , currentFlashCard = Flashcards.Models.Flashcard "" "" "" ""
    }
