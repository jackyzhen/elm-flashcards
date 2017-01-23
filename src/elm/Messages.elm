module Messages exposing (..)

import Navigation exposing (Location)
import Home.Messages
import Student.Messages
import Game.Messages


type Msg
    = OnLocationChange Location
    | HomeMsg Home.Messages.Msg
    | StudentMsg Student.Messages.Msg
    | GameMsg Game.Messages.Msg
