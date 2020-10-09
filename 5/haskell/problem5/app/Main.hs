module Main where

import qualified Data.HashMap as M
import Data.Maybe
import Data.List

import Lib

bruteForce :: [Int] -> Int
bruteForce ls = helper ls [1..]
    where helper ls (x:xs)
            | all (==0) (map (rem x) ls) = x
            | otherwise = helper ls xs


main :: IO ()
main = putStrLn $ show $ Lib.lcm [1..20]
