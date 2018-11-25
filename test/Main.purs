module Test.Main (main) where

import Effect (Effect)
import Prelude (Unit, (+))
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Hello" do
    test "Main" do
      Assert.equal 2 (1 + 1)
