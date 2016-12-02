module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlayersMsg subMsg ->
            let
                ( updatedPlayers, cmd ) =
                    Players.Update.update subMsg model.players
            in
                ( { model | players = updatedPlayers }, Cmd.map PlayersMsg cmd )


{-
  NOTE: All PlayersMsg are routed to Players.Update.
        We extract the result for Players.Update using pattern matching
        Return the model with the updated player list and any command that needs to run.
-}
