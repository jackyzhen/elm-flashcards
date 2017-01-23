module Components.FlashCard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

type alias Model =
    {
      id: String,
      question: String,
      answer: String,
      answerVisible: Bool
    }


init : ( Model, Cmd Msg )
init =
    ( {
        id = "",
        question = "",
        answer = "",
        answerVisible = False
      }
      ,Cmd.none )



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "flashCard"]
        [ 
          h2 [ class "question"] [text model.question],
          h3 [ class "answer" ] [text (if model.answerVisible then model.answer else "")]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp -> (model, Cmd.none)