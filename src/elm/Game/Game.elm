module Game.Game exposing (..)
import Components.FlashCard exposing (..)

import Game.Messages exposing (Msg)
import Game.Model exposing (Model)

getCurrentFlashCard: Game.Model.Model -> Maybe Components.FlashCard.Model
getCurrentFlashCard model = 
  model.flashCards
  |> List.filter (\flashCard -> flashCard.id == model.currentFlashCardId)
  |> List.head

updateFlashCard: List Components.FlashCard.Model -> Components.FlashCard.Model -> List Components.FlashCard.Model
updateFlashCard list newFlashCard =
  let
    replace currentFlashCard =
      if currentFlashCard.id == newFlashCard.id then
        newFlashCard
      else
        currentFlashCard
  in
    List.map replace list


update : Game.Messages.Msg -> Game.Model.Model -> ( Game.Model.Model, Cmd Game.Messages.Msg )
update msg model =
    case msg of
        Game.Messages.FlashCardMsg subMsg ->
          let
            flashCardMaybe = (getCurrentFlashCard model)
          in
            case flashCardMaybe of
              Just flashCard -> 
                let
                    ( updatedFlashCardModel, flashCardCmd ) =
                        Components.FlashCard.update subMsg flashCard
                in
                    ( { model | flashCards = (updateFlashCard model.flashCards updatedFlashCardModel)}, Cmd.map Game.Messages.FlashCardMsg flashCardCmd )
              Nothing  -> (model, Cmd.none)
        Game.Messages.OnAnswerSubmit answer ->
          (model, Cmd.none) --TODO: implement this action
        Game.Messages.SwapOutFlashCards newFlashCards ->
          ({model | flashCards = newFlashCards}, Cmd.none)
        Game.Messages.NextFlashCard ->
          (model, Cmd.none) -- TODO: implement this action