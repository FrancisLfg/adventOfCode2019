module Day3
  ( manhattanDistance
  , parseNode
  , parseNodes
  , buildPanel
  , intersections
  , intersections2
  , closestIntersection
  , closestIntersection2
  ) where

import           Data.List.Split
import qualified Data.Map        as Map
import qualified Data.Set        as Set

closestIntersection :: [String] -> Int
closestIntersection (s1:s2:s) = Set.findMin $ Set.map manhattanDistance (intersections s1 s2)

intersections :: String -> String -> Set.Set (Int, Int)
intersections nodes1 nodes2 = Set.intersection (buildPanel nodes1) (buildPanel nodes2)

buildPanel :: String -> Set.Set (Int, Int)
buildPanel nodes = Set.fromList $ scanl1 addTuple (parseNodes nodes)

parseNodes :: String -> [(Int, Int)]
parseNodes path = concatMap parseNode (splitOn "," path)

parse 'R' = (1, 0)
parse 'L' = (-1, 0)
parse 'D' = (0, -1)
parse 'U' = (0, 1)

parseNode (x:xs) = replicate (read xs) (parse x)

addTuple t1 t2 = (fst t1 + fst t2, snd t1 + snd t2)

manhattanDistance node = abs (fst node) + abs (snd node)

stepDistance node = abs (fst node) + abs (snd node)

--part 2
closestIntersection2 :: [String] -> Int
closestIntersection2 (s1:s2:s) = minimum $ map snd (Map.toList (intersections2 s1 s2))

intersections2 :: String -> String -> Map.Map (Int, Int) Int
intersections2 nodes1 nodes2 = Map.intersectionWith (+) (buildPanel2 nodes1) (buildPanel2 nodes2)

-- need to keep steps (coord):steps
buildPanel2 :: String -> Map.Map (Int, Int) Int
buildPanel2 nodes = Map.fromListWith min $ zip (scanl1 addTuple (parseNodes nodes)) [1 ..]
