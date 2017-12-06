{-# LANGUAGE ScopedTypeVariables #-}

import Test.Hspec
import Capitalize (capitalize, wordsAndSpaces, unwordsAndSpaces)
import Test.QuickCheck (property)
import Data.Maybe (fromMaybe, listToMaybe)
import Data.Char (isAlpha)

main :: IO ()
main = hspec $ do
  describe "Capitalize" $ do
    it "preserves length" $ property $
      \string -> length ( capitalize string) `shouldBe` length string
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
    context "when there are many words" $ do
      it "capitalizes each word separately" $ property $
        \n -> (capitalize (unwords . take n $ repeat "fish"))
              `shouldBe`
              (unwords . take n $ repeat "Fish")
  describe "wordsAndSpaces" $ do
    context "when there's one space between each word and at least one word" $ do
      it "works like `words`" $ property $
        \(xs :: [()]) ->  let wordList = take (length xs + 1) $ repeat "herring" in
          (wordsAndSpaces (unwords wordList ++ " "))
          `shouldBe`
          map (\s -> (s, " ")) wordList
  describe "unwordsAndSpaces" $ do
    context "when there's one space between each word" $ do
      it "works like `unwords`" $
        pendingWith "did I mis-understand what I wanted here?"
        -- property $
        -- \n -> let wordAndSpaceList = take n $ repeat ("eels", " ") in
        --   (unwordsAndSpaces wordAndSpaceList)
        --   `shouldBe`
        --   (unwords $ map fst wordAndSpaceList)
  describe "unwordsAndspaces . wordsAndspaces" $ do
    it "behaves like `id`" $ property $
      \string -> (unwordsAndSpaces . wordsAndSpaces $ string) `shouldBe` string

tailIsh :: [a] -> [a]
tailIsh [] = []
tailIsh (_:xs) = xs
