module Slides exposing (..)

import Html exposing (Html, a, text, img, div, h1, h3, ul, li, p, pre, node)
import Html.Attributes exposing (src, href, class, style)


logoStyle : Html.Attribute msg
logoStyle =
    Html.Attributes.style
        [ ( "vertical-align", "-4%" )
        , ( "height", "4%" )
        , ( "width", "4%" )
        , ( "margin-left", "1%" )
        ]


slides : List (Html msg)
slides =
    [ slide0, slide1, slide2, slide3, slide4, slide5, slide6 ]


slide0 : Html msg
slide0 =
    div []
        [ h1 [ class "centered" ]
            [ text "Why Elm?"
            , img [ logoStyle, src "http://elm-lang.org/assets/logo.svg" ] []
            ]
        , ul [ class "slideItem" ]
            [ li []
                [ text "Functional"
                , ul []
                    [ li [] [ text "Predictable state changes" ]
                    , li [] [ text "Immutable data" ]
                    , li [] [ text "Idempotent y=f(x)" ]
                    ]
                ]
            , li []
                [ text "Safe"
                , ul []
                    [ li [] [ text "No runtime errors!" ] ]
                ]
            , li []
                [ text "Prescribed"
                , ul []
                    [ li [] [ text "TEA removes all guesswork" ] ]
                ]
            , li []
                [ text "Pure"
                , ul []
                    [ li [] [ text "No side-effects" ]
                    , li [] [ text "Fully testable!" ]
                    ]
                ]
            , li []
                [ text "Approachable"
                , ul []
                    [ li [] [ text "Target audience: Javascript programmers" ] ]
                ]
            , li []
                [ text "Modern"
                , ul []
                    [ li [] [ text "No legacy artifacts (compatibility suffers)" ]
                    , li [] [ text "Built on 50+ years of CS research" ]
                    ]
                ]
            ]
        ]


slide1 : Html msg
slide1 =
    div []
        [ h1 [ class "centered" ]
            [ text "The Tools" ]
        , ul [ class "slideItem" ]
            [ li []
                [ text "Type System      "
                , ul []
                    [ li []
                        [ text "Strong / Static / Inferred" ]
                    ]
                ]
            , li []
                [ text "Virtual DOM      "
                , ul []
                    [ li []
                        [ a [ href "http://elm-lang.org/blog/blazing-fast-html" ]
                            [ text "Blazing Fast" ]
                        ]
                    , li []
                        [ text "Renders as model changes" ]
                    ]
                ]
            , li []
                [ a [ href "http://elm-lang.org/docs/syntax" ]
                    [ text "Minimal Syntax" ]
                ]
            , li []
                [ text "Live Editing / Time Travel      "
                , ul []
                    [ li []
                        [ a [ href "https://github.com/tomekwi/elm-live" ]
                            [ text "Elm Live" ]
                        ]
                    , li []
                        [ a [ href "https://github.com/elm-lang/elm-reactor" ]
                            [ text "Elm Reactor" ]
                        ]
                    , li []
                        [ a [ href "http://debug.elm-lang.org/" ]
                            [ text "Time Traveling Debugger" ]
                        ]
                    ]
                ]
            , li []
                [ a [ href "https://github.com/avh4/elm-format" ]
                    [ text "Elm Format" ]
                ]
            , li []
                [ a [ href "https://ellie-app.com/new" ]
                    [ text "Ellie (Elm Live Editor)" ]
                ]
            , li []
                [ a [ href "http://elm-lang.org/try" ]
                    [ text "Try Elm" ]
                ]
            , li []
                [ a [ href "https://guide.elm-lang.org/architecture/" ]
                    [ text "TEA (The Elm Architecture)" ]
                ]
            , li []
                [ a [ href "https://guide.elm-lang.org/" ]
                    [ text "The Guide" ]
                ]
            ]
        ]


code1 : String
code1 =
    """
    // Declarative (no implementation details)
    List<int> collection = new List<int> { 1, 2, 3, 4, 5 };
    var results = collection.Where(num => num % 2 != 0);

    // Rules of recursion:
    // 1) Never iterate.
    // 2) Always follow the first rule.
    """


code2 =
    """
    // Imperative (specific instructions)
    List<int> results = new List<int>();
    foreach(var num in collection)
    {
        if (num % 2 != 0)
              results.Add(num);
    }
    """


