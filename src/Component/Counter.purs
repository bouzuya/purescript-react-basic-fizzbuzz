module Component.Counter (counter) where

import Prelude (mod, otherwise, show, (+), (==))
import React.Basic (Component, JSX, StateUpdate(..), capture_, createComponent, make)
import React.Basic.DOM as H

type Props = {}

data Action
  = Increment

component :: Component Props
component = createComponent "Counter"

counter :: Props -> JSX
counter = make component { initialState, render, update }
  where
    fizzBuzz n | n `mod` 15 == 0 = "FizzBuzz"
    fizzBuzz n | n `mod` 5 == 0 = "Buzz"
    fizzBuzz n | n `mod` 3 == 0 = "Fizz"
    fizzBuzz n | otherwise = show n

    initialState = { count: 1 }

    render self@{ state: { count } } =
      H.div_
      [ H.span_
        [ H.text (fizzBuzz count) ]
      , H.br {}
      , H.button
        { children: [ H.text "++" ]
        , onClick: capture_ self Increment
        }
      ]

    update { state } = case _ of
      Increment ->
        Update state { count = state.count + 1 }
