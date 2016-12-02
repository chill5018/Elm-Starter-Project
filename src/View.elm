module View exposing (..)

import Html exposing (Html, div, text)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.List

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
  Html.map PlayersMsg (Players.List.view model.players)



{-
import Messages exposing (Msg) --> import Messages exposing (Msg(..))

NOTE: This bug was resolved by the above changes
Cannot find variable `PlayerMsg`

18|   Html.map PlayerMsg (Players.List.view model.players)
               ^^^^^^^^^
Maybe you want one of the following?

    Messages.PlayerMsg

-}
