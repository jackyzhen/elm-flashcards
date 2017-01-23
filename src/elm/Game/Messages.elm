module Game.Messages exposing (..)

import Components.FlashCard exposing (Msg, Model)

type Msg
    = FlashCardMsg Components.FlashCard.Msg
    | OnAnswerSubmit
    | OnAnswerUpdated String
    | SwapOutFlashCards (List Components.FlashCard.Model)
    | NextFlashCard 
    | ResetGame