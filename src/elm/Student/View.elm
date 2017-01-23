module Student.View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Models exposing (Model)
import Student.Messages exposing (Msg(..))
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
    div [ class "container section" ]
        [ div [ class "link title", onClick ShowPlay ] [ text "Play" ]
        , div [ class "link title", onClick ShowHistory ] [ text "History" ]
        ]
