module Game.Model exposing (..)

import Components.FlashCard


type alias Model =
    { flashCards : List Components.FlashCard.Model
    , currentInput : String
    , currentFlashCardId : Maybe String
    , answeredFlashCardIds : List String
    , validationMessage: Maybe String
    }


inititialModel : Model
inititialModel =
    { flashCards =
        [ { id = "1"
          , question = "what is the capital of china?"
          , answer = "Beijing"
          , answerVisible = False
          }
          , { id = "2"
          , question = "what is the capital of Brazil?"
          , answer = "Brasilia"
          , answerVisible = False
          }
        ]
    , currentInput = ""
    , currentFlashCardId = Just "1"
    , answeredFlashCardIds = []
    , validationMessage = Nothing
    }
