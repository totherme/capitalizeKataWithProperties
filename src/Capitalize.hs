module Capitalize
    ( capitalize
    , wordsAndSpaces
    , unwordsAndSpaces
    ) where

import Data.Char (toUpper)

capitalize :: String -> String
capitalize = unwords . map capitalizeWord . words

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (x:xs) = (toUpper x) : xs

type WordAndSpaces = (String, String)

wordsAndSpaces :: String -> [WordAndSpaces]
wordsAndSpaces = map (\s -> (s, " ")) . words

unwordsAndSpaces :: [WordAndSpaces] -> String
unwordsAndSpaces = unwords . map fst
