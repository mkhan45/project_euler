{-# LANGUAGE MagicHash #-}

import GHC.Exts
import GHC.Integer.Logarithms

word :: Int -> String
word n
  | n < 20 = (ones ++ teens) !! n
  | n < 100 = if remainder == 0 then first
                                else concat [first, " ", word remainder]
  | magnitude <= 3 = concat (if remainder == 0 then [first, " ", magnitudeWord]
                                               else [first, " ", magnitudeWord, " and ", word remainder])
  where magnitude = I# (integerLogBase# 10 (fromIntegral n))
        magnitudes = ["hundred", "thousand"]
        remainder = n `rem` (10^magnitude)
        magnitudeWord = magnitudes !! (magnitude - 2)
        first = if n < 100 then (tens!!(n `div` 10 - 2)) else ones !! (n `div` 10^magnitude)
        ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
        tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

word2 :: Int -> String
word2 n
  | n < 20 = (ones ++ teens)!!n
  | n < 100 = wordL100 n
  | magnitude <= 3 = wordL10k n
  | otherwise = wordG10k n
  where magnitude = I# (integerLogBase# 10 (fromIntegral n))
        remainder = n `rem` (10^magnitude)
        small_magnitudes = ["hundred", "thousand"]
        big_magnitudes = ["thousand", "million", "billion", "trillion"]
        ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
        tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

        wordL100 :: Int -> String
        wordL100 n
          | remainder == 0 = first
          | otherwise = concat [first, " ", word2 remainder]
          where first = tens!!(n `div` 10 - 2)

        wordL10k :: Int -> String
        wordL10k n
          | remainder == 0 = concat [first, " ", magnitudeWord]
          | otherwise = concat [first, " ", magnitudeWord, " and ", word remainder]
          where first = ones!!(n `div` 10^magnitude)
                magnitudeWord = small_magnitudes!!(magnitude - 2)

        -- TODO
        wordG10k :: Int -> String
        wordG10k n 
          | remainder == 0 = first
          | otherwise = concat [first, " ", big_magnitudes!!(magnitude `div` 3 - 1), " ", word2 remainder]
          where mult_magnitude = magnitude `div` 3
                first = word2 (n `div` 10^mult_magnitude)

main = putStrLn $ show $ sum $ map (length . filter (/= ' ') . word) [1..1000]
