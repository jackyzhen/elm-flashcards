module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import Model exposing (Model)
import Update exposing (Msg)


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)


view : Model -> Html Msg
view model =
    let
        checkboxClass item =
            if item.done then
                "done"
            else
                "not"

        checkBox index item =
            li
                [ class "level listItem" ]
                [ div [ class "level-item" ]
                    [ button [ onClick (Update.RemoveFromList index), class "button is-danger is-outlined" ]
                        [ text "X" ]
                    ]
                , div [ class "level-item text-align-left" ]
                    [ span [ onClick (Update.CheckItem index), class ((checkboxClass item)) ]
                        [ text item.item
                        ]
                    ]
                ]

        checkBoxes listOfItems =
            ul [] (List.indexedMap checkBox listOfItems)
    in
        div []
            [ section [ class "hero is-light" ]
                [ div [ class "hero-body" ]
                    [ div [ class "container" ]
                        [ h1 [ class "title" ]
                            [ text "Elm Todo List" ]
                        ]
                    ]
                ]
            , section
                [ class "section" ]
                [ div [ class "container" ]
                    [ p [ class "control has-addons" ]
                        [ input
                            [ class "input is-primary is-large"
                            , id "mainInput"
                            , onInput Update.UpdateCurrentListItem
                            , placeholder "New item..."
                            , value model.currentItem
                            , onKeyDown Update.KeyDown
                            ]
                            []
                        , button [ onClick Update.AddToList, class "button is-primary is-large" ] [ text "Add" ]
                        , button [ onClick Update.RemoveAll, class "button is-danger is-large" ] [ text "Remove All" ]
                        ]
                    , div [ class "checkListProgress subtitle" ]
                        [ text
                            ((model.listOfItems |> List.filter (\item -> item.done) |> List.length |> toString)
                                ++ " / "
                                ++ (model.listOfItems |> List.length |> toString)
                                ++ " done"
                            )
                        ]
                    , div [] [ (checkBoxes model.listOfItems) ]
                    ]
                ]
            ]
