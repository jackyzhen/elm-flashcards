module Home.View exposing (..)

import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class)
import Models exposing (Model)
import Home.Messages exposing (Msg(..))
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
    div [ class "container section" ]
        [ div [ onClick ShowClient, class "home-link title" ] [ text "Student" ]
        , div [ onClick ShowTutor, class "home-link title" ] [ text "Tutors" ]
        ]
