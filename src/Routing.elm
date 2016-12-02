module Routing exposing (..)

import Navigation exposing (Location)
import Players.Models exposing (PlayerId)
import UrlParser exposing (..)

{-
NOTE: What we are creating:
        the routes for our application
        how to match browser paths to routes using path matchers
        how to react to routing messages

-}

type Route
    = PlayersRoute
    | PlayerRoute PlayerId
    | NotFoundRoute

{-
NOTE:
    These are the available routes in our application.
    NotFoundRoute will be used when no route matches the browser path.
-}

-- Here we define route matchers. These parsers are provided by the url-parser library.+

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map PlayersRoute top
        , map PlayerRoute (s "players" </> string)
        , map PlayersRoute (s "players")
        ]

{-
NOTE: We want three matchers:
        One for the top route which will resolve to PlayersRoute
        One for /players which will resolve to PlayersRoute as well
        And one for /players/id which will resolve to PlayerRoute id
    **Note that the order is important.**
-}

parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute

{-
NOTE:
    Each time the browser location changes,
    the Navigation library will trigger a message containing
    a `Navigation.Location` record. From our main update we
    will call parseLocation with this record.
-}
