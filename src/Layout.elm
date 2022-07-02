module Layout exposing
    ( none, el, column, row
    , centered, alignBaseline, alignCenter, centerContent, noWrap
    , fill, fillPortion
    , spacing, spaceBetween
    , sticky, stickyOnBottom, stickyOnTop
    )

{-| write HTML like elm-ui


# Html container

@docs none, el, column, row


# Attributes

@docs centered, alignBaseline, alignCenter, centerContent, noWrap


# Size

@docs fill, fillPortion


# Spacing

@docs spacing, spaceBetween


## Sticky

@docs sticky, stickyOnBottom, stickyOnTop

-}

import Html exposing (Attribute, Html)
import Html.Attributes as Attr



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


{-|

    el : List (Attribute msg) -> Html msg -> Html msg
    el attrs content =
        Html.div
            (Attr.style "display" "flex"
                :: attrs
            )
            [ content ]

-}
el : List (Attribute msg) -> Html msg -> Html msg
el attrs content =
    Html.div
        (Attr.style "display" "flex"
            :: attrs
        )
        [ content ]


{-|

    row : List (Attribute msg) -> List (Html msg) -> Html msg
    row attrs =
        Html.div
            ([ Attr.style "display" "flex"
             , Attr.style "flex-direction" "row"
             , Attr.style "flex-wrap" "wrap"
             ]
                ++ attrs
            )

Will wrap into the next line if there is not enough space.

If you don't want this behavior, you can just add `noWrap`:

    unwrappedRow : List (Attribute msg) -> List (Html msg) -> Html msg
    unwrappedRow attrs =
        Layout.row ([ Layout.noWrap ] ++ attrs)

-}
row : List (Attribute msg) -> List (Html msg) -> Html msg
row attrs =
    Html.div
        ([ Attr.style "display" "flex"
         , Attr.style "flex-direction" "row"
         , Attr.style "flex-wrap" "wrap"
         ]
            ++ attrs
        )


{-|

    column : List (Attribute msg) -> List (Html msg) -> Html msg
    column attrs =
        Html.div
            ([ Attr.style "display" "flex"
             , Attr.style "flex-direction" "column"
             ]
                ++ attrs
            )

-}
column : List (Attribute msg) -> List (Html msg) -> Html msg
column attrs =
    Html.div
        ([ Attr.style "display" "flex"
         , Attr.style "flex-direction" "column"
         ]
            ++ attrs
        )



----------------------------------------------------------------------------------------------------
--
--  Attributes
--
----------------------------------------------------------------------------------------------------


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
        Attr.style "flex" (String.fromInt n)

-}
fillPortion : Int -> Attribute msg
fillPortion n =
    Attr.style "flex" (String.fromInt n)


{-|

    spacing : Float -> Attribute msg
    spacing n =
        Attr.style "gap" (String.fromFloat n ++ "px")

-}
spacing : Float -> Attribute msg
spacing n =
    Attr.style "gap" (String.fromFloat n ++ "px")


{-|

    noWrap : Attribute msg
    noWrap =
        Attr.style "flex-wrap" "nowrap"

-}
noWrap : Attribute msg
noWrap =
    Attr.style "flex-wrap" "nowrap"


{-|

    alignBaseline : Attribute msg
    alignBaseline =
        Attr.style "align-items" "baseline"

-}
alignBaseline : Attribute msg
alignBaseline =
    Attr.style "align-items" "baseline"


{-|

    centered : List (Attribute msg)
    centered =
        [ alignBaseline, alignCenter ]

-}
centered : List (Attribute msg)
centered =
    [ alignBaseline, alignCenter ]


{-|

    alignCenter : Attribute msg
    alignCenter =
        Attr.style "align-items" "center"

-}
alignCenter : Attribute msg
alignCenter =
    Attr.style "align-items" "center"


{-|

    spaceBetween : Attribute msg
    spaceBetween =
        Attr.style "justify-content" "space-between"

-}
spaceBetween : Attribute msg
spaceBetween =
    Attr.style "justify-content" "space-between"


{-|

    sticky : List (Attribute msg)
    sticky =
        [ Attr.style "position" "sticky"
        , Attr.style "z-index" "99999"
        ]

-}
sticky : List (Attribute msg)
sticky =
    [ Attr.style "position" "sticky"
    , Attr.style "z-index" "99999"
    ]


{-|

    stickyOnTop : List (Attribute msg)
    stickyOnTop =
        [ Attr.style "position" "sticky"
        , Attr.style "top" "0"
        , Attr.style "z-index" "99999"
        ]

-}
stickyOnTop : List (Attribute msg)
stickyOnTop =
    Attr.style "top" "0" :: sticky


{-|

    stickyOnBottom : List (Attribute msg)
    stickyOnBottom =
        [ Attr.style "position" "sticky"
        , Attr.style "bottom" "0"
        , Attr.style "z-index" "99999"
        ]

-}
stickyOnBottom : List (Attribute msg)
stickyOnBottom =
    Attr.style "bottom" "0" :: sticky


{-|

    centerContent : Attribute msg
    centerContent =
        Attr.style "justify-content" "center"

-}
centerContent : Attribute msg
centerContent =
    Attr.style "justify-content" "center"
