module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Route(..))
import Home.View
import Student.View
import Game.View


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
            Html.map StudentMsg (Student.View.view model.student)

        TutorRoute ->
            tutorView

        StudentPlayRoute ->
            Html.map GameMsg (Game.View.view model.game)

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
