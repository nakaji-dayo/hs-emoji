module Main where

import Data.Emoji

main = do
  print (unicodeByName "sushi")
  mapM_ putStrLn (unicodeByName "pizza")
