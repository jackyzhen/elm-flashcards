module Messages exposing (..)

import Navigation exposing (Location)
import Home.Messages
import Student.Messages
import Tutor.Messages
import Game.Messages
import Flashcards.Messages
import History.Messages


type Msg
    = OnLocationChange Location
    | HomeMsg Home.Messages.Msg
    | StudentMsg Student.Messages.Msg
    | TutorMsg Tutor.Messages.Msg
    | GameMsg Game.Messages.Msg
    | FlashcardMsg Flashcards.Messages.Msg
    | HistoryMsg History.Messages.Msg
