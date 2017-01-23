module Tutor.Update exposing (..)

import Tutor.Messages exposing (Msg(..))
import Tutor.Models exposing (Tutor)
import Navigation


update : Msg -> Maybe Tutor -> ( Maybe Tutor, Cmd Msg )
update message tutor =
    case message of
        ShowStudents ->
            ( tutor, Navigation.newUrl "/tutor/students" )

        ShowFlashCards ->
            ( tutor, Navigation.newUrl "/tutor/flashcards" )

        OnFetchTutor (Ok tutors) ->
            ( List.head tutors, Cmd.none )

        OnFetchTutor (Err error) ->
            ( tutor, Cmd.none )
