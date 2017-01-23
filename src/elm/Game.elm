module Game exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Components.FlashCard exposing (..)

type alias Model =
    {
      flashCards: List Components.FlashCard.Model,
      currentInput: String,
      currentFlashCardId: String,
      answeredFlashCardIds: List String
    }

getCurrentFlashCard: Model -> Maybe Components.FlashCard.Model
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

init : ( Model, Cmd Msg )
init =
    ( {
        flashCards = [],
        currentInput = "",
        currentFlashCardId = "",
        answeredFlashCardIds = []
      }
      ,Cmd.none )



-- MESSAGES


type Msg
    = FlashCardMsg Components.FlashCard.Msg
    | OnAnswerSubmit String



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "gameContainer"]
        [ 
          let
            flashCardMaybe = (getCurrentFlashCard model)
          in
            case flashCardMaybe of
              Just flashCard -> Html.map FlashCardMsg (Components.FlashCard.view flashCard)
              Nothing -> div [ class "noCard" ] [ text "Flash Card Not Found"]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FlashCardMsg subMsg ->
          let
            flashCardMaybe = (getCurrentFlashCard model)
          in
            case flashCardMaybe of
              Just flashCard -> 
                let
                    ( updatedFlashCardModel, flashCardCmd ) =
                        Components.FlashCard.update subMsg flashCard
                in
                    ( { model | flashCards = (updateFlashCard model.flashCards updatedFlashCardModel)}, Cmd.map FlashCardMsg flashCardCmd )
              Nothing  -> (model, Cmd.none)
        OnAnswerSubmit answer ->
          (model, Cmd.none) --TODO: implement this action