module Tutor.View exposing (..)

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Tutor.Models exposing (Tutor)
import Tutor.Messages exposing (Msg(..))
import Html.Events exposing (onClick)


view : Maybe Tutor -> Html Msg
view tutor =
    div [ class "container section" ]
        [ div [ class "nav-center section subtitle" ] [ tutorDisplay tutor ]
        , div [ class "tutor-options" ]
            [ div [ class "tutor-option" ]
                [ button [ class "button is-info is-large is-outlined", onClick ShowStudents ] [ text "Students" ] ]
            , div [ class "tutor-option" ]
                [ button [ class "button is-info is-large is-outlined", onClick ShowFlashCards ] [ text "Flash Cards" ]
                ]
            ]
        ]


tutorDisplay : Maybe Tutor -> Html Msg
tutorDisplay tutor =
    case tutor of
        Nothing ->
            text ""

        Just value ->
            text ("Welcome " ++ value.name ++ "...")
