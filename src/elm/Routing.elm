module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = HomeRoute
    | ClientRoute
    | TutorRoute
    | NotFoundRoute
    | StudentPlayRoute
    | StudentHistoryRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map ClientRoute (s "client")
        , map TutorRoute (s "tutor")
        , map StudentPlayRoute (s "client" </> s "play")
        , map StudentHistoryRoute (s "history")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
