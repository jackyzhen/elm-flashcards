module Update exposing (..)

import Model exposing (Model)


type Msg
    = AddToList
    | RemoveFromList Int
    | UpdateCurrentListItem String
    | RemoveAll
    | CheckItem Int
    | KeyDown Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddToList ->
            if not (model.currentItem |> String.trim |> String.isEmpty) then
                { model | listOfItems = model.listOfItems ++ [ { item = model.currentItem, done = False } ], currentItem = "" }
            else
                model

        RemoveFromList index ->
            { model | listOfItems = (List.take index model.listOfItems) ++ (List.drop (index + 1) model.listOfItems) }

        UpdateCurrentListItem content ->
            { model | currentItem = content }

        RemoveAll ->
            { model | listOfItems = [] }

        CheckItem index ->
            { model
                | listOfItems =
                    List.indexedMap
                        (\currentIndex currentItem ->
                            if currentIndex == index then
                                { currentItem | done = not currentItem.done }
                            else
                                currentItem
                        )
                        model.listOfItems
            }

        KeyDown key ->
            if key == 13 then
                if not (model.currentItem |> String.trim |> String.isEmpty) then
                    { model | listOfItems = model.listOfItems ++ [ { item = model.currentItem, done = False } ], currentItem = "" }
                else
                    model
            else
                model
