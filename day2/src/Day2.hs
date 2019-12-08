module Day2
  ( intCode
  , bruteForce
  , opcode
  ) where

import           Data.List.Split

intCode :: String -> [Int]
intCode content = intCode' 0 (map read $ splitOn "," content)

intCode' :: Int -> [Int] -> [Int]
intCode' cur list
  | list !! cur == 99 = list
  | otherwise = intCode' (cur + 4) newXs
  where
    newXs = do
      let oc = list !! cur
      let val1 = list !! (list !! (cur + 1))
      let val2 = list !! (list !! (cur + 2))
      let address = list !! (cur + 3)
      let res = opcode oc val1 val2
      replace address res list

opcode :: Int -> (Int -> Int -> Int)
opcode 1  = (+)
opcode 2  = (*)
opcode 99 = \x y -> 99

replace pos newVal list = take pos list ++ newVal : drop (pos + 1) list

--Part 2, not clean
intCodeWithNounAndVerb :: Int -> Int -> String -> [Int]
intCodeWithNounAndVerb noun verb content = intCode' 0 (replace 2 verb (replace 1 noun (map read $ splitOn "," content)))

bruteForce :: Int -> Int -> String -> Int -> [Int]
bruteForce 0 0 content val = [] -- not found
bruteForce 0 verb content val = bruteForce (verb - 1) (verb - 1) content val -- looping
bruteForce noun 0 content val = bruteForce (noun - 1) noun content val -- looping
bruteForce n v content 19690720 = [n, v + 1] -- Founded !!!!
bruteForce noun verb content val = bruteForce noun (verb - 1) content (head (intCodeWithNounAndVerb noun verb content)) -- searching
