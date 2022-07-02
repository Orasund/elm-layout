# elm-layout

Layout HTML using [flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/). You can think of it as elm-ui light.

You can install this package or just get the [single elm file](https://github.com/Orasund/elm-layout/blob/main/src/Layout.elm).

## Why would I want this?

Elm-Ui is great to use for smaller projects. However, its implementation if very opaque, and complicated styling can be challenging.

* Elm-Ui is optioned. Buttons, Input fields and Labels comes with a predefined style - that is not documented.
* Elm-Ui is to abstract. Debugging weird behavior is challenging, especially if the resulting css does not clearly relate to the code.
* Elm-Ui is big. Most of Elm-Ui is just using Flexbox, everything else is performance optimization and nice-to-haves.

You can actually write [very readable and clear css nowadays](https://csslayout.io/). This package showcases this and tries to be as transparent as possible. It is be possible to modify everything and to also understand the resulting css.