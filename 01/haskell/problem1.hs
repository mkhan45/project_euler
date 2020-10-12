three_five :: Int -> Int
three_five x = sum $ filter (\x -> x `rem` 3 == 0 || x `rem` 5 == 0) [1..x-1]

main = putStrLn $ show $ three_five 1000
