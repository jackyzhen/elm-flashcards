module History.Commands exposing (..)

import Http exposing (get, send, Body)
import Decoders.Answers exposing (collectionAnswerDecoder)
import Decoders.Questions exposing (collectionModelQuestionDecoder)
import History.Messages exposing (..)


answersUrl : String
answersUrl =
    "http://localhost:4000/answers"

fetchAnswers : Cmd Msg
fetchAnswers =
    get answersUrl collectionAnswerDecoder
        |> send History.Messages.OnFetchAnswers

questionsUrl : String
questionsUrl =
    "http://localhost:4000/questions"

fetchQuestions : Cmd Msg
fetchQuestions =
    get questionsUrl collectionModelQuestionDecoder
        |> send History.Messages.OnFetchQuestions