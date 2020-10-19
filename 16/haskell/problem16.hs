digs :: Integral x => x -> [Int]
digs 0 = []
digs x = digs (x `div` 10) ++ [fromIntegral $ x `mod` 10]

main = putStrLn $ show $ sum $ digs ((2::Integer)^1000)
