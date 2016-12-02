module Players.Update exposing (..)

import Players.Messages exposing (Msg(..))
import Players.Models exposing (Player)


update : Msg -> List Player -> ( List Player, Cmd Msg )
update message players =
    case message of
        OnFetchAll (Ok newPlayers) ->
            ( newPlayers, Cmd.none )

        OnFetchAll (Err error) ->
            ( players, Cmd.none )


{-
NOTE:
  In the Ok case we return the fetched players in order to update the players collection.
  In the Err case we just return what we had before for now
  (A better approach would be to show an error to the user, but for
  simplicity of the tutorial we won't be doing this now).
-}
