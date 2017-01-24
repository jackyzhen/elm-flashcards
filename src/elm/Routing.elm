module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = HomeRoute
    | ClientRoute
    | TutorRoute
    | TutorStudentsRoute
    | TutorFlashCardsRoute
    | EditFlashCardRoute String
    | NotFoundRoute
    | StudentPlayRoute
    | StudentHistoryRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map ClientRoute (s "client")
        , map TutorRoute (s "tutor")
        , map TutorStudentsRoute (s "tutor" </> s "students")
        , map TutorFlashCardsRoute (s "tutor" </> s "flashcards")
        , map EditFlashCardRoute (s "tutor" </> s "flashcards" </> string)
        , map StudentPlayRoute (s "client" </> s "play")
        , map StudentHistoryRoute (s "client" </> s "history")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
