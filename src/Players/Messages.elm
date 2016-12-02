module Players.Messages exposing(..)

import Http
import Players.Models exposing (PlayerId, Player)

type Msg
  = OnFetchAll (Result Http.Error (List Player))

-- THis is where we will put all the messages related to players


{-
NOTE:
  OnFetchAll will be called when we get the response from the server.
  This message will carry a Result which can be either an Http.Error
  or the the list of fetched players.
-}
