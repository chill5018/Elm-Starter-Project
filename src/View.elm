module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg)
import Models exposing (Model)

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ text model ]
