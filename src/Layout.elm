module Layout exposing
    ( container, none, el, column, row
    , button
    , centered, alignBaseline, alignCenter, centerContent, noWrap
    , fill, fillPortion
    , spacing, spaceBetween
    , sticky, stickyOnBottom, stickyOnTop
    , asButton
    )

{-| write HTML like elm-ui


# Html elements

@docs container, none, el, column, row

@docs button


# Attributes

@docs centered, alignBaseline, alignCenter, centerContent, noWrap


# Size

@docs fill, fillPortion


# Spacing

@docs spacing, spaceBetween


## Sticky

@docs sticky, stickyOnBottom, stickyOnTop


## Role

@docs asButton

-}

import Html exposing (Attribute, Html)
import Html.Attributes
import Html.Events



----------------------------------------------------------------------------------------------------
--
--  Html container
--
----------------------------------------------------------------------------------------------------


{-|

    none : Html msg
    none =
        Html.text ""

-}
none : Html msg
none =
    Html.text ""


{-| Fills the entire screen. Should be the outer most element.

    container : List (Attribute msg) -> Html msg -> Html msg
    container attrs =
        el
            ([ Html.Attributes.style "width" "100%"
             , Html.Attributes.style "height" "100%"
             , Html.Attributes.style "position" "absolute"
             , Html.Attributes.style "left" "0px"
             , Html.Attributes.style "top" "0px"
             ]
                ++ attrs
            )

-}
container : List (Attribute msg) -> Html msg -> Html msg
container attrs =
    el
        ([ Html.Attributes.style "width" "100%"
         , Html.Attributes.style "height" "100%"
         , Html.Attributes.style "position" "absolute"
         , Html.Attributes.style "left" "0px"
         , Html.Attributes.style "top" "0px"
         ]
            ++ attrs
        )


{-|

    el : List (Attribute msg) -> Html msg -> Html msg
    el attrs content =
        Html.div
            (Html.Attributes.style "display" "flex"
                :: attrs
            )
            [ content ]

-}
el : List (Attribute msg) -> Html msg -> Html msg
el attrs content =
    Html.div
        (Html.Attributes.style "display" "flex"
            :: attrs
        )
        [ content ]


{-|

    row : List (Attribute msg) -> List (Html msg) -> Html msg
    row attrs =
        Html.div
            ([ Html.Attributes.style "display" "flex"
             , Html.Attributes.style "flex-direction" "row"
             , Html.Attributes.style "flex-wrap" "wrap"
             ]
                ++ attrs
            )

Will wrap into the next line if there is not enough space.

If you don't want this behavior, you can just add `noWrap`:

    unwrappedRow : List (Attribute msg) -> List (Html msg) -> Html msg
    unwrappedRow attrs =
        Layout.row (Layout.noWrap ++ attrs)

-}
row : List (Attribute msg) -> List (Html msg) -> Html msg
row attrs =
    Html.div
        ([ Html.Attributes.style "display" "flex"
         , Html.Attributes.style "flex-direction" "row"
         , Html.Attributes.style "flex-wrap" "wrap"
         ]
            ++ attrs
        )


{-|

    column : List (Attribute msg) -> List (Html msg) -> Html msg
    column attrs =
        Html.div
            ([ Html.Attributes.style "display" "flex"
             , Html.Attributes.style "flex-direction" "column"
             ]
                ++ attrs
            )

-}
column : List (Attribute msg) -> List (Html msg) -> Html msg
column attrs =
    Html.div
        ([ Html.Attributes.style "display" "flex"
         , Html.Attributes.style "flex-direction" "column"
         ]
            ++ attrs
        )


{-|

    button : { onPress : Maybe msg, label : String } -> List (Attribute msg) -> Html msg
    button args attrs =
        Html.div (asButton args ++ attrs)
            [ Html.text args.label ]

-}
button : { onPress : Maybe msg, label : String } -> List (Attribute msg) -> Html msg
button args attrs =
    Html.div (asButton args ++ attrs)
        [ Html.text args.label ]


radio :
    { onChange : Bool -> msg
    , checked : Bool
    , label : String
    }
    -> List (Attribute msg)
    -> Html msg
