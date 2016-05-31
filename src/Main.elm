port module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }
    

type alias Model =
    { counter: Int
    , words: String
    }    
    
    
model =
    { counter = 0
    , words = ""
    }
    
type Msg 
    = Dec 
    | Inc
    | Words String
 
 
port words : String -> Cmd msg


-- update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Inc ->
      ({ model | 
            counter = model.counter + 1
            , words = "bar" }, Cmd.none )

    Dec ->
      ({ model | 
            counter = model.counter - 1
            , words = "foo" }, Cmd.none)
      
    Words wrds ->
        (model, words model.words)

        
        
            

view model =
  div []
    [ button [ onClick Dec ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Inc ] [ text "+" ]
    , div [] [ text model.words ]
    ]   