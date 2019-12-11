module Main where

import Day3
import qualified Data.Set        as Set

main :: IO ()
main = do

  content <- readFile "src/resources/values_day3.txt"

  putStrLn "**** day 3 - part 1 ****"
  print $ closestIntersection (words content)
  putStrLn "**** day 3 - part 2 ****"
  print $ closestIntersection2 (words content)