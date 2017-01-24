module Flashcards.List exposing (..)

import Flashcards.Models exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Flashcards.Messages exposing (Msg(..))


view : List Flashcard -> Html Msg
view flashcards =
    div [ class "container section" ]
        [ div [ class "nav" ] [ button [ class "button is-link", onClick ShowTutor ] [ text "<-Tutor" ] ]
        , table [ class "table" ]
            [ thead []
                [ tr []
                    [ th [] [ text "Subject" ]
                    , th [] [ text "Question" ]
                    , th [] [ text "Answer" ]
                    ]
                ]
            , tbody [] (List.map flashcardRow flashcards)
            ]
        ]


flashcardRow : Flashcard -> Html Msg
flashcardRow flashcard =
    tr [ class "link", onClick (ViewEditFlashcard flashcard.id) ]
        [ td [] [ text flashcard.subject ]
        , td [] [ text flashcard.question ]
        , td [] [ text flashcard.answer ]
        ]
