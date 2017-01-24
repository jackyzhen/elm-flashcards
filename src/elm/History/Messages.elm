module History.Messages exposing (..)

import Http
import Models.Answer exposing (Answer)
import Models.Question exposing (Question)


type Msg
    = OnFetchAnswers (Result Http.Error (List Answer))
    | OnFetchQuestions (Result Http.Error (List Question))
