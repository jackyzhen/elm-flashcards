module Student.Update exposing (..)

import Student.Messages exposing (Msg(..))
import Student.Models exposing (Student)
import Navigation


update : Msg -> Maybe Student -> ( Maybe Student, Cmd Msg )
update message student =
    case message of
        ShowPlay ->
            ( student, Navigation.newUrl "/client/play" )

        ShowHistory ->
            ( student, Navigation.newUrl "/client/history" )

        OnFetchStudent (Ok students) ->
            ( List.head students, Cmd.none )

        OnFetchStudent (Err error) ->
            ( student, Cmd.none )
