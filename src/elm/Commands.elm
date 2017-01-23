module Commands exposing (..)

import Student.Commands exposing (..)
import Game.Commands exposing (..)
import Tutor.Commands exposing (..)
import Flashcards.Commands exposing (..)
import Routing exposing (Route(..))
import Messages exposing (Msg(..))


loadOnRouteChange : Route -> Cmd Msg
loadOnRouteChange route =
    case route of
        ClientRoute ->
            Cmd.map StudentMsg fetchStudent

        StudentPlayRoute ->
            Cmd.batch [ fetchQuestions, fetchSessions ]
                |> Cmd.map GameMsg

        TutorRoute ->
            Cmd.map TutorMsg fetchTutor

        TutorStudentsRoute ->
            Cmd.map StudentMsg fetchStudent

        TutorFlashCardsRoute ->
            Cmd.map FlashcardMsg fetchFlashcards

        EditFlashCardRoute id ->
            Cmd.map FlashcardMsg fetchFlashcards

        _ ->
            Cmd.none
