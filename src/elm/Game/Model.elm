module Game.Model exposing (..)

import Components.FlashCard


type alias Model =
    { flashCards : List Components.FlashCard.Model
    , currentInput : String
    , currentFlashCardId : String
    , answeredFlashCardIds : List String
    }


inititialModel : Model
inititialModel =
    { flashCards =
        [ { id = "1"
          , question = "what is the capital of china?"
          , answer = "Beijing"
          , answerVisible = False
          }
        ]
    , currentInput = ""
    , currentFlashCardId = "1"
    , answeredFlashCardIds = []
    }
