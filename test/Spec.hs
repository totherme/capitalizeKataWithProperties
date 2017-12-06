import Test.Hspec
import Capitalize (capitalize)
import Test.QuickCheck (property)
import Data.Maybe (fromMaybe, listToMaybe)

main :: IO ()
main = hspec $ do
  describe "Capitalize" $ do
    it "preserves length" $ property $
      \ string -> length ( capitalize string) `shouldBe` length string
