module Models.Answer exposing (..)

type alias Answer = {
  sessionId: String,
  questionId: String,
  answer: String,
  id: String
}