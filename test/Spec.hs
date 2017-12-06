import Test.Hspec
import Capitalize (capitalize)
import Test.QuickCheck (property)
import Data.Maybe (fromMaybe, listToMaybe)
import Data.Char (isAlpha)

main :: IO ()
main = hspec $ do
  describe "Capitalize" $ do
    it "preserves length" $ property $
      \ string -> length ( capitalize string) `shouldBe` length string
    it "never returns a string that starts lower-case" $ property $
      \ string -> not $ (fromMaybe ' '  . listToMaybe . capitalize $ string )
                  `elem`
                  ['a'..'z']
    it "preserves non-alphabetic characters" $ property $
      \string -> (filter (not . isAlpha) . capitalize $ string)
                 `shouldBe`
                 filter (not . isAlpha) string
    context "when there's only one word in the string" $ do
      it "preserves all but the first character" $ property $
        \string -> let oneWord = filter isAlpha string in
          (tailIsh $ capitalize oneWord) `shouldBe` (tailIsh oneWord)

tailIsh :: [a] -> [a]
tailIsh [] = []
tailIsh (_:xs) = xs
