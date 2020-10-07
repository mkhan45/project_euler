import Data.Maybe
import Data.List (find)

divis :: Int -> Int -> Bool
divis n i = n `rem` i == 0

isPrime :: Int -> Bool
isPrime n
  | n == 1 = False
  | n `elem` [2, 3, 5] = True
  | otherwise = not $ any (divis n) (2 : 3 : [5,11..intSqrt n])
  where intSqrt n = ceiling $ sqrt $ fromIntegral n

wheelFactor :: Int -> Int
wheelFactor n
  | isPrime n = n
  | isJust found = fromJust found 
  where found = find (divis n) ([2, 3, 5, 7, 11] ++ testLS)
        testLS = 7 : 11 : zipWith (+) (tail $ cycle [4, 2, 4, 2, 4, 6, 2, 6]) (tail testLS)

main = do
    let n = 600851475143
    putStrLn $ show $ n `div` (wheelFactor n)
