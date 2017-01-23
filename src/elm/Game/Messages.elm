module Game.Messages exposing (..)

import Http exposing (Error)

import Game.FlashCard exposing (Msg, Model)
import Models.Session exposing (Session)
import Models.Answer exposing (Answer)

type Msg
    = FlashCardMsg Game.FlashCard.Msg
    | OnAnswerSubmit
    | OnAnswerUpdated String
    | NextFlashCard 
    | ResetGame
    | OnFetchQuestions (Result Http.Error (List Game.FlashCard.Model))
    | OnFetchSessions (Result Http.Error (List Session))
    | OnSessionSaved (Result Http.Error (List Session))
    | OnAnswerSaved (Result Http.Error (List Answer))