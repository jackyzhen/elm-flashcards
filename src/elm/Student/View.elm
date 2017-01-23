module Student.View exposing (..)

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Student.Models exposing (Student)
import Student.Messages exposing (Msg(..))
import Html.Events exposing (onClick)


view : Maybe Student -> Html Msg
view student =
    div [ class "container section" ]
        [ div [ class "nav-center section subtitle" ] [ studentDisplay student ]
        , div [ class "student-options" ]
            [ div [ class "student-option" ]
                [ button [ class "button is-info is-large is-outlined", onClick ShowPlay ] [ text "Play" ] ]
            , div [ class "student-option" ]
                [ button [ class "button is-info is-large is-outlined", onClick ShowHistory ] [ text "History" ]
                ]
            ]
        ]


studentDisplay : Maybe Student -> Html Msg
studentDisplay student =
    case student of
        Nothing ->
            text ""

        Just value ->
            text ("Welcome " ++ value.name ++ "...")
