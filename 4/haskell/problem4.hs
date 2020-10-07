import Data.Maybe
import Data.List (find)

sixDigitPalindromes :: [Int]
sixDigitPalindromes = map (\i -> 1000 * i + (revDigits i)) lefts
    where lefts = [999,998..100]
          revDigits n = 100 * (n `rem` 10) + 10 * (n `div` 10 `rem` 10) + (n `div` 100) --only works for 3 digit #s

isThreeDigitProduct :: Int -> Bool
isThreeDigitProduct n = any (threeDigFac n) [999,998..100] -- only works on 6 digit ints
    where threeDigFac n i = let fac = n `div` i in 100 <= fac && fac <= 999

main = do
    putStrLn $ show $ head $ filter isThreeDigitProduct sixDigitPalindromes
