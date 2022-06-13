module Gyak6 where
import Data.Char hiding (drop,take)
import Prelude hiding ((^), drop, take)

-- Állítsuk elő egy lista összes lehetséges végződését! (A Data.List modulban már definiált.)
-- tails :: [a] -> [[a]] 

-- * Gyakorlás
-- Állítsuk elő egy lista összes prefixét! (A Data.List modulban már definiált.)
-- inits :: [a] -> [[a]] 

-- Egy elem törlése az összes lehetséges módon.
-- deletions :: [a] -> [[a]]

-- Permutációk (http://lambda.inf.elte.hu/Recursion.xml#feladat-permut%C3%A1ci%C3%B3k)
-- Ehhez kell az előtte levő insertions is!


-- Őrfeltételek, esetszétválasztás (http://lambda.inf.elte.hu/Guards.xml)
--  Bool értékű kifejezés, fentről lefele értékelődnek ki (mint a mintaillesztésnél)
--  otherwise

-- toUpper, toLower használata a Data.Char modulból
upperLower :: Char -> Char
upperLower c
    | isLower c = toUpper c
    | isUpper c = toLower c
    | otherwise = c

-- Gyorshatványozás
sqr :: Num a => a -> a
sqr x = x*x


(^) :: Num a => a -> Integer -> a
x ^ 0 = 1
x ^ n
    | n == 0 = 1
    | odd n = x*x^(n-1)
    | otherwise = sqr (x^ (n `div` 2))

-- Binárissá alakítás
-- toBin :: Integer -> [Int]

-- A take kezeli azt is ha kevesebb mint 0 elemet akarunk elvenni
take :: Int -> [a] -> [a]
take n xs | n <= 0 = []
take n [] = []
take n (x:xs) x : take (n-1) xs

drop :: Int -> [a] -> [a]
drop n xs | n <= 0 = xs
drop n [] = []
drop n (x:xs) = drop (n-1) xs

-- Elem beszúrása rendezett listába (Data.List-ben definiált)
insert :: Ord a => a -> [a] -> [a]
insert e [] = [e]
insert e (x:xs)
    | e <= x = e: x : xs
    | otherwise = x : insert e xs

-- Rendezett listák összefűzése
-- sortMerge :: Ord a => [a] -> [a] -> [a]

-- Állítsuk elő egy lista elemeinek az ismétlés nélküli kombinációit! (A lista elemeit tekintsük különbözőknek.)
combinations :: Int -> [a] -> [[a]]
combinations 0 xs = [[]]
combinations n [] = []
combinations n xs | n < 0 = []
combinations n (x:xs) = [x:c | c<-combinations (n-1) xs] ++ combinations n xs


-- Lokális függvények: where (http://lambda.inf.elte.hu/Where.xml)
-- Prímek előállítása listagenerátorral, rekurzív segédfüggvénnyel (filterPrime)
-- Módszer: Eratoszthenész szitája (https://hu.wikipedia.org/wiki/Eratoszthen%C3%A9sz_szit%C3%A1ja)
-- primes :: [Integer]

-- A konstans minták hasznosak, ha egy n-est visszaadó függvény végeredményére akarunk mintát illeszteni. Példa:
-- unzip :: [(a, b)] -> ([a], [b])

-- Lista adott ponton elvágása (Prelude-beli függvény)
-- splitAt :: Int -> [a] -> ([a], [a])

-- Összefésüléses rendezés: Mergesort (http://lambda.inf.elte.hu/Where.xml#feladat-%C3%B6sszef%C3%A9s%C3%BCl%C3%A9ses-rendez%C3%A9s)
-- msort :: Ord a => [a] -> [a]