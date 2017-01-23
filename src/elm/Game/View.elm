module Game.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components.FlashCard exposing (view)

import Game.Model exposing (Model)
import Game.Messages exposing (Msg)
import Game.Game exposing (getCurrentFlashCard)

init : ( Model, Cmd Msg )
init =
    ( {
        flashCards = [],
        currentInput = "",
        currentFlashCardId = "",
        answeredFlashCardIds = []
      }
      ,Cmd.none )

view : Model -> Html Msg
view model =
    div [ class "gameContainer"]
        [ 
          let
            flashCardMaybe = (getCurrentFlashCard model)
          in
            case flashCardMaybe of
              Just flashCard -> Html.map Game.Messages.FlashCardMsg (Components.FlashCard.view flashCard)
              Nothing -> div [ class "noCard" ] [ text "Flash Card Not Found"]
        ]
