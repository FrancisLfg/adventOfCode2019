import           Day4       (adjacent, guess, increase)
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
    ]

test1 = TestCase (assertEqual "Should be sorted" True (increase "123456"))

test2 = TestCase (assertEqual "Should not be sorted" False (increase "123451"))

test3 = TestCase (assertEqual "Should have a group" True (adjacent (>=) "12335"))

test4 = TestCase (assertEqual "Should not have a group" False (adjacent (>=) "123451"))

test5 = TestCase (assertEqual "Should have 1 elem" 2 (guess (>=) (111111, 111112)))

test6 = TestCase (assertEqual "Should have 5 elem" 5 (guess (>=) (223450, 223459)))
