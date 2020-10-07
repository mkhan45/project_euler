import Data.Maybe
import Data.List (find)

wheelFactor :: Int -> Int
wheelFactor n = fromJust $ find ((==0) . rem n) testLS
    where testLS = 2 : 3 : 5 : 7 : 11 : zipWith (+) (tail $ cycle incr) (tail testLS)
          incr = [4, 2, 4, 2, 4, 6, 2, 6]

main = do
    let n = 600851475143
    putStrLn $ show $ n `div` (wheelFactor n)
