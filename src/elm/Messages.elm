module Messages exposing (..)

import Navigation exposing (Location)
import Home.Messages


type Msg
    = OnLocationChange Location
    | HomeMsg Home.Messages.Msg
