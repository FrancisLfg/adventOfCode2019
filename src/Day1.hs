module Day1
    ( day1_n,
      computeFuel,
      computeFuelPart2
    ) where


day1_n :: (String -> Int) -> IO ()
day1_n f = do
   content <- readFile "src/resources/values_day1.txt"
   print $ sum . map f . words $ content

computeFuel :: String -> Int
computeFuel x = zeroIfNeg $ read x `div` 3 - 2

computeFuelPart2 :: String -> Int
computeFuelPart2 n
  | n <= show 0 = 0
  | otherwise = computeFuel n + computeFuelPart2(show $ computeFuel n)

zeroIfNeg :: Int -> Int
zeroIfNeg x = if x < 0 then 0 else x