module Student.Update exposing (..)

import Student.Messages exposing (Msg(..))
import Models exposing (Model)
import Navigation


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        ShowPlay ->
            ( model, Navigation.newUrl "/client/play" )

        ShowHistory ->
            ( model, Navigation.newUrl "/client/history" )
