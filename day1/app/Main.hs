module Main where

import Day1 

main :: IO ()
main = do

  content <- readFile "src/resources/values_day1.txt"
  putStrLn "**** day 1 - part 1 ****"
  print $ day1_n computeFuel content
  putStrLn "**** day 1 - part 2 ****"
  print $ day1_n computeFuelPart2 content
  