module Main exposing (..)

import Html exposing (Html, div, text, program)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Players.Commands exposing (fetchAll)


-- Now that we have a command and a valid message to send our user lets update
-- init by showing the PlayersMsg (Error or Ok (JSON Status), and initialize the Fetch Command)

init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.map PlayersMsg fetchAll )



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- MAIN

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
