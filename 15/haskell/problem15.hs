-- . . . .
-- . . . .
-- . . . .
-- . . . .

-- very slow :(
countPaths :: Integer -> Integer -> Integer
countPaths 1 1 = 2
countPaths x 1 = 1 + countPaths (x - 1) 1
countPaths 1 y = 1 + countPaths 1 (y - 1)
countPaths x y = (countPaths (x - 1) y) + (countPaths x (y - 1))

-- 2^n total # of choice sequences, how many ways to choose n?
-- I have an idea for how to make this work with non square grids
-- but no time to try it
countPathsSpeed :: Integer -> Integer
countPathsSpeed n = (product [(2*n - i) | i <- [0..n-1]]) `div` (product [1..n])

main = putStrLn $ show $ countPathsSpeed 20
