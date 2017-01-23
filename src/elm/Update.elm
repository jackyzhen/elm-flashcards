module Update exposing (..)

import Models exposing (Model)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (parseLocation)
import Home.Update
import Student.Update
import Game.Update
import Tutor.Update
import Flashcards.Update
import Commands exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, loadOnRouteChange newRoute )

        HomeMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Home.Update.update subMsg model
            in
                ( updatedModel, Cmd.map HomeMsg cmd )

        StudentMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Student.Update.update subMsg model.students
            in
                ( { model | students = updatedModel }, Cmd.map StudentMsg cmd )

        GameMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Game.Update.update subMsg model.game
            in
                ( { model | game = updatedModel }, Cmd.map GameMsg cmd )

        TutorMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Tutor.Update.update subMsg model.tutor
            in
                ( { model | tutor = updatedModel }, Cmd.map TutorMsg cmd )

        FlashcardMsg subMsg ->
            let
                ( updatedModel, cmd ) =
                    Flashcards.Update.update subMsg model.flashcards
            in
                ( { model | flashcards = updatedModel }, Cmd.map FlashcardMsg cmd )
