import Data.List

evenFibs = 0 : 2 : zipWith (\a b -> 4 * b + a) evenFibs (tail evenFibs)

main = putStrLn $ show $ sum $ takeWhile (< 40000000) evenFibs
