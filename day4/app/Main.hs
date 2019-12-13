module Main where

import Day4

main :: IO ()
main = do

--  content <- readFile "src/resources/values_day4.txt"

  putStrLn "**** day 4 - part 1 ****"
  print $ guess (>=) (136818,685979)
  putStrLn "**** day 4 - part 2 ****"
  print $ guess (==) (136818,685979)