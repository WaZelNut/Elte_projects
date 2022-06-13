module Homework8 where
import Prelude hiding (mapWhile)

filterMap :: (a -> Bool) -> (a -> b) -> [a] -> [b]
filterMap f s [] = []
filterMap f s (x:xs) = map s (filter f (x:xs))

mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple f (x,y) = (f x,f y)

some :: (a -> Bool) -> [a] -> Bool
some f [] = False
some f xs
    | length([n | n <-xs, f n]) >=2 = True
    | otherwise = False

mapWhile :: (a -> Bool) -> (a -> b) -> [a] -> [b]
mapWhile p h [] = []
mapWhile p h (x:xs)
    | p x = h x : mapWhile p h xs
    | otherwise = []
