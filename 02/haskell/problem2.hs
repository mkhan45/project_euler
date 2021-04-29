import Data.List

-- a lazy list of all the even fibs
evenFibs = 0 : 2 : zipWith (\a b -> 4 * b + a) evenFibs (tail evenFibs)

main = putStrLn $ show $ sum $ takeWhile (<= 4000000) evenFibs
