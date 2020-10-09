module Lib where

import Data.Maybe (fromJust)
import Data.List (find, nub)
import qualified Data.HashMap as M

import Prelude

isPrime :: Int -> Bool
isPrime n
  | n == 1 = False
  | n `elem` [2, 3, 5] = True
  | otherwise = not $ any (\x -> n `rem` x == 0 || n `rem` (x + 2) == 0) (2 : 3 : [5,11..intSqrt n])
  where intSqrt n = ceiling $ sqrt $ fromIntegral n

wheelFactor :: Int -> Int
wheelFactor n = fromJust $ find ((==0) . rem n) testLS
    where testLS = 2 : 3 : 5 : 7 : 11 : zipWith (+) (tail $ cycle incr) (tail testLS)
          incr = [4, 2, 4, 2, 4, 6, 2, 6]

fullFactor :: (Int -> Int) -> Int -> [Int]
fullFactor algo n 
  | isPrime n = [n]
  | otherwise = (fullFactor algo fac) ++ (fullFactor algo (n `div` fac))
  where fac = wheelFactor n

runLenEncode :: (Eq a) => [a] -> [(a, Int)]
runLenEncode [x] = [(x, 1)]
runLenEncode (x:xs)
    | x == next_x = (next_x, next_cnt + 1) : (tail next)
    | otherwise = (x, 1) : next
    where next = runLenEncode xs
          (next_x, next_cnt) = head next

maxUnion :: M.Map Int Int -> M.Map Int Int -> M.Map Int Int
maxUnion a b = helper (nub $ concat [M.keys a, M.keys b]) a b
    where maxVal :: Int -> M.Map Int Int -> M.Map Int Int -> Int
          maxVal x a b = max (M.findWithDefault 0 x a) (M.findWithDefault 0 x b)

          helper :: [Int] -> M.Map Int Int -> M.Map Int Int -> M.Map Int Int
          helper [x] a b = M.singleton x (maxVal x a b)
          helper (x:xs) a b = M.union (M.singleton x (maxVal x a b)) (helper xs a b)

unionProd :: M.Map Int Int -> Int
unionProd m = product $ map (\(b, e) -> b^e) (M.assocs m)

mapFactor :: (Int -> Int) -> Int -> M.Map Int Int 
mapFactor algo n = M.fromList $ runLenEncode $ fullFactor algo n

lcm :: [Int] -> Int
lcm ls = unionProd $ foldl maxUnion M.empty (map (mapFactor wheelFactor) ls)
