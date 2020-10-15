import Data.List
import Data.Ord

countCollatz :: Int -> Int
countCollatz 1 = 1 
countCollatz n 
    | n `rem` 2 == 0 = 1 + countCollatz (n `div` 2)
    | otherwise = 1 + countCollatz (3*n + 1)

main = putStrLn $ show $ maximumBy (comparing fst) (zip (map countCollatz [1..1000000]) [1..])
