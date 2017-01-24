module History.View exposing (..)

import Html exposing (Html, div, text, button, table, thead, tbody, th, tr, td, abbr)
import Html.Attributes exposing (class, title)
import History.Models exposing (AnswerModel, HistoryModel)
import History.Messages exposing (Msg(..))
import Models.Answer exposing (Answer)
import Models.Question exposing (Question)

getQuestionTextForAnswer: List Question -> String -> String
getQuestionTextForAnswer questions answerId = 
  questions
  |> List.filter (\q -> q.id == answerId)
  |> List.head
  |> Maybe.map (\q -> q.question)
  |> Maybe.withDefault "Question Not Available"

getAnswerModels: List Answer -> List Question -> List AnswerModel
getAnswerModels answers questions =
  let
    questionRetriever = getQuestionTextForAnswer questions
  in
    answers
    |> List.map (\a -> (AnswerModel 
                          a.id 
                          (questionRetriever a.questionId) 
                          a.answer 
                          a.sessionId) )

view : HistoryModel -> Html Msg
view model =
    div [ class "container section" ]
        [ 
          getAnswerModels model.answers model.questions
          |> listView
        ]



listView : List AnswerModel -> Html Msg
listView answers =
    div [ class "container section" ]
        [ table [ class "table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "Session ID" ]
                    , th [] [ text "Question" ]
                    , th [] [ text "Answer" ]
                    ]
                ]
            , tbody [] (List.map listViewRow answers)
            ]
        ]


listViewRow : AnswerModel -> Html Msg
listViewRow answer =
    tr []
        [ td [] [ text answer.sessionId ]
        , td [] [ text answer.question ]
        , td [] [ text answer.answer ]
        ]
