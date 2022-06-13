module Gyak9 where

import Prelude hiding ((.), zipWith, sqrt, uncurry, curry, all, any, elem)

-- Továbbra is magasabbrendű függvények

all :: (a -> Bool) -> [a]{-véges-} -> Bool
all p [] = True
-- all p (x:xs)
    -- | p x = all p xs
    -- | otherwise = False
all p (x:xs) = p x && all p xs

any :: (a -> Bool) -> [a]{-véges-} -> Bool
any p [] = False
any p (x:xs) = p x || any p xs

-- Curryzhető függvény lesz, ha az any-t használjuk.
elem :: Eq a => a -> [a]{-véges-} -> Bool
elem e = any (==e)


-- Segédfüggvénynek használjuk a flip és notElem függvényeket.
filters :: Eq a => [a] -> [a] -> [a]
filters xs = filter (flip notElem xs)

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys
zipWith _ _ _ = []

-- zipWith alkalmazása
differences :: Num a => [a] -> [a]
differences xs = zipWith (-) (tail xs) xs
-- differences (x:xs) = zipWith (-) xs (x:xs)

-- Névtelen függvények, lambdák
-- A matematikai jelöléshez hasonló szintaxissal adhatunk meg névtelen függvényeket
-- Pl.:
inc :: Int -> Int
inc = \x -> x + 1

add :: Int -> Int -> Int
add = \x y -> x + y


-- Függvénykompozíció lambdával
(.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = h
--   where
    --   h x = f (g x)
-- (f . g) x = f (g x)
(.) = \a b x -> a (b x)


-- Fibonacci párok, mintaillesztés lambdákban
fibPairs :: [(Integer, Integer)]
fibPairs = iterate (\(a, b) -> (b, a+b)) (0,1)

-- Egyenlő elemek csoportosítása
group :: Eq a => [a]{-véges-} -> [[a]]
group [] = []
group (x:xs) = bal : group jobb
  where
      (bal,jobb) = span (==x) (x:xs)

-- Egymás után ismétlődő elemek tömörítése
compress :: Eq a => [a] -> [(Int,a)]
compress = map (\l@(x:xs) -> (length l, x)) . group

-- Pascal háromszög előállítása
--     1
--    1 1
--   1 2 1
--  1 3 3 1
-- 1 4 6 4 1
pascalTriangle :: [[Integer]]
pascalTriangle = iterate (\xs -> [1] ++ zipWith (+) (tail xs) xs ++ [1]) [1]

-- Newton módszer négyzetgyök számolására
-- until függvény: iterálás feltételig
-- sqrt :: RealFloat a => a -> a

-- uncurry és curry:
-- uncurry :: (a -> b -> c) -> ((a, b) -> c)
-- curry :: ((a, b) -> c) -> a -> b -> c

-- A compress inverze
-- Használható függvény: concatMap
-- decompress :: Eq a => [(Int,a)] -> [a]

-- Súlyozott összeg
-- weightedSum :: Num a => [(a,a)] -> a


-- Függvénykompozíció használata (http://lambda.inf.elte.hu/Composition.xml)
-- numbersMadeOfOnes :: [Integer]
-- numbersMadeOfThrees :: [Integer]
-- numbersMadeOfThreesAndOne :: [Integer]

-- Szóközök eldobása
-- dropSpaces :: String -> String
-- trim :: String{-véges-} -> String

-- Minimumok maximuma
-- maximumOfMinimums :: Ord a => [[a]] -> a

-- Dupla map
-- mapMap :: (a -> b) -> [[a]] -> [[b]]

-- Miért működik?
-- map :: (a -> b) -> [a] -> [b]
-- (.) :: (b -> c) -> (a -> b) -> a -> c

-- Kezdőbetűk
-- firstLetters :: String -> String
-- monogram :: String -> String

-- Ismétlődő elemek manipulálása
-- reduce :: Eq a => [a] -> [a]
-- uniq :: Ord a => [a]{-véges-} -> [a]
-- repeated :: Ord a => [a]{-véges-} -> [a]

-- Iterálás feltételig
-- until :: (a -> Bool) -> (a -> a) -> a -> a

-- Részsorozatok
-- sublists :: [a] -> [[a]]