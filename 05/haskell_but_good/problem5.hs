import Prelude hiding (gcd, lcm) -- haskell comes with lcm and gcd but I won't use them

gcd :: Int -> Int -> Int
gcd a 0 = a
gcd a b = gcd b (a `rem` b)

lcm :: Int -> Int -> Int
lcm a b = (a*b) `div` (gcd a b)

main = putStrLn $ show $ foldl lcm 1 [1..20]
