-- a^2 + b^2 = c^2
-- a + b + c = 1000
-- a = 1000 - b - c
-- (1000 - b - c) + b^2 = c^2
-- 1000 - b + b^2 = c^2 - c
-- a < b < c

-- there's two unknowns so I think there must be two loops
-- I'm sure there's some neat shortcuts but it's less than 400^2 iterations so I'll bruteforce

main = putStrLn $ show $ head [a * b * c | b <- [1..400], a <- [1..b-1], c <- [1000 - a - b], a^2 + b^2 == c^2]
