module Main where

import Day2

main :: IO ()
main = do

  content <- readFile "src/resources/values_day2.txt"

  putStrLn "**** day 2 - part 1 ****"
  print $ intCode content
  putStrLn "**** day 2 - part 2 ****"
  print $ bruteForce 100 100 content 1