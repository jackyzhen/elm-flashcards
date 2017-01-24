module Student.Update exposing (..)

import Student.Messages exposing (Msg(..))
import Student.Models exposing (Student)
import Navigation


update : Msg -> List Student -> ( List Student, Cmd Msg )
update message students =
    case message of
        ShowPlay ->
            ( students, Navigation.newUrl "/client/play" )

        ShowHistory ->
            ( students, Navigation.newUrl "/client/history" )

        ShowTutor ->
            ( students, Navigation.newUrl "/tutor/" )

        OnFetchStudent (Ok students) ->
            ( students, Cmd.none )

        OnFetchStudent (Err error) ->
            ( students, Cmd.none )
