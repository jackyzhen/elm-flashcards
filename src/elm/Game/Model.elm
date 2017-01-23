module Game.Model exposing (..)

import Components.FlashCard exposing (Model)

type alias Model =
    {
      flashCards: List Components.FlashCard.Model,
      currentInput: String,
      currentFlashCardId: String,
      answeredFlashCardIds: List String
    }