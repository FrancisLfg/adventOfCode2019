import           Day1       (computeFuel, computeFuelPart2, day1_n)
import           Test.HUnit

main :: IO Counts
main = runTestTT tests

tests =
  TestList
    [ TestLabel "test1 part1" test1
    , TestLabel "test2 part1" test2
    , TestLabel "test3 part1" test3
    , TestLabel "test4 part1" test4
    , TestLabel "test5 part2" test5
    , TestLabel "test6 part2" test6
    , TestLabel "test7 part2" test7
    ]

test1 =
  TestCase
    (assertEqual
       "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2"
       (day1_n computeFuel "12")
       2)

test2 =
  TestCase
    (assertEqual
       "For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2"
       (day1_n computeFuel "14")
       2)

test3 = TestCase (assertEqual "For a mass of 1969, the fuel required is 654" (day1_n computeFuel "1969") 654)

test4 = TestCase (assertEqual "For a mass of 100756, the fuel required is 33583" (day1_n computeFuel "100756") 33583)

test5 =
  TestCase
    (assertEqual
       "A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2 divided by 3 and rounded down is 0,\
       \which would call for a negative fuel), so the total fuel required is still just 2"
       (day1_n computeFuelPart2 "14")
       2)

test6 =
  TestCase
    (assertEqual
       "At first, a module of mass 1969 requires 654 fuel. Then, this fuel requires 216 more fuel (654 / 3 - 2).\
        \216 then requires 70 more fuel, which requires 21 fuel, which requires 5 fuel, which requires no further fuel.\
         \So, the total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966"
       (day1_n computeFuelPart2 "1969")
       966)

test7 =
  TestCase
    (assertEqual
       "The fuel required by a module of mass 100756 and its fuel is: 33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346."
       (day1_n computeFuelPart2 "100756")
       50346)
