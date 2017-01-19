module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)


-- component import example

import Components.Hello exposing (hello)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { content : String
    , points : Int
    }


model : Model
model =
    { content = "", points = 0 }



-- UPDATE


type Msg
    = Change String
    | Point Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }

        Point newPoints ->
            { model | points = newPoints }



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container is-fluid" ]
        [ hello 6
        , div [] [ img [ src "static/img/elm.jpg", style styles.img ] [] ]
        , input [ placeholder "Story to point...", onInput Change ] []
        , button [ class "button is-primary", onClick (Point 0) ] [ text "0" ]
        , button [ class "button is-primary", onClick (Point 1) ] [ text "1" ]
        , button [ class "button is-primary", onClick (Point 2) ] [ text "2" ]
        , button [ class "button is-primary", onClick (Point 3) ] [ text "3" ]
        , button [ class "button is-primary", onClick (Point 5) ] [ text "5" ]
        , button [ class "button is-primary", onClick (Point 8) ] [ text "8" ]
        , button [ class "button is-primary", onClick (Point 13) ] [ text "13" ]
        , button [ class "button is-primary", onClick (Point 20) ] [ text "20" ]
        , button [ class "button is-primary", onClick (Point 40) ] [ text "40" ]
        , button [ class "button is-primary", onClick (Point 100) ] [ text "100" ]
        , div [] [ text ("Story: " ++ .content model) ]
          -- trying weird record property access syntax
        , div [] [ text ("Points: " ++ toString model.points) ]
        ]



-- INLINE CSS STYLES


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
