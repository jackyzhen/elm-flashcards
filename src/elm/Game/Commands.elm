module Game.Commands exposing (..)

import Http exposing (get, post, send, Body)
import Game.Messages exposing (Msg)

import Decoders.Questions exposing (collectionQuestionDecoder)
import Decoders.Sessions exposing (collectionSessionDecoder, memberSessionEncoder)
import Decoders.Answers exposing (collectionAnswerDecoder, memberAnswerEncoder)

import Models.Session exposing (Session)
import Models.Answer exposing (Answer)

-- QUESTIONS
questionsUrl : String
questionsUrl =
    "http://localhost:4000/questions"

fetchQuestions : Cmd Msg
fetchQuestions =
    get questionsUrl collectionQuestionDecoder
        |> send Game.Messages.OnFetchQuestions


-- SESSIONS

sessionsUrl : String
sessionsUrl =
    "http://localhost:4000/sessions"

fetchSessions : Cmd Msg
fetchSessions =
    get sessionsUrl collectionSessionDecoder
        |> send Game.Messages.OnFetchSessions

saveSession: Session -> Cmd Msg
saveSession session =
  ((session
  |> memberSessionEncoder
  |> Http.jsonBody
  |> post sessionsUrl) collectionSessionDecoder)
  |> send Game.Messages.OnSessionSaved

-- ANSWERS

answersUrl : String
answersUrl =
    "http://localhost:4000/answers"

saveAnswer: Answer -> Cmd Msg
saveAnswer answer =
  ((answer
  |> memberAnswerEncoder
  |> Http.jsonBody
  |> post answersUrl) collectionAnswerDecoder)
  |> send Game.Messages.OnAnswerSaved