module Day1
  ( day1_n
  , computeFuel
  , computeFuelPart2
  ) where


day1_n :: (String -> Int) -> String -> Int
day1_n f = sum . map f . words

computeFuel :: String -> Int
computeFuel x = read x `div` 3 - 2

computeFuelPart2 :: String -> Int
computeFuelPart2 n
  | needed <= 0 = 0
  | otherwise = needed + computeFuelPart2 (show needed)
  where
    needed = computeFuel n