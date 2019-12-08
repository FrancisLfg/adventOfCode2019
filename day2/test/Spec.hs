import           Day2       (opcode, intCode)
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
    , TestLabel "test1 opcode" test1_opcode
    , TestLabel "test2 opcode" test2_opcode
    ]

test1 = TestCase (assertEqual "1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2)" [2, 0, 0, 0, 99] (intCode "1,0,0,0,99"))

test2 = TestCase (assertEqual "2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6)" [2, 3, 0, 6, 99] (intCode "2,3,0,3,99"))

test3 =
  TestCase (assertEqual "2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801)" [2,4,4,5,99,9801] (intCode "2,4,4,5,99,0"))

test4 =
  TestCase (assertEqual "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99" [30,1,1,4,2,5,6,0,99] (intCode "1,1,1,4,99,5,6,0,99"))

test5 =
  TestCase (assertEqual "1,9,10,3,2,3,11,0,99,30,40,50" [3500,9,10,70,2,3,11,0,99,30,40,50] (intCode "1,9,10,3,2,3,11,0,99,30,40,50"))


test1_opcode = TestCase (assertEqual "opcode should multiply" 2 (opcode 1 1 1))

test2_opcode = TestCase (assertEqual "opcode should add" 1 (opcode 2 1 1))
