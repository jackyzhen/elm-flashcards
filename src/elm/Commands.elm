module Commands exposing (..)

import Student.Commands exposing (..)
import Game.Commands exposing (..)
import Tutor.Commands exposing (..)
import Flashcards.Commands exposing (..)
import Routing exposing (Route(..))
import Messages exposing (Msg(..))
import History.Commands exposing (..)


loadOnRouteChange : Route -> Cmd Msg
loadOnRouteChange route =
    case route of
        ClientRoute ->
            Cmd.map StudentMsg fetchStudent

        StudentPlayRoute ->
            Cmd.batch [ Game.Commands.fetchQuestions, Game.Commands.fetchSessions]
                |> Cmd.map GameMsg

        TutorRoute ->
            Cmd.map TutorMsg fetchTutor

        TutorStudentsRoute ->
            Cmd.map StudentMsg fetchStudent

        TutorFlashCardsRoute ->
            Cmd.map FlashcardMsg fetchFlashcards
            
        StudentHistoryRoute ->
            Cmd.batch [ History.Commands.fetchQuestions, History.Commands.fetchAnswers ]
            |> Cmd.map HistoryMsg

        EditFlashCardRoute id ->
            Cmd.map FlashcardMsg fetchFlashcards

        _ ->
            Cmd.none
