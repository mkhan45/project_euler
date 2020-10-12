isPrime :: Int -> Bool
isPrime n
  | n == 1 = False
  | n `elem` [2, 3, 5] = True
  | otherwise = not $ any (\x -> n `rem` x == 0 || n `rem` (x + 2) == 0) (2 : 3 : [5,11..intSqrt n])
  where intSqrt n = ceiling $ sqrt $ fromIntegral n

-- this is probably much slower than it could be but not bad
main = putStrLn $ show $ sum $ takeWhile (<2000000) (filter isPrime [1..])
