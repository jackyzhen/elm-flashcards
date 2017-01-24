module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Route(..))
import Home.View
import Student.View
import Tutor.View
import Game.View
import Flashcards.List
import Flashcards.Models exposing (FlashcardId)
import Flashcards.Single


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
            Html.map FlashcardMsg (Flashcards.List.view model.flashcards)

        EditFlashCardRoute flashcardId ->
            flashcardEditPage model flashcardId

        StudentHistoryRoute ->
            notFoundView

        NotFoundRoute ->
            notFoundView


flashcardEditPage : Model -> FlashcardId -> Html Msg
flashcardEditPage model flashcardId =
    let
        maybeFlashcard =
            model.flashcards
                |> List.filter (\card -> card.id == flashcardId)
                |> List.head
    in
        case maybeFlashcard of
            Just card ->
                Html.map FlashcardMsg (Flashcards.Single.view card model)

            Nothing ->
                notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
