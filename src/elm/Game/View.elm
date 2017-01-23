module Game.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Components.FlashCard exposing (view)
import Game.Model exposing (Model)
import Game.Messages exposing (Msg)
import Game.Update exposing (getCurrentFlashCard)


view : Model -> Html Msg
view model =
    div [ class "section" ]
        [ (let
            flashCardMaybe =
                (getCurrentFlashCard model)
          in
            case flashCardMaybe of
                Just flashCard ->
                    div [] [
                      Html.map Game.Messages.FlashCardMsg (Components.FlashCard.view flashCard),
                      (case model.validationMessage of
                        Just message -> div [ class "validationMessage" ] [ text message ]
                        Nothing -> text ""),
                      div [ class "" ] [
                        input [ class "control answerBox input", placeholder "Enter your answer", onInput Game.Messages.OnAnswerUpdated ] [],
                        button [ class "control submitButton button is-primary", onClick Game.Messages.OnAnswerSubmit ] [text "Submit"],
                        (if flashCard.answerVisible 
                            then button [ class "control nextButton button is-secondary" ] [ text "Next" ]
                            else text ""
                        )
                      ]
                    ]
                Nothing ->
                    div [ class "noCard" ] [ text "Flash Card Not Found" ]
          )
        ]
