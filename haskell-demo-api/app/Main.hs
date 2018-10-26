module Main where

import System.Environment
import Server

main :: IO ()
main = getArgs >>= \args -> startApp $ read $ args !! 0
