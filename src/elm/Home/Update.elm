module Home.Update exposing (..)

import Home.Messages exposing (Msg(..))
import Models exposing (Model)
import Navigation


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        ShowClient ->
            ( model, Navigation.newUrl "/client" )

        ShowTutor ->
            ( model, Navigation.newUrl "/tutor" )
