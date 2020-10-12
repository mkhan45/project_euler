import Prelude hiding (gcd, lcm) -- haskell comes with lcm and gcd but I won't use them

gcd :: Int -> Int -> Int
gcd a 0 = a
gcd a b = gcd b (a `mod` b)

gcdLS :: [Int] -> Int 
gcdLS [a, b] = gcd a b
gcdLS (x:xs) = gcd x (gcdLS xs)

lcm :: Int -> Int -> Int
lcm a b = (a*b) `div` (gcd a b)

lcmLS :: [Int] -> Int
lcmLS [a, b] = lcm a b
lcmLS (x:xs) = lcm x (lcmLS xs)

main = putStrLn $ show $ lcmLS [1..20]
