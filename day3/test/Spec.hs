import           Day3       (closestIntersection, manhattanDistance, parseNode,
                             parseNodes, closestIntersection2)
import           Test.HUnit

main :: IO Counts
main = runTestTT tests

tests =
  TestList
    [ TestLabel "test1 part1" test1
    , TestLabel "test2 part1" test2
    , TestLabel "test3 part1" test3
    , TestLabel "test4 part1" test4
    , TestLabel "test5 part1" test5
    , TestLabel "test6 part1" test6
    , TestLabel "test7 part2" test7
    , TestLabel "test8 part2" test8
    , TestLabel "test9 part2" test9
    ]

test1 = TestCase (assertEqual "Should be equal to 6" 6 (manhattanDistance (3, 3)))

test2 = TestCase (assertEqual "parse" [(0, 1), (0, 1)] (parseNode "U2"))

test3 =
  TestCase (assertEqual "parse nodes" [(0, 1), (0, 1), (0, -1), (-1, 0), (-1, 0), (1, 0)] (parseNodes "U2,D1,L2,R1"))

test4 = TestCase (assertEqual "min distance examples" 6 (closestIntersection ["R8,U5,L5,D3","U7,R6,D4,L4"]))

test5 =
  TestCase
    (assertEqual
       "min distance examples"
       159
       (closestIntersection ["R75,D30,R83,U83,L12,D49,R71,U7,L72","U62,R66,U55,R34,D71,R55,D58,R83"]))

test6 =
  TestCase
    (assertEqual
       "min distance examples"
       135
       (closestIntersection ["R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51","U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"]))

test7 =
  TestCase
    (assertEqual
       "min distance examples"
       30
       (closestIntersection2 ["R8,U5,L5,D3","U7,R6,D4,L4"]))

test8 =
  TestCase
    (assertEqual
       "min distance examples"
        610
       (closestIntersection2 ["R75,D30,R83,U83,L12,D49,R71,U7,L72","U62,R66,U55,R34,D71,R55,D58,R83"]))

test9 =
  TestCase
    (assertEqual
       "min distance examples"
        410
       (closestIntersection2 ["R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51","U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"]))