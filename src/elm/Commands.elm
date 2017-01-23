module Commands exposing (..)

import Student.Commands exposing (..)
import Routing exposing (Route(..))
import Messages exposing (Msg(..))


loadOnRouteChange : Route -> Cmd Msg
loadOnRouteChange route =
    case route of
        ClientRoute ->
            Cmd.map StudentMsg fetchStudent

        _ ->
            Cmd.none
