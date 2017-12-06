module Capitalize
    ( capitalize
    ) where

import Data.Char (toUpper)

capitalize :: String -> String
capitalize = map toUpper