radio args attrs =
    Html.input
        ([ Html.Attributes.type_ "radio"
         , Html.Attributes.checked args.checked
         , Html.Attributes.attribute "aria-label" args.label
         ]
            ++ attrs
        )
        []



----------------------------------------------------------------------------------------------------
--
--  Attributes
--
----------------------------------------------------------------------------------------------------


{-| Turns anything into a button

    asButton : { onPress : Maybe msg, label : String } -> List (Attribute msg)
    asButton args =
        [ Html.Attributes.type_ "button"
        , Html.Attributes.attribute "cursor" "pointer"
        , Html.Attributes.attribute "aria-label" args.label
        ]
            ++ (args.onPress
                    |> Maybe.map (\msg -> [ Html.Events.onClick msg ])
                    |> Maybe.withDefault []
               )

-}
asButton : { onPress : Maybe msg, label : String } -> List (Attribute msg)
asButton args =
    [ Html.Attributes.type_ "button"
    , Html.Attributes.attribute "cursor" "pointer"
    , Html.Attributes.attribute "aria-label" args.label
    ]
        ++ (args.onPress
                |> Maybe.map (\msg -> [ Html.Events.onClick msg ])
                |> Maybe.withDefault []
           )


{-|

    fill : Attribute msg
    fill =
        fillPortion 1

-}
fill : Attribute msg
fill =
    fillPortion 1


{-|

    fillPortion : Int -> Attribute msg
    fillPortion n =
        Html.Attributes.style "flex" (String.fromInt n)

-}
fillPortion : Int -> Attribute msg
fillPortion n =
    Html.Attributes.style "flex" (String.fromInt n)


{-|

    spacing : Float -> Attribute msg
    spacing n =
        Html.Attributesstyle "gap" (String.fromFloat n ++ "px")

-}
spacing : Float -> Attribute msg
spacing n =
    Html.Attributes.style "gap" (String.fromFloat n ++ "px")


{-|

    noWrap : Attribute msg
    noWrap =
        Html.Attributes.style "flex-wrap" "nowrap"

-}
noWrap : Attribute msg
noWrap =
    Html.Attributes.style "flex-wrap" "nowrap"


{-|

    alignBaseline : Attribute msg
    alignBaseline =
        Html.Attributes.style "align-items" "baseline"

-}
alignBaseline : Attribute msg
alignBaseline =
    Html.Attributes.style "align-items" "baseline"


{-|

    centered : List (Attribute msg)
    centered =
        [ centerContent, alignCenter ]

-}
centered : List (Attribute msg)
centered =
    [ centerContent, alignCenter ]


{-|

    alignCenter : Attribute msg
    alignCenter =
        Html.Attributes.style "align-items" "center"

-}
alignCenter : Attribute msg
alignCenter =
    Html.Attributes.style "align-items" "center"


{-|

    spaceBetween : Attribute msg
    spaceBetween =
        Html.Attributes.style "justify-content" "space-between"

-}
spaceBetween : Attribute msg
spaceBetween =
    Html.Attributes.style "justify-content" "space-between"


{-|

    sticky : List (Attribute msg)
    sticky =
        [ Html.Attributes.style "position" "sticky"
        , Html.Attributes.style "z-index" "99999"
        ]

-}
sticky : List (Attribute msg)
sticky =
    [ Html.Attributes.style "position" "sticky"
    , Html.Attributes.style "z-index" "99999"
    ]


{-|

    stickyOnTop : List (Attribute msg)
    stickyOnTop =
        [ Html.Attributes.style "position" "sticky"
        , Html.Attributes.style "top" "0"
        , Html.Attributes.style "z-index" "99999"
        ]

-}
stickyOnTop : List (Attribute msg)
stickyOnTop =
    Html.Attributes.style "top" "0" :: sticky


{-|

    stickyOnBottom : List (Attribute msg)
    stickyOnBottom =
        [ Html.Attributes.style "position" "sticky"
        , Html.Attributes.style "bottom" "0"
        , Html.Attributes.style "z-index" "99999"
        ]

-}
stickyOnBottom : List (Attribute msg)
stickyOnBottom =
    Html.Attributes.style "bottom" "0" :: sticky


{-|

    centerContent : Attribute msg
    centerContent =
        Html.Attributes.style "justify-content" "center"

-}
centerContent : Attribute msg
centerContent =
    Html.Attributes.style "justify-content" "center"
