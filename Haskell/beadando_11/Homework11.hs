module Homework11 where
import Data.List

filterFilter :: (a -> Bool) -> ([[a]] -> [[a]])
filterFilter f xs = map (filter f) xs

iterateUntil :: (a -> Bool) -> (a -> a) -> a -> [a]
iterateUntil p f = takeWhile (not . p) . iterate f


elemsGreaterThanIndex :: [Int] -> [Int]
elemsGreaterThanIndex xs = elemsGreaterThanIndex' xs 1



elemsGreaterThanIndex' :: [Int] -> Int -> [Int]
elemsGreaterThanIndex' [] _ = []
elemsGreaterThanIndex' (x:xs) n
    | x > n = x : elemsGreaterThanIndex' xs (n + 1)
    | otherwise = elemsGreaterThanIndex' xs (n + 1)
