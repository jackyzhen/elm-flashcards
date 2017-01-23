module Flashcards.Single exposing (..)

import Flashcards.Models exposing (Flashcard)
import Flashcards.Messages exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Flashcard -> Html Msg
view flashcard =
    div [ class "container section" ]
        [ label [ class "label" ] [ text "Subject" ]
        , p [ class "control" ]
            [ input [ class "input", type_ "text", placeholder "Maths..", value flashcard.subject ] []
            ]
        , label [ class "label" ] [ text "Question" ]
        , p [ class "control" ]
            [ input [ class "input", type_ "text", placeholder "What is 2+2?", value flashcard.question ] []
            ]
        , label [ class "label" ] [ text "Answer" ]
        , p [ class "control" ]
            [ input [ class "input", type_ "text", placeholder "2+2 = 4?", value flashcard.answer ] []
            ]
        , div [ class "control is-grouped" ]
            [ p [ class "control" ] [ button [ class "button is-primary" ] [ text "Submit" ] ]
            , p [ class "control" ] [ button [ class "button is-link", onClick ShowFlashCards ] [ text "Cancel" ] ]
            ]
        ]
