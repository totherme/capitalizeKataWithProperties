import Test.Hspec
import Capitalize (capitalize, wordsAndSpaces)
import Test.QuickCheck (property)
import Data.Maybe (fromMaybe, listToMaybe)
import Data.Char (isAlpha)

main :: IO ()
main = hspec $ do
  describe "Capitalize" $ do
    it "preserves length" $ property $
      pendingWith "need better words and unwords functions"
      -- \ string -> length ( capitalize string) `shouldBe` length string
    it "never returns a string that starts lower-case" $ property $
      \ string -> not $ (fromMaybe ' '  . listToMaybe . capitalize $ string )
                  `elem`
                  ['a'..'z']
    it "preserves non-alphabetic characters" $ property $
      pendingWith "need better words and unwords functions"
      -- \string -> (filter (not . isAlpha) . capitalize $ string)
      --            `shouldBe`
      --            filter (not . isAlpha) string
    context "when there's only one word in the string" $ do
      it "preserves all but the first character" $ property $
        \string -> let oneWord = filter isAlpha string in
          (tailIsh $ capitalize oneWord) `shouldBe` (tailIsh oneWord)
    context "when there are many words" $ do
      it "capitalizes each word separately" $ property $
        \n -> (capitalize (unwords . take n $ repeat "fish"))
              `shouldBe`
              (unwords . take n $ repeat "Fish")
  describe "wordsAndSpaces" $ do
    context "when there's one space between each word" $ do
      it "works like `words`" $ property $
        \n -> let wordList = take n $ repeat "herring" in
          (wordsAndSpaces (unwords wordList))
          `shouldBe`
          map (\s -> (s, " ")) wordList
  describe "unwordsAndSpaces" $ do
    context "when there's one space between each word" $ do
      it "works like `unwords`" $
        pendingWith "let's make wordsAndSpaces kinda-work first"
  describe "unwordsAndspaces . wordsAndspaces" $ do
    it "behaves like `id`" $
      pendingWith "let's make wordsAndspaces and unwordsAndspaces kinda work first"


tailIsh :: [a] -> [a]
tailIsh [] = []
tailIsh (_:xs) = xs