slide2 : Html msg
slide2 =
    div []
        [ h1 [ class "centered" ]
            [ text "Declarative vs Imperative" ]
        , h3 [] [ text "Declarative (SQL, Excel, LINQ, Purely Functional Languages)" ]
        , pre [] [ text code1 ]
        , h3 [] [ text "Imperative (C-style Languages, OOP Languages)" ]
        , pre [] [ text code2 ]
        ]


code3 : String
code3 =
    """
    -- currying
    sum x y = x + y
    plusFive = sum 5

    -- closures
    createIncrementer : Int -> Int -> Int
    createIncrementer n =
    let incrementValue = n
      in ((+) incrementValue)

    -- higher order functions
    square x = x^2
    List.map square [1, 2, 3] -> [1, 4, 9]

    -- pipes (threading)
    weirdReversal string =
      string
        |> String.reverse
        |> String.toUpper
        |> String.filter isNotSpace
    """


slide3 : Html msg
slide3 =
    div []
        [ h1 [ class "centered" ]
            [ text "Currying, Closures, HoF" ]
        , h3 [] [ text "Building blocks in the FP universe" ]
        , pre [] [ text code3 ]
        ]


code4 : String
code4 =
    """
    -- Will not compile: missing Fish case
    type Animal = Cat | Dog | Fish
    speak : Animal -> String
    speak animal =
        case animal of
            Dog -> "Woof"
            Cat -> "Meow"
    """


slide4 : Html msg
slide4 =
    div []
        [ h1 [ class "centered" ]
            [ text "Safety" ]
        , ul [ class "slideItem" ]
            [ li []
                [ text "Philosophy      "
                , ul []
                    [ li []
                        [ text "Treat Errors as Data" ]
                    , li []
                        [ text "Results / Maybes Provide Granularity" ]
                    , li []
                        [ text "Defer Handing Until Convenient" ]
                    , li []
                        [ text "NULLs Not Allowed!" ]
                    , li []
                        [ text "If it Compiles, It Works!" ]
                    ]
                , li []
                    [ a [ href "https://www.lucidchart.com/techblog/2015/08/31/the-worst-mistake-of-computer-science/" ]
                        [ text "NULL: the billion dollar mistake" ]
                    ]
                , li []
                    [ a [ href "http://bit.ly/2mVy7JT" ]
                        [ text "Example: Error Handling" ]
                    ]
                , li []
                    [ text "Type System Handles Missing Cases" ]
                ]
            ]
        , pre [] [ text code4 ]
        ]


teaStyle : Html.Attribute msg
teaStyle =
    Html.Attributes.style
        [ ( "height", "75%" )
        , ( "width", "75%" )
        , ( "display", "block" )
        , ( "margin", "auto" )
        ]


slide5 : Html msg
slide5 =
    div []
        [ h1 [ class "centered" ]
            [ text "The Elm Architecture (TEA)"
            ]
        , img [ teaStyle, src "https://guide.elm-lang.org/architecture/effects/beginnerProgram.svg" ] []
        , ul [ class "slideItem" ]
            [ li [] [ text "Simple Pattern for Web Apps" ]
            , li [] [ text "Great for Modularity, Reuse, Testing" ]
            , li [] [ text "Easy to Create Complex Apps (No Guesswork)" ]
            , li [] [ text "Every Elm App Looks the Same" ]
            , li [] [ text "Friendly Refactoring" ]
            , li [] [ text "Borrowed by Redux and other frameworks" ]
            , li []
                [ a [ href "https://guide.elm-lang.org/architecture/" ]
                    [ text "Clearly Documented" ]
                ]
            ]
        ]


slide6 : Html msg
slide6 =
    div []
        [ h1 [ class "centered" ] [ text "Toy Projects" ]
        , ul [ class "slideItem" ]
            [ li []
                [ a [ href "https://github.com/tmountain/note-teacher" ]
                    [ text "Note Teacher" ]
                ]
            , li []
                [ a [ href "https://github.com/tmountain/rock-paper-scissors" ]
                    [ text "Rock Paper Scissors" ]
                ]
            , li []
                [ a [ href "https://github.com/tmountain/dragon-curve" ]
                    [ text "Dragon Curve" ]
                ]
            , li []
                [ a [ href "https://github.com/tmountain/slide-deck" ]
                    [ text "This Slide Deck ;-)" ]
                ]
            ]
        ]
