module Main exposing (..)

import Html exposing (..)
import Model exposing (Model, model)
import Update exposing (Msg, update)
import View exposing (view)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }
