module Gyak11 where

import Prelude hiding (foldr, foldl, sqrt, uncurry, curry)
import Data.List

-- Newton módszer négyzetgyök számolására
-- until függvény: iterálás feltételig
-- sqrt :: RealFloat a => a -> a
-- sqrt a = until (\x -> abs (x*x - a) < 1e-8 ) iterate (\x -> (x+a/x)/2) a

-- uncurry és curry:
uncurry :: (a -> b -> c) -> ((a, b) -> c)
uncurry f (a,b) = f a b
curry :: ((a, b) -> c) -> a -> b -> c
curry f a b = f (a,b)

-- A compress inverze
-- Használható függvény: concatMap
decompress :: Eq a => [(Int,a)] -> [a]
decompress xs = concatMap (uncurry replicate) xs

-- Súlyozott összeg
weightedSum :: Num a => [(a,a)] -> a
weightedSum = sum . map (uncurry (*))

-- Függvénykompozíció használata (http://lambda.inf.elte.hu/Composition.xml)
numbersMadeOfOnes :: [Integer]
-- numbersMadeOfOnes = iterate (\x -> 10*x + 1) 1
numbersMadeOfOnes = iterate ((+1) . (*10)) 1
numbersMadeOfThrees :: [Integer]
numbersMadeOfThrees = iterate ((+3) . (*10)) 3

numbersMadeOfThreesAndOne :: [Integer]
numbersMadeOfThreesAndOne = map (+(-2)) numbersMadeOfThrees
-- numbersMadeOfThreesAndOne = iterate ((+21) . (*10)) 1

-- Szóközök eldobása
dropSpaces :: String -> String
dropSpaces = dropWhile (==' ')
trim :: String{-véges-} -> String
trim = reverse . dropSpaces . reverse . dropSpaces

-- Minimumok maximuma
maximumOfMinimums :: Ord a => [[a]] -> a
maximumOfMinimums = maximum . map minimum

-- Dupla map
mapMap :: (a -> b) -> [[a]] -> [[b]]
mapMap = map . map

-- Miért működik? Mert jó a haskell C:
-- map :: (a -> b) -> [a] -> [b]
-- (.) :: (b -> c) -> (a -> b) -> a -> c

-- Kezdőbetűk
firstLetters :: String -> String
firstLetters = unwords . map (take 1) . words
monogram :: String -> String
-- monogram = .unwords  map(++".") . map (take 1) . words
monogram = unwords . map ((++".") . take 1) . words

-- Ismétlődő elemek manipulálása
reduce :: Eq a => [a] -> [a]
reduce = map head . group
uniq :: Ord a => [a]{-véges-} -> [a]
uniq = reduce . sort
repeated :: Ord a => [a]{-véges-} -> [a]
repeated = map head . filter ((>1) . length) . group . sort

-- Részsorozatok
sublists :: [a] -> [[a]]
sublists = concat . map (init . tails) . tail . inits

-- Iterálás feltételig
until :: (a -> Bool) -> (a -> a) -> a -> a
until p f = head . filter p . iterate f


-- Hajtogatások (folding) (http://lambda.inf.elte.hu/Folds.xml)
-- Jobbról hajtogatás
-- foldr :: (a -> b -> b) -> b -> [a] -> b

-- Balról hajtogatás
-- foldl :: (b -> a -> b) -> b -> [a] -> b

-- sum :: Num a => [a]{-véges-} -> a
-- product :: Num a => [a]{-véges-} -> a

-- Beszúrásos rendezés
-- isort :: Ord a => [a] -> [a]

-- concat :: [[a]] -> [a]
-- (++) :: [a] -> [a] -> [a]

-- length :: [a]{-véges-} -> Int
-- reverse :: [a]{-véges-} -> [a]

-- maximum :: Ord a => [a]{-véges, nemüres-} -> a

-- foldl1 :: Foldable t => (a -> a -> a) -> t a -> a
-- foldr1 :: Foldable t => (a -> a -> a) -> t a -> a

-- Pásztázás (scanning)
-- Jobbról pásztázás
-- scanr :: (a -> b -> b) -> b -> [a] -> [b]

-- Balról pásztázás
-- scanl :: (b -> a -> b) -> b -> [a] -> [b]

-- sums :: [Integer] -> [Integer]
-- fibs :: [Integer]

-- A scan-nek is van kezdőérték nélküli változata: scanr1 és scanl1
-- increasingMaximums :: Ord a => [a] -> [a]