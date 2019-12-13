module Day4
  ( increase
  , adjacent
  , guess
  ) where

import           Data.List (group, sort)

guess :: (Int -> Int -> Bool) -> (Int, Int) -> Int
guess op interval = length $ filter increase $ filter (adjacent op) $ map show [fst interval .. snd interval]

adjacent :: (Int -> Int -> Bool) -> String -> Bool
adjacent op n = any ((`op` 2) . length) $ group n

increase :: String -> Bool
increase n = sort n == n
