-- https://stackoverflow.com/questions/21775378/get-all-possible-combinations-of-k-elements-from-a-list
combinations :: Int -> [Int] -> [[Int]]
combinations n ls = [x | x <- mapM (const ls) [1..n], head x < head (tail x)]

divisors :: Int -> [Int]
divisors 1 = []
divisors n = 1 : (concat $ map (\f -> [f, n `div` f]) halfDivisors)
    where intSqrt = (floor . sqrt . fromIntegral)
          halfDivisors = filter ((==0) . (rem n)) [2..intSqrt n]

isAbundant :: Int -> Bool
isAbundant n = sum (divisors n ) > n

-- the length is 6971 which is kind of a lot, and 28122 is abundant 
-- so I don't think it can be reduced further
abundantNumbers :: [Int]
abundantNumbers = filter isAbundant [12..28123]

-- isSumFromArray :: Int -> [Int] -> Bool
-- isSumFromArray n ls = 

-- isSumAbundant :: Int -> Int
-- isSumAbundant = 
