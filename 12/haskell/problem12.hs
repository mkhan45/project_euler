import Data.List
import Data.Maybe

countFactors :: Int -> Int
countFactors n = length $ filter ((==0) . (rem n)) [1..n]

triangularNums :: [Int]
triangularNums = 1 : helper 2 1 where
    helper :: Int -> Int -> [Int]
    helper i current = let next = current + i in next : helper (i + 1) next
