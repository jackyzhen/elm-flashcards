module Game.Messages exposing (..)

import Http exposing (Error)

import Game.FlashCard exposing (Msg, Model)

type Msg
    = FlashCardMsg Game.FlashCard.Msg
    | OnAnswerSubmit
    | OnAnswerUpdated String
    | NextFlashCard 
    | ResetGame
    | OnFetchQuestions (Result Http.Error (List Game.FlashCard.Model))