module Players.Models exposing (..)

-- Here we define how a player record looks.
-- It has an id, a name and a level.

type alias PlayerId
  = String

type alias Player =
  { id : PlayerId
  , name : String
  , level : Int
  }

new : Player

new =
  { id = "0"
  , name = ""
  , level = 1
  }
