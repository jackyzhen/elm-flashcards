module Game.Commands exposing (..)

import Http
import Game.Messages exposing (Msg)

import Decoders.Questions exposing (collectionQuestionDecoder)
import Decoders.Sessions exposing (collectionSessionDecoder)

-- QUESTIONS
questionsUrl : String
questionsUrl =
    "http://localhost:4000/questions"

fetchQuestions : Cmd Msg
fetchQuestions =
    Http.get questionsUrl collectionQuestionDecoder
        |> Http.send Game.Messages.OnFetchQuestions


-- SESSIONS

sessionsUrl : String
sessionsUrl =
    "http://localhost:4000/sessions"

fetchSessions : Cmd Msg
fetchSessions =
    Http.get sessionsUrl collectionSessionDecoder
        |> Http.send Game.Messages.OnFetchSessions



-- ANSWERS

answersUrl : String
answersUrl =
    "http://localhost:4000/answers"