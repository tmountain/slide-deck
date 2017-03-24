module App exposing (..)

import Array
import Slides exposing (..)
import Html exposing (Html, a, text, img, div, h1, h3, ul, li, p)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src, href, class, style)


type alias Model =
    { slideIndex : Int
    }


model : Model
model =
    { slideIndex = 0 }


type Msg
    = NextSlide
    | PreviousSlide


update : Msg -> Model -> Model
update msg model =
    case msg of
        NextSlide ->
            if model.slideIndex < (List.length slides) - 1 then
                { model | slideIndex = model.slideIndex + 1 }
            else
                model

        PreviousSlide ->
            if model.slideIndex > 0 then
                { model | slideIndex = model.slideIndex - 1 }
            else
                model



-- VIEW


emptySlide : Html msg
emptySlide =
    div []
        [ h1 [ class "centered" ] [ text "Slide Not Found" ]
        ]


getSlide : Int -> List (Html msg) -> Html msg
getSlide index list =
    let
        myItem =
            Array.fromList list
                |> Array.get index
    in
        case myItem of
            Just item ->
                item

            Nothing ->
                emptySlide


view : Model -> Html Msg
view model =
    div [ class "aligner dark-primary-color" ]
        [ div
            [ class "alignerItem slideContainer" ]
            [ getSlide model.slideIndex slides ]
        , div []
            [ a [ href "#", onClick PreviousSlide ] [ text "<" ]
            , text " "
            , a [ href "#", onClick NextSlide ] [ text ">" ]
            ]
        ]
