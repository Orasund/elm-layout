module Layout exposing
    ( none, container, el, column, row, orderedList, unorderedList, descriptionList, paragraph
    , heading1, heading2, heading3, heading4, heading5, heading6
    , image, linkTo, linkToNewTab, buttonEl, radio
    , lineBreak, horizontalRuler
    , centered, noWrap, wrap
    , contentAtStart, contentAtEnd, contentCentered, contentWithSpaceBetween
    , alignAtStart, alignAtEnd, alignAtBaseline, alignAtCenter, alignStretched
    , gap
    , fill, fillPortion
    , sticky, stickyOnBottom, stickyOnTop
    , asEl, asButton
    , button, centerContent, spaceBetween, spacing, alignBaseline, alignCenter
    )

{-| write HTML like elm-ui


# Html elements

@docs none, container, el, column, row, orderedList, unorderedList, descriptionList, paragraph

@docs heading1, heading2, heading3, heading4, heading5, heading6

@docs image, linkTo, linkToNewTab, buttonEl, radio

@docs lineBreak, horizontalRuler


# Attributes

@docs centered, noWrap, wrap

@docs contentAtStart, contentAtEnd, contentCentered, contentWithSpaceBetween

@docs alignAtStart, alignAtEnd, alignAtBaseline, alignAtCenter, alignStretched

@docs gap


## Size

@docs fill, fillPortion


## Sticky

@docs sticky, stickyOnBottom, stickyOnTop


## Role

@docs asEl, asButton


# Deprecated

@docs button, centerContent, spaceBetween, spacing, alignBaseline, alignCenter

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

    none =
        Html.text ""

-}
none : Html msg
none =
    Html.text ""


{-| Fills the entire screen. Should be the outer most element.

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

    orderedList attrs content =
        Html.ol
            (Html.Attributes.style "display" "flex" :: attrs)
            (content
                |> List.map (\( a, h ) -> Html.li a [ h ])
            )

-}
orderedList : List (Attribute msg) -> List ( List (Attribute msg), Html msg ) -> Html msg
orderedList attrs content =
    Html.ol
        (Html.Attributes.style "display" "flex" :: attrs)
        (content
            |> List.map (\( a, h ) -> Html.li a [ h ])
        )


{-|

    unorderedList attrs content =
        Html.ul
            (Html.Attributes.style "display" "flex" :: attrs)
            (content
                |> List.map (\( a, h ) -> Html.li a [ h ])
            )

-}
unorderedList : List (Attribute msg) -> List ( List (Attribute msg), Html msg ) -> Html msg
unorderedList attrs content =
    Html.ul
        (Html.Attributes.style "display" "flex" :: attrs)
        (content
            |> List.map (\( a, h ) -> Html.li a [ h ])
        )


{-|

    descriptionList attrs content =
        Html.dl
            (Html.Attributes.style "display" "flex" :: attrs)
            (content
                |> List.concatMap
                    (\{ description, item } ->
                        [ description |> (\( a, h ) -> Html.dt a [ h ])
                        , item |> (\( a, h ) -> Html.dd a [ h ])
                        ]
                    )
            )

-}
descriptionList :
    List (Attribute msg)
    -> List { description : ( List (Attribute msg), Html msg ), item : ( List (Attribute msg), Html msg ) }
    -> Html msg
descriptionList attrs content =
    Html.dl
        (Html.Attributes.style "display" "flex" :: attrs)
        (content
            |> List.concatMap
                (\{ description, item } ->
                    [ description |> (\( a, h ) -> Html.dt a [ h ])
                    , item |> (\( a, h ) -> Html.dd a [ h ])
                    ]
                )
        )


{-|

    paragraph attrs content =
        Html.p
            (Html.Attributes.style "display" "flex" :: attrs)
            [ content ]

-}
paragraph : List (Attribute msg) -> Html msg -> Html msg
paragraph attrs content =
    Html.p
        (Html.Attributes.style "display" "flex" :: attrs)
        [ content ]


{-|

    heading1 attrs content =
        Html.h1
            (Html.Attributes.style "display" "flex" :: attrs)
            [ content ]

-}
heading1 : List (Attribute msg) -> Html msg -> Html msg
heading1 attrs content =
    Html.h1
        (Html.Attributes.style "display" "flex" :: attrs)
        [ content ]


{-|

    heading2 attrs content =
        Html.h2
            (Html.Attributes.style "display" "flex" :: attrs)
            [ content ]

-}
heading2 : List (Attribute msg) -> Html msg -> Html msg
heading2 attrs content =
    Html.h2
        (Html.Attributes.style "display" "flex" :: attrs)
        [ content ]


