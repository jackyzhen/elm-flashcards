module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Route(..))
import Home.View
import Student.View
import Tutor.View
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
            Html.map StudentMsg (Student.View.view model.students)

        TutorRoute ->
            Html.map TutorMsg (Tutor.View.view model.tutor)

        StudentPlayRoute ->
            Html.map GameMsg (Game.View.view model.game)

        TutorStudentsRoute ->
            Html.map StudentMsg (Student.View.listView model.students)

        TutorFlashCardsRoute ->
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
