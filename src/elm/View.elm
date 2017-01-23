module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Route(..))
import Home.View
import Student.View


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            Html.map HomeMsg (Home.View.view model)

        ClientRoute ->
            Html.map StudentMsg (Student.View.view model)

        TutorRoute ->
            tutorView

        StudentPlayRoute ->
            notFoundView

        StudentHistoryRoute ->
            notFoundView

        NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]


studentView : Html msg
studentView =
    div []
        [ text "student"
        ]


tutorView : Html msg
tutorView =
    div []
        [ text "tutor"
        ]
