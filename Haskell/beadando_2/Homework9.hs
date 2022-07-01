module Homework9 where

import Data.List
    
notFilter :: (a -> Bool) -> [a] -> [a]
notFilter p [] = []
notFilter p (x:xs)
    | p x = notFilter p xs
    | otherwise = x : notFilter p xs

longestSame :: Eq a => [a] -> Int
longestSame [] = 0
-- longestSame (x:xs) = takeWhile (==x) (x:xs) :  longestSame (dropWhile (==x) xs)
--   where
    --   (bal,jobb) = span (==x) (x:xs)



-- longestSame [] = 0
-- longestSame (x:xs)
    -- |  x > longestSame xs = 1 + (longestSame xs)
    -- | otherwise = longestSame xs


longestSame xs = maximum $ map length $ group $ xs

tribonacci :: [Integer]
tribonacci  = map head $ iterate (\[a,b,c] -> [b,c,a + b + c]) [0,0,1]

-- tribonacci = (\(a,_,_) -> a) $ (iterate a (1,0,0))


repeatingElements :: [Int] -> [a] -> [a]
repeatingElements [] ys = []
repeatingElements xs [] = []
repeatingElements (x:xs) (y:ys) = replicate x y ++ repeatingElements xs ys