{-|

    heading3 attrs content =
        Html.h3
            (Html.Attributes.style "display" "flex" :: attrs)
            [ content ]

-}
heading3 : List (Attribute msg) -> Html msg -> Html msg
heading3 attrs content =
    Html.h3
        (Html.Attributes.style "display" "flex" :: attrs)
        [ content ]


{-|

    heading4 attrs content =
        Html.h4
            (Html.Attributes.style "display" "flex" :: attrs)
            [ content ]

-}
heading4 : List (Attribute msg) -> Html msg -> Html msg
heading4 attrs content =
    Html.h4
        (Html.Attributes.style "display" "flex" :: attrs)
        [ content ]


{-|

    heading5 attrs content =
        Html.h5
            (Html.Attributes.style "display" "flex" :: attrs)
            [ content ]

-}
heading5 : List (Attribute msg) -> Html msg -> Html msg
heading5 attrs content =
    Html.h5
        (Html.Attributes.style "display" "flex" :: attrs)
        [ content ]


{-|

    heading6 attrs content =
        Html.h6
            (Html.Attributes.style "display" "flex" :: attrs)
            [ content ]

-}
heading6 : List (Attribute msg) -> Html msg -> Html msg
heading6 attrs content =
    Html.h6
        (Html.Attributes.style "display" "flex" :: attrs)
        [ content ]


{-|

    image attrs args =
        Html.img
            ([ Html.Attributes.src args.src
             , Html.Attributes.alt args.description
             ]
                ++ attrs
            )
            []

-}
image : List (Attribute msg) -> { src : String, description : String } -> Html msg
image attrs args =
    Html.img
        ([ Html.Attributes.src args.src
         , Html.Attributes.alt args.description
         ]
            ++ attrs
        )
        []


{-|

    linkTo link attrs content =
        Html.a
            (Html.Attributes.href link
                :: attrs
            )
            [ content ]

-}
linkTo : String -> List (Attribute msg) -> Html msg -> Html msg
linkTo link attrs content =
    Html.a
        (Html.Attributes.href link
            :: attrs
        )
        [ content ]


{-|

    linkToNewTab link attrs content =
        Html.a
            ([ Html.Attributes.href link
             , Html.Attributes.target "_blank"
             ]
                ++ attrs
            )
            [ content ]

-}
linkToNewTab : String -> List (Attribute msg) -> Html msg -> Html msg
linkToNewTab link attrs content =
    Html.a
        ([ Html.Attributes.href link
         , Html.Attributes.target "_blank"
         ]
            ++ attrs
        )
        [ content ]


{-|

    buttonEl args attrs content =
        Html.button (asEl :: asButton args ++ attrs)
            [ content ]

-}
buttonEl : { onPress : Maybe msg, label : String } -> List (Attribute msg) -> Html msg -> Html msg
buttonEl args attrs content =
    Html.button (asEl :: asButton args ++ attrs)
        [ content ]


{-| @deprecated type signature will change in next major update. Until then, use `buttonEl`.

    button args attrs =
        Html.div (asButton args ++ attrs)
            [ Html.text args.label ]

-}
button : { onPress : Maybe msg, label : String } -> List (Attribute msg) -> Html msg
button args attrs =
    Html.div (asButton args ++ attrs)
        [ Html.text args.label ]


{-|

    radio args attrs =
        Html.input
            ([ Html.Attributes.type_ "radio"
             , Html.Attributes.checked args.checked
             , Html.Attributes.attribute "aria-label" args.label
             ]
                ++ attrs
            )
            []

-}
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


{-|

    lineBreak =
        Html.br [] []

-}
lineBreak : Html msg
lineBreak =
    Html.br [] []


{-|

    horizontalRuler attrs =
        Html.hr attrs []

-}
horizontalRuler : List (Attribute msg) -> Html msg
horizontalRuler attrs =
    Html.hr attrs []



----------------------------------------------------------------------------------------------------
--
--  Attributes
--
----------------------------------------------------------------------------------------------------


{-| Turns anything into a button

    asButton args =
        [ Html.Attributes.style "cursor" "pointer"
        , Html.Attributes.attribute "aria-label" args.label
        , Html.Attributes.attribute "role" "button"
        ]
            ++ (args.onPress
                    |> Maybe.map (\msg -> [ Html.Events.onClick msg ])
                    |> Maybe.withDefault []
               )

-}
asButton : { onPress : Maybe msg, label : String } -> List (Attribute msg)
asButton args =
    [ Html.Attributes.style "cursor" "pointer"
    , Html.Attributes.attribute "aria-label" args.label
    , Html.Attributes.attribute "role" "button"
    ]
        ++ (args.onPress
                |> Maybe.map (\msg -> [ Html.Events.onClick msg ])
                |> Maybe.withDefault []
           )


