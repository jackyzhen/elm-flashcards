module Game.Model exposing (..)

import Game.FlashCard


type alias Model =
    { flashCards : List Game.FlashCard.Model
    , currentInput : String
    , currentFlashCardId : Maybe String
    , answeredFlashCardIds : List String
    , validationMessage: Maybe String
    , isGameComplete: Bool
    , sessionId: String
    }


initialModel : Model
initialModel =
    { flashCards = []
    , currentInput = ""
    , currentFlashCardId = Just ""
    , answeredFlashCardIds = []
    , validationMessage = Nothing
    , isGameComplete = False
    , sessionId = ""
    }
