import System.IO
import Data.List

-- https://projecteuler.net/project/resources/p022_names.txt
splitOn :: Char -> String -> [String]
splitOn delim = foldr f [[]]
    where f c l@(x:xs)
            | c == delim = []:l
            | otherwise = (c:x):xs

alphaVal :: String -> Int
alphaVal = sum . map ((subtract 64) . fromEnum)

scoreNames :: String -> [Int]
scoreNames str = map (\(a, b) -> a * b) enumerated
    where sortedNames = sort $ splitOn ',' (filter (/='"') str)
          enumerated = zip [1..] (map alphaVal sortedNames)

main = do 
    file <- openFile "../names.txt" ReadMode
    str <- hGetContents file
    putStrLn $ show $ sum $ scoreNames str
