{-# LANGUAGE MagicHash #-}

import GHC.Exts
import GHC.Integer.Logarithms

word :: Int -> String
word n
  | n < 20 = (ones ++ teens) !! n
  | n < 100 = if remainder == 0 then first
                                else concat [first, " ", word remainder]
  | otherwise = concat (if remainder == 0 then [first, " ", magnitudeWord]
                                          else [first, " ", magnitudeWord, " and ", word remainder])
  where magnitude = I# (integerLogBase# 10 (fromIntegral n))
        magnitudes = ["hundred", "thousand"]
        remainder = n `rem` (10^magnitude)
        magnitudeWord = magnitudes !! (magnitude - 2)
        first = if n < 100 then (tens!!(n `div` 10 - 2)) else ones !! (n `div` 10^magnitude)
        ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
        tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

main = putStrLn $ show $ sum $ map (length . filter (/= ' ') . word) [1..1000]
