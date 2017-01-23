module Game.Messages exposing (..)

import Http exposing (Error)

import Game.FlashCard exposing (Msg, Model)
import Models.Session exposing (Session)

type Msg
    = FlashCardMsg Game.FlashCard.Msg
    | OnAnswerSubmit
    | OnAnswerUpdated String
    | NextFlashCard 
    | ResetGame
    | OnFetchQuestions (Result Http.Error (List Game.FlashCard.Model))
    | OnFetchSessions (Result Http.Error (List Session))