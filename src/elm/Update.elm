module Update exposing (..)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (parseLocation)
import Home.Update
import Student.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        HomeMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Home.Update.update subMsg model
            in
                ( updatedModel, Cmd.map HomeMsg cmd )

        StudentMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Student.Update.update subMsg model
            in
                ( updatedModel, Cmd.map StudentMsg cmd )
