module Gyak5 where

import Prelude hiding (last, init, minimum, concat, (++), zip, elem, insertions, permutations)

last :: [a]{-nemüres-} -> a
-- last xs = xs !! (length xs - 1)
last [x] = x
last (x:xs) = last xs

init :: [a]{-nemüres-} -> [a]
init [x] = []
init (x:xs) = x : init xs

minimum :: Ord a => [a]{-véges, nemüres-} -> a
minimum [x] = x
minimum (x:xs) = min x (minimum xs)
-- * Gyakorlás:
-- maximum :: Ord a => [a]{-véges, nemüres-} -> a


concat :: [[a]] -> [a]
concat [] = []
concat (x:xs) = x ++ concat xs

(++) :: [a] -> [a] -> [a]
-- [] ++ ys = ys
-- xs ++ ys = init xs ++ (last xs : ys)
[] ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys) 

-- Elemek váltogatva
merge :: [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = x : y : merge xs ys

-- * Gyakorlás:
zip :: [a] -> [b] -> [(a,b)]
zip (x:xs) (y:ys) = (x,y) : zip xs ys
zip _ _ = []

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf _ [] = False
isPrefixOf (x:xs) (y:ys) = x == y && isPrefixOf xs ys

elem :: Eq a => a -> [a] -> Bool
elem e [] = False
elem e (x:xs) = e == x || elem e xs

-- Data.List modulban lévő függvény, a többszörös elemeket hagyja el.
nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = x : nub [n | n <- xs, n /= x]

-- Vágjunk le egy listából adott hosszúságú részeket úgy, hogy a hosszúságokat egy listában kapjuk!
slice :: [Int] -> [a] -> [[a]]
slice [] xs = []
slice (n:ns) xs = take n xs : slice ns (drop n xs)

-- Definiáljuk az every függvényt, amely veszi egy lista minden n-edik elemét!
-- l@(x:xs) minta
every :: Int -> [a] -> [a]
every n [] = []
every n l@(x:xs) = x : every n (drop n l)


-- Quicksort (http://lambda.inf.elte.hu/Recursion.xml#feladat-gyorsrendez%C3%A9s)
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort [n | n <- xs, n <= x] ++ [x] ++ qsort [n | n <- xs, n > x]

-- Állítsuk elő egy lista összes lehetséges végződését! (A Data.List modulban már definiált.)
tails :: [a] -> [[a]]
tails [] = [[]]
tails l@(x:xs) = l : tails xs 

-- * Gyakorlás
-- Állítsuk elő egy lista összes prefixét! (A Data.List modulban már definiált.)
inits :: [a] -> [[a]] 
inits [] = [[]]
inits (x:xs) = [] : [x:i | i<-inits xs]

insertions :: a -> [a] -> [[a]]
insertions e [] = [[e]]
insertions e l@(x:xs) = (e:l) : [x:i | i <- insertions e xs]

-- Permutációk (http://lambda.inf.elte.hu/Recursion.xml#feladat-permut%C3%A1ci%C3%B3k)
-- Ehhez kell az előtte levő insertions is!

permutations :: [a] -> [[a]]
permutations [] = [[]]
permutations (x:xs) = concat [insertions x p| p<-permutations xs]



-- Őrfeltételek, esetszétválasztás (http://lambda.inf.elte.hu/Guards.xml)
--  Bool értékű kifejezés, fentről lefele értékelődnek ki (mint a mintaillesztésnél)
--  otherwise

-- Gyorshatványozás

-- A take kezeli azt is ha kevesebb mint 0 elemet akarunk elvenni
-- take :: Int -> [a] -> [a]

-- drop :: Int -> [a] -> [a]

-- Elem beszúrása rendezett listába (Data.List-ben definiált)
-- insert :: Ord a => a -> [a] -> [a]

-- Rendezett listák összefűzése
-- sortMerge :: Ord a => [a] -> [a] -> [a]

-- Lokális függvények: where (http://lambda.inf.elte.hu/Where.xml)
-- Prímek előállítása listagenerátorral, rekurzív segédfüggvénnyel (filterPrime)
-- Módszer: Eratoszthenész szitája (https://hu.wikipedia.org/wiki/Eratoszthen%C3%A9sz_szit%C3%A1ja)
-- primes :: [Integer]

-- Lista adott ponton elvágása (Prelude-beli függvény)
-- splitAt :: Int -> [a] -> ([a], [a])

-- Összefésüléses rendezés: Mergesort (http://lambda.inf.elte.hu/Where.xml#feladat-%C3%B6sszef%C3%A9s%C3%BCl%C3%A9ses-rendez%C3%A9s)