module Capitalize
    ( capitalize
    , wordsAndSpaces
    , unwordsAndSpaces
    ) where

import Data.Char (toUpper, isAlpha)

capitalize :: String -> String
capitalize = unwordsAndSpaces . map f . wordsAndSpaces where
  f (word, spaces) = (capitalizeWord word, spaces)

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (x:xs) = (toUpper x) : xs

type WordAndSpaces = (String, String)

wordsAndSpaces :: String -> [WordAndSpaces]
wordsAndSpaces "" = []
wordsAndSpaces s = (firstWord, firstSpaces) : (wordsAndSpaces rest) where
  firstWord = takeWhile isAlpha s
  firstSpaces = takeWhile (not . isAlpha) $ dropWhile isAlpha s
  rest = dropWhile (not . isAlpha) $ dropWhile isAlpha s

unwordsAndSpaces :: [WordAndSpaces] -> String
unwordsAndSpaces [] = ""
unwordsAndSpaces ((word, spaces):rest) = word ++
                                         spaces ++
                                         (unwordsAndSpaces rest)
