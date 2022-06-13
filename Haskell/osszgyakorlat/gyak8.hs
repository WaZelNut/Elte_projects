module Gyak8 where
import Prelude hiding (map, filter, evens, takeWhile, dropWhile, span, iterate, ($))

-- Házi feladatok megoldásai:
-- Gyakori hibák:
-- 1.) Többször is bejárjuk a listát (nem hatékony),
--     pl.: listagenerátorral vagy segédfüggvényekkel.
-- 2.) fst, snd használata mintaillesztés helyett a where-ben.

evensOdds :: Integral a => [a] -> ([a], [a])
evensOdds [] = ([], [])
evensOdds (x:xs)
 | even x = (x:left, right)
 | otherwise = (left, x:right)
 where
  (left, right) = evensOdds xs

splitAtElem :: Eq a => a -> [a] -> ([a], [a])
splitAtElem e [] = ([], [])
splitAtElem e (x:xs)
 | e == x = ([x], xs)
 | otherwise = (x:left, right)
 where
  (left, right) = splitAtElem e xs

-- Itt nincs (Eq a) megkötés, ami azt jelenti hogy nem tudjuk az [a] típusú
-- listákat összehasonlítani, még akkor sem ha csak azt akarjuk megnézni, hogy üres-e.
-- Helyette mintaillesztés vagy a null függvény használható.
filterAndCountEmpty :: [[a]] -> ([[a]], Int)
filterAndCountEmpty [] = ([],0)
filterAndCountEmpty ([]:xs) = (res, n+1)
 where (res, n) = filterAndCountEmpty xs
filterAndCountEmpty (x:xs) = (x:res, n)
 where (res, n) = filterAndCountEmpty xs


-- Prímek előállítása listagenerátorral, rekurzív segédfüggvénnyel (filterPrime)
-- Módszer: Eratoszthenész szitája (https://hu.wikipedia.org/wiki/Eratoszthen%C3%A9sz_szit%C3%A1ja)


-- Végrekurzió (tail recursion), gyűjtögető rekurzió
-- A rekurzív ág kiértékelésében az utolsó művelet maga a rekurzív hívás.
-- Általában az egyik paraméterben gyűjtögetjük az eredményt.
-- Hatékonyabb mint a sima rekurzió, de általában segédfüggvényre van szükségünk.

-- Klasszikus faktoriális
fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n-1)

-- Gyűjtögetéssel (extra paraméter)
factAcc :: Integer -> Integer -> Integer
factAcc 0 result = result
factAcc n result = factAcc (n-1) (n*result)

-- Lokális segédfüggvénnyel
fact' :: Integer -> Integer
fact' n = factHelp n 1
  where
    factHelp :: Integer -> Integer -> Integer
    factHelp 0 result = result
    factHelp n result = factAcc (n-1) (n*result)

-- length' :: [a] -> Int

-- reverse' :: [a] -> [a]

-- minimum' :: Ord a => [a] -> a


-- Curryzés
-- Minden függvénynek csak egy paramétere van
-- Például:
-- Int -> Int -> Int ugyanaz mint Int -> (Int -> Int)

-- Operátor szeletek (http://lambda.inf.elte.hu/Higherorder.xml#szeletek)

inc :: Int -> Int
inc = (+1)

double :: Int -> Int
double = (2*)

distance :: Int -> Int -> Int
distance x y = abs (x - y)

-- A definíciónál sem feltétlen kell minden paramétert megadni, lehet curryzni
distanceFrom5 :: Int -> Int
distanceFrom5 = distance 5

-- Függvénykompozíció használata:
add3Mul2 :: Int -> Int
add3Mul2 = (*2) . (+3)

-- Magasabb rendű függvények (higher-order functions)
-- Olyan függvények, aminek vagy valamelyik paramétere, vagy az eredménye függvény.

apply :: (a -> b) -> (a -> b)
-- apply f x = f x
-- apply f = f
apply = id


-- A következők definiálhatók listagenerátorral és rekurzióval is.
map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
-- p predikátum, logikai változót jelölünk vele
filter p [] = []
filter p (x:xs)
  | p x = x : filter p xs
  | otherwise = filter p xs
  where

-- Magasabbrendű függvények használata:
evens :: [Int] -> [Int]
evens = filter even

count :: (a -> Bool) -> [a] -> Int
-- count p xs = length (filter p xs)

-- Függvénykompozícióval is megoldható (bonyolult)
count p = (length . filter p)


takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p [] = []
takeWhile p (x:xs)
  | p x = x : takeWhile p xs
  | otherwise = []
  
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p [] = []
dropWhile p (x:xs)
  | p x = dropWhile p xs
  | otherwise = (x:xs)

span :: (a -> Bool) -> [a]{-véges-} -> ([a],[a])
span p [] = ([], [])
span p (x:xs)
  | p x = (x:left, right)
  | otherwise = ([], (x:xs))
  where
    (left, right) = span p xs


iterate :: (a -> a) -> a -> [a] 
iterate f s = s : iterate f (f s)


-- Ez ugyanaz amit korábban apply-ként definiáltunk, dollár operátorkéne szerepel a Preludeban.
($) :: (a -> b) -> a -> b
f $ x = f x
-- ($) = id


-- all :: (a -> Bool) -> [a]{-véges-} -> Bool
-- any :: (a -> Bool) -> [a]{-véges-} -> Bool

-- Curryzhető függvény lesz, ha az any-t használjuk.
-- elem :: Eq a => a -> [a]{-véges-} -> Bool


-- Segédfüggvénynek használjuk a flip és notElem függvényeket.
-- filters :: Eq a => [a] -> [a] -> [a]

-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

-- zipWith alkalmazása
-- differences :: Num a => [a] -> [a]
