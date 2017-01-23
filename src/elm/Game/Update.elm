module Game.Update exposing (..)
import Components.FlashCard exposing (..)

import Game.Messages exposing (Msg)
import Game.Model exposing (Model)

coerceString: Maybe String -> String
coerceString m = case m of 
      Just s -> s
      Nothing -> ""

getCurrentFlashCard: Game.Model.Model -> Maybe Components.FlashCard.Model
getCurrentFlashCard model = 
  model.flashCards
  |> List.filter (\flashCard -> flashCard.id == (coerceString model.currentFlashCardId))
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

getFlashCardId: Maybe Components.FlashCard.Model -> Maybe String
getFlashCardId flashCard =
  case flashCard of
    Just fc -> Just fc.id
    Nothing -> Nothing

getNextFlashCardId: Game.Model.Model -> Maybe String
getNextFlashCardId model =
  let usedFlashCardIds = 
    (coerceString model.currentFlashCardId) :: model.answeredFlashCardIds
  in
    model.flashCards
    |> List.filter (\x -> (not (List.member x.id usedFlashCardIds)))
    |> List.head
    |> getFlashCardId

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
        Game.Messages.OnAnswerUpdated answer -> 
          ({ model | currentInput = answer }, Cmd.none)
        Game.Messages.OnAnswerSubmit ->
          if (String.isEmpty model.currentInput)
          then
            ({model | validationMessage = Just "Answer must not be empty."}, Cmd.none)
          else
            (
              let
                flashCardMaybe = (getCurrentFlashCard model)
              in
                case flashCardMaybe of
                  Just flashCard -> 
                    ( { model | flashCards = (updateFlashCard model.flashCards {flashCard | answerVisible = True })
                              , validationMessage = Nothing}, Cmd.none )
                  Nothing  -> (model, Cmd.none)
            )
        Game.Messages.SwapOutFlashCards newFlashCards ->
          ({model | flashCards = newFlashCards}, Cmd.none)
        Game.Messages.NextFlashCard ->
          let
            nextFlashCardId = getNextFlashCardId model
          in
            ({ model | currentFlashCardId = nextFlashCardId
                      ,answeredFlashCardIds = (coerceString model.currentFlashCardId) :: model.answeredFlashCardIds
                      ,isGameComplete = (case nextFlashCardId of
                                          Just id -> False
                                          Nothing -> True
                                        )
              }
            , Cmd.none)
        Game.Messages.ResetGame ->
          (model, Cmd.none) --TODO: Implement this function properly.