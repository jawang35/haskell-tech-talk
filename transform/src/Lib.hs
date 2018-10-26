module Lib
    ( transform
    ) where

transform :: String -> String
transform = (++ "\n") . unwords . map reverse . words
