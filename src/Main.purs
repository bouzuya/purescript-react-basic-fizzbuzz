module Main (main) where

import Component (counter)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import Prelude (Unit, bind)
import React.Basic.DOM as H
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  w <- window
  d <- document w
  containerMaybe <- getElementById "app" (toNonElementParentNode d)
  case containerMaybe of
    Nothing -> throw "Container element not found."
    Just c  ->
      let app = counter
      in H.render app c
