module Main where

import Day1

main :: IO ()
main = do
  putStrLn "**** day 1 - part 1 ****"
  day1_n computeFuel
  putStrLn "**** day 1 - part 1 ****"
  day1_n computeFuelPart2