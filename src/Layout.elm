module Layout exposing
    ( none
    , divWrapper, spanWrapper, pWrapper
    , divText, spanText, pText
    , image, linkTo, linkToNewTab
    , asButton
    )

{-| Experiments with semantical Html elements


# Html elements


## Layouting

@docs none
@docs divWrapper, spanWrapper, pWrapper
@docs divText, spanText, pText


## Elements

@docs image, linkTo, linkToNewTab


# Attributes

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


{-|

    divText : List (Attribute msg) -> String -> Html msg
    divText attrs string =
        Html.div attrs [ Html.text string ]

-}
divText : List (Attribute msg) -> String -> Html msg
divText attrs string =
    Html.div attrs [ Html.text string ]


{-|

    spanText : List (Attribute msg) -> String -> Html msg
    spanText attrs string =
        Html.span attrs [ Html.text string ]

-}
spanText : List (Attribute msg) -> String -> Html msg
spanText attrs string =
    Html.span attrs [ Html.text string ]


{-| pText : List (Attribute msg) -> String -> Html msg
pText attrs string =
Html.p attrs [ Html.text string ]
-}
pText : List (Attribute msg) -> String -> Html msg
pText attrs string =
    Html.p attrs [ Html.text string ]


{-|

    divWrapper : List (Attribute msg) -> Html msg -> Html msg
    divWrapper attrs content =
        Html.div attrs [ content ]

-}
divWrapper : List (Attribute msg) -> Html msg -> Html msg
divWrapper attrs content =
    Html.div attrs [ content ]


{-|

    spanWrapper : List (Attribute msg) -> Html msg -> Html msg
    spanWrapper attrs content =
        Html.span attrs [ content ]

-}
spanWrapper : List (Attribute msg) -> Html msg -> Html msg
spanWrapper attrs content =
    Html.span attrs [ content ]


{-|

    pWrapper : List (Attribute msg) -> Html msg -> Html msg
    pWrapper attrs content =
        Html.p attrs [ content ]

-}
pWrapper : List (Attribute msg) -> Html msg -> Html msg
pWrapper attrs content =
    Html.p attrs [ content ]


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

    linkTo attrs link content =
        Html.a
            (Html.Attributes.href link
                :: attrs
            )
            [ content ]

-}
linkTo : List (Attribute msg) -> String -> Html msg -> Html msg
linkTo attrs link content =
    Html.a
        (Html.Attributes.href link
            :: attrs
        )
        [ content ]


{-|

    linkToNewTab attrs link content =
        Html.a
            ([ Html.Attributes.href link
             , Html.Attributes.target "_blank"
             ]
                ++ attrs
            )
            [ content ]

-}
linkToNewTab : List (Attribute msg) -> String -> Html msg -> Html msg
linkToNewTab attrs link content =
    Html.a
        ([ Html.Attributes.href link
         , Html.Attributes.target "_blank"
         ]
            ++ attrs
        )
        [ content ]



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
