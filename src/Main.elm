module Main exposing (..)

import App exposing (..)
import Html exposing (beginnerProgram)


main =
    beginnerProgram { view = view, update = update, model = model }
