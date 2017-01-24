module History.Models exposing (..)
import Models.Question exposing (Question)
import Models.Answer exposing (Answer)

type alias AnswerModel =
    { id : String
    , question: String
    , answer : String
    , sessionId: String
    }

type alias HistoryModel = {
  answers: List Answer,
  questions: List Question
}

initialModel: HistoryModel
initialModel = 
  {
    answers = [],
    questions = []
  }