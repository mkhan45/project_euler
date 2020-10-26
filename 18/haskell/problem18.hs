tri :: [[Int]]
tri = [[75],
       [95, 64],
       [17, 47, 82],
       [18, 35, 87, 10],
       [20, 04, 82, 47, 65],
       [19, 01, 23, 75, 03, 34],
       [88, 02, 77, 73, 07, 63, 67],
       [99, 65, 04, 28, 06, 16, 70, 92],
       [41, 41, 26, 56, 83, 40, 80, 70, 33],
       [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
       [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
       [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
       [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
       [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
       [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]]
-- tri = [[3],
--        [7, 4],
--        [2, 4, 6],
--        [8, 5, 9, 3]]

-- 75 -> 95, 64
-- 95 -> [17, 47], 64 -> [47, 82]

-- with flat array
-- 0 -> [1, 2]
-- 1 -> [3, 4], 2 -> [4, 5]
-- 3 -> [6, 7], 4 -> [7, 8], 5 -> [8, 9]

-- with 2D matrix
-- (0, 0) -> [(1, 0), (1, 1)]
-- (1, 0) -> [(2, 0), (2, 1)], (1, 1) -> [(2, 1), (2, 2)]
-- (2, 0) -> [(3, 0), (3, 1)], (2, 1) -> [(3, 1), (3, 2)], (2, 2) -> [(3, 2), (3, 3)]
-- 2D is probably easier

data Node = Nil | Val Int (Node) (Node) deriving Eq
instance Show Node where
    show Nil = "Nil"
    show (Val v Nil Nil) = show v
    show (Val v n1 n2) = concat [show v, " -> ", "(", show n1, ", ", show n2, ")"]

-- I can't believe this works but it do
-- there's a good bit of memory wasted
constructGraph :: Node
constructGraph = helper 0 0
    where helper :: Int -> Int -> Node
          helper row col
            | row >= (length tri) = Nil
            | col > row = Nil
            | otherwise = Val (tri!!row!!col) (helper (row + 1) col) (helper (row + 1) (col + 1))

-- for the harder version of this, I could use an arena style graph and reduce each index to it max sum
-- not sure how it'd work in haskell

maxGraphSum :: Node -> Int
maxGraphSum Nil = 0
maxGraphSum (Val v n1 n2) = v + (max (maxGraphSum n1) (maxGraphSum n2))

-- this one is a bit faster
constructGraphSum ::  Int
constructGraphSum = helper 0 0
    where helper :: Int -> Int -> Int
          helper row col
            | row >= (length tri) = 0
            | col > row = 0
            | otherwise = tri!!row!!col + (max (helper (row + 1) col) (helper (row+1) (col+1)))

-- main = putStrLn $ show $ maxGraphSum constructGraph
main = putStrLn $ show constructGraphSum
