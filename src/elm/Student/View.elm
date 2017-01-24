module Student.View exposing (..)

import Html exposing (Html, div, text, button, table, thead, tbody, th, tr, td, abbr)
import Html.Attributes exposing (class, title)
import Student.Models exposing (Student)
import Student.Messages exposing (Msg(..))
import Html.Events exposing (onClick)


view : List Student -> Html Msg
view students =
    div [ class "container section" ]
        [ div [ class "nav-center section subtitle" ] [ studentDisplay students ]
        , div [ class "student-options" ]
            [ div [ class "student-option" ]
                [ button [ class "button is-info is-large is-outlined", onClick ShowPlay ] [ text "Play" ] ]
            , div [ class "student-option" ]
                [ button [ class "button is-info is-large is-outlined", onClick ShowHistory ] [ text "History" ]
                ]
            ]
        ]


studentDisplay : List Student -> Html Msg
studentDisplay students =
    case (List.head students) of
        Nothing ->
            text ""

        Just value ->
            text ("Welcome " ++ value.name ++ "...")


listView : List Student -> Html Msg
listView students =
    div [ class "container section" ]
        [ div [ class "nav" ] [ button [ class "button is-link", onClick ShowTutor ] [ text "<-Tutor" ] ]
        , table [ class "table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "ID" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Subject" ]
                    ]
                ]
            , tbody [] (List.map listViewRow students)
            ]
        ]


listViewRow : Student -> Html Msg
listViewRow student =
    tr []
        [ td [] [ text student.id ]
        , td [] [ text student.name ]
        , td [] [ text student.subject ]
        ]
