module Models.Question exposing (..)

type alias Question = {
  id: String,
  question: String,
  subjectId: String,
  answer: String
}