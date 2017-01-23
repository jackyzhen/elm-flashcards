module Game.Commands exposing (..)

import Http
import Game.Messages exposing (Msg)

import Decoders.Questions exposing (collectionQuestionDecoder)

-- QUESTIONS
fetchQuestionsUrl : String
fetchQuestionsUrl =
    "http://localhost:4000/questions"

fetchQuestions : Cmd Msg
fetchQuestions =
    Http.get fetchQuestionsUrl collectionQuestionDecoder
        |> Http.send Game.Messages.OnFetchQuestions


-- SESSIONS

fetchSessionsUrl : String
fetchSessionsUrl =
    "http://localhost:4000/sessions"


-- ANSWERS

fetchAnswersUrl : String
fetchAnswersUrl =
    "http://localhost:4000/answers"