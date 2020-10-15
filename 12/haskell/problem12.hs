import Data.List
import Data.Maybe

isPrime :: Int -> Bool
isPrime n
  | n == 1 = False
  | n `elem` [2, 3, 5] = True
  | otherwise = not $ any (\x -> n `rem` x == 0 || n `rem` (x + 2) == 0) (2 : 3 : [5,11..intSqrt n])
  where intSqrt n = ceiling $ sqrt $ fromIntegral n

wheelFactor :: Int -> Int
wheelFactor n = fromJust $ find ((==0) . rem n) testLS
    where testLS = 2 : 3 : 5 : 7 : 11 : zipWith (+) (tail $ cycle incr) (tail testLS)
          incr = [4, 2, 4, 2, 4, 6, 2, 6]

fullFactor :: (Int -> Int) -> Int -> [Int]
fullFactor algo n 
  | isPrime n || n == 1 = [n]
  | otherwise = (fullFactor algo fac) ++ (fullFactor algo (n `div` fac))
  where fac = wheelFactor n

runLenEncode :: (Eq a) => [a] -> [(a, Int)]
runLenEncode [x] = [(x, 1)]
runLenEncode (x:xs)
    | x == next_x = (next_x, next_cnt + 1) : (tail next)
    | otherwise = (x, 1) : next
    where next = runLenEncode xs
          (next_x, next_cnt) = head next

countFactors :: Int -> Int
countFactors n = product $ map ((+1) . snd) factorTup
    where factorTup = runLenEncode $ fullFactor wheelFactor n

triangularNums :: [Int]
triangularNums = scanl (+) 1 [2..]

main = putStrLn $ show $ head $ filter ((>500) . countFactors) triangularNums