{-|

    asEl =
        Html.Attributes.style "display" "flex"

-}
asEl : Attribute msg
asEl =
    Html.Attributes.style "display" "flex"


{-|

    fill =
        fillPortion 1

-}
fill : Attribute msg
fill =
    fillPortion 1


{-|

    fillPortion n =
        Html.Attributes.style "flex" (String.fromInt n)

-}
fillPortion : Int -> Attribute msg
fillPortion n =
    Html.Attributes.style "flex" (String.fromInt n)


{-| @deprecated use `gap` instead.
-}
spacing : Float -> Attribute msg
spacing n =
    Html.Attributes.style "gap" (String.fromFloat n ++ "px")


{-|

    gap n =
        Html.Attributes.style "gap" (String.fromFloat n ++ "px")

-}
gap : Float -> Attribute msg
gap n =
    Html.Attributes.style "gap" (String.fromFloat n ++ "px")


{-|

    noWrap =
        Html.Attributes.style "flex-wrap" "nowrap"

-}
noWrap : Attribute msg
noWrap =
    Html.Attributes.style "flex-wrap" "nowrap"


{-|

    wrap =
        Html.Attributes.style "flex-wrap" "wrap"

-}
wrap : Attribute msg
wrap =
    Html.Attributes.style "flex-wrap" "wrap"


{-|

    centered =
        [ contentCentered, alignAtCenter ]

-}
centered : List (Attribute msg)
centered =
    [ contentCentered, alignAtCenter ]


{-|

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

    stickyOnBottom =
        [ Html.Attributes.style "position" "sticky"
        , Html.Attributes.style "bottom" "0"
        , Html.Attributes.style "z-index" "99999"
        ]

-}
stickyOnBottom : List (Attribute msg)
stickyOnBottom =
    Html.Attributes.style "bottom" "0" :: sticky


{-| @deprecated use `contentCentered` instead

    centerContent =
        Html.Attributes.style "justify-content" "center"

-}
centerContent : Attribute msg
centerContent =
    Html.Attributes.style "justify-content" "center"


{-| @deprecated use `contentWithSpaceBetween` instead

    spaceBetween =
        Html.Attributes.style "justify-content" "space-between"

-}
spaceBetween : Attribute msg
spaceBetween =
    Html.Attributes.style "justify-content" "space-between"


{-|

    contentAtStart =
        Html.Attributes.style "justify-content" "flex-start"

-}
contentAtStart : Attribute msg
contentAtStart =
    Html.Attributes.style "justify-content" "flex-start"


{-|

    contentAtEnd =
        Html.Attributes.style "justify-content" "flex-end"

-}
contentAtEnd : Attribute msg
contentAtEnd =
    Html.Attributes.style "justify-content" "flex-end"


{-|

    contentCentered =
        Html.Attributes.style "justify-content" "center"

-}
contentCentered : Attribute msg
contentCentered =
    Html.Attributes.style "justify-content" "center"


{-|

    contentWithSpaceBetween =
        Html.Attributes.style "justify-content" "space-between"

-}
contentWithSpaceBetween : Attribute msg
contentWithSpaceBetween =
    Html.Attributes.style "justify-content" "space-between"


{-|

    alignAtStart =
        Html.Attributes.style "align-items" "flex-start"

-}
alignAtStart : Attribute msg
alignAtStart =
    Html.Attributes.style "align-items" "flex-start"


{-|

    alignAtEnd =
        Html.Attributes.style "align-items" "flex-end"

-}
alignAtEnd : Attribute msg
alignAtEnd =
    Html.Attributes.style "align-items" "flex-end"


{-| @Deprecated use `alignAtBaseline` instead
-}
alignBaseline : Attribute msg
alignBaseline =
    alignAtBaseline


{-|

    alignAtBaseline =
        Html.Attributes.style "align-items" "baseline"

-}
alignAtBaseline : Attribute msg
alignAtBaseline =
    Html.Attributes.style "align-items" "baseline"


{-| @deprecated Use `alignAtCenter` instead
-}
alignCenter : Attribute msg
alignCenter =
    alignAtCenter


{-|

    alignAtCenter =
        Html.Attributes.style "align-items" "center"

-}
alignAtCenter : Attribute msg
alignAtCenter =
    Html.Attributes.style "align-items" "center"


{-|

    alignStretched =
        Html.Attributes.style "align-items" "stretch"

-}
alignStretched : Attribute msg
alignStretched =
    Html.Attributes.style "align-items" "stretch"
