module Game.Update exposing (..)
import Game.FlashCard exposing (..)

import Game.Messages exposing (Msg)
import Game.Model exposing (..)
import Game.Commands exposing (..)

import Models.Session exposing (Session)
import Models.Answer exposing (Answer)

coerceString: Maybe String -> String
coerceString m = case m of 
      Just s -> s
      Nothing -> ""

getNextSessionId: List Session -> String
getNextSessionId sessions =
  sessions
  |> List.map (\s -> s.id)
  |> List.map (\s -> Result.withDefault 0 (String.toInt s))
  |> List.maximum
  |> (\id -> 
        case id of
        Just val -> (toString (val + 1))
        Nothing -> "1")

getCurrentFlashCard: Game.Model.Model -> Maybe Game.FlashCard.Model
getCurrentFlashCard model = 
  model.flashCards
  |> List.filter (\flashCard -> flashCard.id == (coerceString model.currentFlashCardId))
  |> List.head

updateFlashCard: List Game.FlashCard.Model -> Game.FlashCard.Model -> List Game.FlashCard.Model
updateFlashCard list newFlashCard =
  let
    replace currentFlashCard =
      if currentFlashCard.id == newFlashCard.id then
        newFlashCard
      else
        currentFlashCard
  in
    List.map replace list

getFlashCardId: Maybe Game.FlashCard.Model -> Maybe String
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
                        Game.FlashCard.update subMsg flashCard
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
                              , validationMessage = Nothing}
                      , Game.Commands.saveAnswer (Answer model.sessionId flashCard.id model.currentInput (model.sessionId ++ flashCard.id ++ model.currentInput) ) )
                  Nothing  -> (model, Cmd.none)
            )
        Game.Messages.OnFetchQuestions (Ok newFlashCards) ->
          ({model | flashCards = newFlashCards
                  , currentFlashCardId = (newFlashCards 
                                          |> List.head
                                          |> getFlashCardId)
            }, Cmd.none) 
        Game.Messages.OnFetchQuestions (Err error) ->
          (model, Cmd.none) --TODO: Do we actually do nothing if we cannot fetch questions?
        Game.Messages.OnFetchSessions (Ok sessions) ->
          let
            newSessionId = (getNextSessionId sessions)
          in
            ({model | sessionId = newSessionId}
            ,(Game.Commands.saveSession (Session newSessionId "" "") )) 
        Game.Messages.OnFetchSessions (Err error) ->
          (model, Cmd.none) --TODO: Do we actually do nothing if we cannot fetch sessions?
        Game.Messages.OnSessionSaved (Ok sessions) ->
          (model, Cmd.none) 
        Game.Messages.OnSessionSaved (Err error) ->
          (model, Cmd.none) 
        Game.Messages.OnAnswerSaved (Ok answers) ->
          (model, Cmd.none) 
        Game.Messages.OnAnswerSaved (Err error) ->
          (model, Cmd.none)
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
          ({initialModel 
            | flashCards = List.map (\x -> {x | answerVisible = False}) model.flashCards
            , currentFlashCardId = (model.flashCards
                  |> List.head
                  |> getFlashCardId)
          }
          , Game.Commands.fetchSessions)