-- . . . .
-- . . . .
-- . . . .
-- . . . .

-- the increment is the column to the left
--      1       1       1       1       1
--      1       2       3       4       5
--      1       3       6       10      15
--      1       4       10      20      35
--      1       5       15      35      70

-- very slow :(
countPaths :: Integer -> Integer -> Integer
countPaths 0 _ = 1
countPaths _ 0 = 1
countPaths x 1 = 1 + countPaths (x - 1) 1
countPaths 1 y = 1 + countPaths 1 (y - 1)
countPaths x y = (countPaths (x - 1) y) + (countPaths x (y - 1))

-- 2^n total # of choice sequences, how many ways to choose n?
-- I have an idea for how to make this work with non square grids
-- but no time to try it
countPathsSpeed :: Integer -> Integer
countPathsSpeed n = (product [(2*n - i) | i <- [0..n-1]]) `div` (product [1..n])

-- this is on the haskell project Euler wiki and it's extremely cool
countPaths2 :: Int -> Int -> Integer
countPaths2 x y = iterate (scanl1 (+)) (repeat 1) !! x !! y

main = putStrLn $ show $ countPathsSpeed 20
