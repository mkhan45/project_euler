import Data.List

divisors :: Int -> [Int]
divisors 1 = []
divisors n = 1 : (concat $ map (\f -> [f, n `div` f]) halfDivisors)
    where intSqrt = (floor . sqrt . fromIntegral)
          halfDivisors = filter ((==0) . (rem n)) [2..intSqrt n]

d = sum . nub . divisors

-- only works for ranges starting with 0 :/
amicableNumbers :: Int -> [Int]
amicableNumbers threshold = map fst (filter (\(a, i) -> isAmicable a i sumDivs) (zip [0..threshold] [0..threshold - 1]))
    where sumDivs = map d [0..threshold]

isAmicable :: Int -> Int -> [Int] -> Bool
isAmicable a i sumDivs 
  | a <= 1 = False
  | i >= length sumDivs = False
  | b >= length sumDivs = False
  | a == b = False
  | otherwise = a == sumDivs!!b
  where b = sumDivs!!i

-- potentially I thought I'd have to do more than 10_000 since there could be a number under
-- 10k with an amicable # over 10k but it worked
main = putStrLn $ show $ sum $ amicableNumbers 10000
