import Data.Maybe
import Data.List (find)

wheelFactor :: Int -> Int
wheelFactor n = fromMaybe n $ find ((==0) . rem n) (takeWhile ((< n) . floor . sqrt . fromIntegral) testLS)
    where testLS = 2 : 3 : 5 : 7 : 11 : zipWith (+) (cycle incr) (drop 4 testLS)
          incr = [4, 2, 4, 2, 4, 6, 2, 6]

main = do
    let n = 600851475143
    putStrLn $ show $ n `div` (wheelFactor n)
