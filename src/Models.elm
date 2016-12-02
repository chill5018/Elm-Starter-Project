module Models exposing (..)

import Players.Models exposing (Player)

type alias Model =
  { players : List Player
  }


initialModel : Model
initialModel =
  -- this is a player constructor where Player
  -- {(obj) (param1) (param2) (param3)}
  { players = [ Player "1" "Sam" 1]
  }
