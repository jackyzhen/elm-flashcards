module History.View exposing (..)

import Html exposing (Html, div, text, button, table, thead, tbody, th, tr, td, abbr)
import Html.Attributes exposing (class, title)
import History.Models exposing (AnswerModel)
import History.Messages exposing (Msg(..))
import Html.Events exposing (onClick)


view : List AnswerModel -> Html Msg
view answers =
    div [ class "container section" ]
        [ 
          text ""
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


listViewRow : Answer -> Html Msg
listViewRow answer =
    tr []
        [ td [] [ text answer.sessionId ]
        , td [] [ text answer.question ]
        , td [] [ text answer.answer ]
        ]
