module History.Update exposing (..)

import History.Messages exposing (Msg(..))
import History.Models exposing (AnswerModel, HistoryModel)
import Navigation


update : Msg -> HistoryModel -> ( HistoryModel, Cmd Msg )
update message model =
    case message of
        OnFetchAnswers (Ok answers) ->
            ( { model | answers = answers }, Cmd.none )

        OnFetchAnswers (Err error) ->
            ( model, Cmd.none )

        OnFetchQuestions (Ok questions) ->
            ( { model | questions = questions }, Cmd.none )

        OnFetchQuestions (Err error) ->
            ( model, Cmd.none )

        ShowClient ->
            ( model, Navigation.newUrl "/client" )
