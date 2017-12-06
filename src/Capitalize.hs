module Capitalize
    ( capitalize
    ) where

import Data.Char (toUpper)

capitalize :: String -> String
capitalize = unwords . map capitalizeWord . words

capitalizeWord :: String -> String
capitalizeWord "" = ""
capitalizeWord (x:xs) = (toUpper x) : xs
