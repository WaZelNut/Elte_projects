module Gyak12 where

import Prelude hiding (foldr, foldl, and, or, concat, (++), length, reverse, maximum, minimum, scanr, scanl, sum, product)
import Data.List (group, insert, sortBy)
import Data.Char
import Data.Function (on)

-- Hajtogatások (folding) (http://lambda.inf.elte.hu/Folds.xml)
-- Jobbról hajtogatás
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f s [] = s
foldr f s (x:xs) = f x (foldr f s xs)

-- Balról hajtogatás
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f s [] = s
foldl f s (x:xs) = foldl f (f s x) xs

sum :: Num a => [a]{-véges-} -> a
sum = foldr (+) 0
product :: Num a => [a]{-véges-} -> a
product = foldr (*) 1

and :: [Bool] -> Bool
-- and = foldr (==) True
and = foldr (&&) True


or :: [Bool] -> Bool
or = foldr (||) False


-- Beszúrásos rendezés
isort :: Ord a => [a] -> [a]
isort = foldr insert []

concat :: [[a]] -> [a]
concat = foldr (++) []
(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

length :: [a]{-véges-} -> Int
length = foldr (\ x acc -> acc+1) 0
reverse :: [a]{-véges-} -> [a]
reverse = foldl (flip (:)) []

maximum :: Ord a => [a]{-véges, nemüres-} -> a
maximum (x:xs)= foldr (max) x xs

-- foldl1 :: Foldable t => (a -> a -> a) -> t a -> a
-- foldr1 :: Foldable t => (a -> a -> a) -> t a -> a

minimum :: Ord a => [a] -> a
minimum = foldr1 min

-- Pásztázás (scanning)
-- Jobbról pásztázás
scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr f s [] = [s]
-- scanr f s (x:xs) = f x (head (scanr f s xs)): scanr f s xs
scanr f s (x:xs) = f x h: l
    where
        l@(h:_) = scanr f s xs

-- Balról pásztázás
scanl :: (b -> a -> b) -> b -> [a] -> [b]
scanl f s [] = [s]
scanl f s (x:xs) = s : scanl f (f s x) xs

sums :: [Integer] -> [Integer]
sums = scanl1 (+)
fibs :: [Integer]
fibs = 1 : 0 : sums fibs

-- A scan-nek is van kezdőérték nélküli változata: scanr1 és scanl1
increasingMaximums :: Ord a => [a] -> [a]
increasingMaximums =map head . group . scanl1 (max)


-- ByFunctions
-- Néhány eddig nézett függvénynek létezik a By-os verziója is, amikor
-- megadhatjuk hogy milyen művelet alapján végezzék a feladatukat,
-- pl.: groupBy, maximumBy, minimumBy, sortBy

-- group: Elemek csoportosítása egyenlőség szerint.
-- De akarhatnánk más szerint is a csoportokat:

-- groupBy :: (a -> a -> Bool) -> [a] -> [[a]]

-- A csoport első eleme határozza meg hogy mik kerülhetnek vele egy csoportba.


-- Az on függvény a Data.Function modulban található
-- Egyfajta függvénykompozíció, de egy bináris és egy unáris függvényt komponálunk össze
-- on :: (b -> b -> c) -> (a -> b) -> (a -> a -> c)

-- numbersInString :: String -> [String]
-- compressPairs :: Eq a => [(a,b)] -> [(a,[b])]

divisors :: Int -> [Int]
divisors n = [d | d<-[1..n], n `mod` d == 0]

-- maxDivisors :: [Int]


-- Ordering adatszerkezet, három konstruktora van: LT, EQ, GT
-- data Ordering

-- compare :: Ord a => a -> a -> Ordering


-- maximumBy, minimumBy, sortBy: a Data.List modulban találhatóak
-- maximumBy :: (a -> a -> Ordering) -> [a] -> a
-- minimumBy :: (a -> a -> Ordering) -> [a] -> a


-- longestWord :: String -> String

-- mostFrequentChar :: String -> Char

-- closestToOrigo :: Real a => [(a, a)] -> (a, a)

-- maxIndex :: Ord a => [a] -> Int
-- maxIndices :: Ord a => [a] -> [Int]

-- maxDivisorsUntil :: Integer -> Integer

-- Rendezés csökkenő sorrendben
-- sortDesc :: Ord a => [a] -> [a]