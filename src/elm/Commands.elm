module Commands exposing (..)

import Student.Commands exposing (..)
import Game.Commands exposing (..)
import Tutor.Commands exposing (..)
import Routing exposing (Route(..))
import Messages exposing (Msg(..))


loadOnRouteChange : Route -> Cmd Msg
loadOnRouteChange route =
    case route of
        ClientRoute ->
            Cmd.map StudentMsg fetchStudent

        StudentPlayRoute ->
            Cmd.map GameMsg fetchQuestions

        TutorRoute ->
            Cmd.map TutorMsg fetchTutor
        _ ->
            Cmd.none
