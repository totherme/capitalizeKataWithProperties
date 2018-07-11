module Capitalize
    ( capitalize
    , wordsAndSpaces
    , unwordsAndSpaces
    ) where

import Data.Char (toUpper, isAlpha)

capitalize :: String -> String
capitalize = unwordsAndSpaces . map (fmap capitalizeWord) . wordsAndSpaces

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (x:xs) = toUpper x : xs

type SpacesAndWords = (String, String)

wordsAndSpaces :: String -> [SpacesAndWords]
wordsAndSpaces "" = []
wordsAndSpaces s = (firstSpaces, firstWord) : wordsAndSpaces rest where
  firstWord = takeWhile isAlpha s
  firstSpaces = takeWhile (not . isAlpha) $ dropWhile isAlpha s
  rest = dropWhile (not . isAlpha) $ dropWhile isAlpha s

unwordsAndSpaces :: [SpacesAndWords] -> String
unwordsAndSpaces [] = ""
unwordsAndSpaces ((spaces, word):rest) = word ++
                                         spaces ++
                                         unwordsAndSpaces rest
