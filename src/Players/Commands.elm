module Players.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Players.Models exposing (PlayerId, Player)
import Players.Messages exposing (..)

fetchAll : Cmd Msg
fetchAll =
  Http.get fetchAllUrl collectionDecoder
    |> Http.send OnFetchAll

-- ^^ Here we create a command for our application to run.
-- Http.get creates a Request
-- We then send this request to Http.send which wraps it in a command


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/players"


-- This `memberDecoder` decoder delegates the decoding
-- of each member of a list to memberDecoder
collectionDecoder : Decode.Decoder (List Player)
collectionDecoder =
    Decode.list memberDecoder


memberDecoder : Decode.Decoder Player
memberDecoder =
    Decode.map3 Player
        (field "id" Decode.string)
        (field "name" Decode.string)
        (field "level" Decode.int)

-- memberDecoder creates a JSON decoder that returns a Player record.
-- i.e. { id = 99, name = "Sam" }
