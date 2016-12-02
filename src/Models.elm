module Models exposing (..)

import Players.Models exposing (Player)

type alias Model =
  { players : List Player
  }


initialModel : Model
initialModel =
  -- this is a player constructor where Player []
  -- becomes a new player
  { players = []
  }
