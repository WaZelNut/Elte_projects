module Gyak13 where

import Prelude
import Data.List (group, insert, sortBy, sort)
import Data.Char
-- import Data.Function (on)

-- ByFunctions
-- Néhány eddig nézett függvénynek létezik a By-os verziója is, amikor
-- megadhatjuk hogy milyen művelet alapján végezzék a feladatukat,
-- pl.: groupBy, maximumBy, minimumBy, sortBy

-- group: Elemek csoportosítása egyenlőség szerint.
-- De akarhatnánk más szerint is a csoportokat:

groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy f [] = []
groupBy f (x:xs) = (x : t) : groupBy f d
  where
    (t,d) = span (f x) xs


-- A csoport első eleme határozza meg hogy mik kerülhetnek vele egy csoportba.


-- Az on függvény a Data.Function modulban található
-- Egyfajta függvénykompozíció, de egy bináris és egy unáris függvényt komponálunk össze
on :: (b -> b -> c) -> (a -> b) -> (a -> a -> c)
on f g x y = f (g x) (g y)

numbersInString :: String -> [String]
numbersInString = filter (isDigit . head) . groupBy ((==) `on` isDigit)


compressPairs :: Eq a => [(a,b)] -> [(a,[b])]
compressPairs = map (\(x,y) -> (head x, y)) . map unzip . groupBy ((==) `on` fst)

divisors :: Integral a => a -> [a]
divisors n = [d | d<-[1..n], n `mod` d == 0]

maxDivisors :: [Int]
maxDivisors = map (fst . head) $ groupBy ((==) `on` snd) $ zip [1..] $ scanl1 max $ map (length . divisors) [1..]


-- Ordering adatszerkezet, három konstruktora van: LT, EQ, GT
-- data Ordering


-- ÍGY NÉZNE KI LEDEFINIÁLVA
-- compare :: Ord a => a -> a -> Ordering
-- compare x y
  -- | x < y = LT
  -- | x == y = EQ
  -- | x > y = GT


-- maximumBy, minimumBy, sortBy: a Data.List modulban találhatóak
-- if-then-else


maximumBy :: Foldable t => (a -> a -> Ordering) -> t a -> a
maximumBy f = foldr1 (\x acc -> if x `f` acc == GT then x else acc)
minimumBy :: Foldable t => (a -> a -> Ordering) -> t a -> a
minimumBy f = foldr1 (\x acc -> if x `f` acc == LT then x else acc)


longestWord :: String -> String
longestWord =maximumBy (compare `on` length) . words

mostFrequentChar :: String -> Char
mostFrequentChar = head . maximumBy (compare `on` length) . group . sort 

closestToOrigo :: Real a => [(a, a)] -> (a, a)
closestToOrigo = minimumBy (compare `on` (\(x,y) -> x^2 + y^2))

maxIndex :: Ord a => [a] -> Int
maxIndex = fst . maximumBy (compare `on` snd) . zip [1..]

maxIndices :: Ord a => [a] -> [Int]
maxIndices = map fst . sortBy (compare `on` snd) . zip [1..]

maxDivisorsUntil :: Integer -> Integer
maxDivisorsUntil n = maximumBy (compare `on` (length. divisors)) [1..n]

-- Rendezés csökkenő sorrendben
sortDesc :: Ord a => [a] -> [a]
sortDesc = sortBy (flip compare)


-- Eddig tartott a féléves anyag, lehetséges extra anyagok (ha van rá idő)
-- 1.) Rekurzív data
-- 2.) Foldable típusosztály
-- 3.) Típusosztályok példányosítása
-- 4.) Rekord szintaxis
-- 5.) main függvény, futtatható .exe fordítása


-- Rekurzív data
-- Egy algebrai adatszerkezet valamelyik konstruktora magát az adatszerkezetet várja paraméternek.

-- Természetes számok
data Nat  
    = Zero          -- nulla
    | Succ Nat      -- rákövetkező
        deriving (Show, Eq)

-- one :: Nat
-- two :: Nat

-- add :: Nat -> Nat -> Nat
-- mul :: Nat -> Nat -> Nat

-- Bináris számok
-- data Bin

-- Lista
data List a           -- [a]
   = Nil              -- []
   | Cons a (List a)  -- a : [a]
    deriving (Show, Eq)

-- headList :: List a -> a
-- tailList :: List a -> List a

-- Bináris fa
-- data Tree a

-- mirror :: Tree a -> Tree a

-- Sokfelé ágazó fa
-- data T a



-- Foldable típusosztály
-- Benne van pl.: lista, Maybe, rendezett pár
-- Azaz Maybe típusra is lehet fold-ot használni:

-- fromMaybe :: a -> Maybe a -> a
-- fromJust :: Maybe a -> a
-- maybeToList :: Maybe a -> [a]



-- Típusosztályok példányosítása
-- Megadjuk, hogy a List típusunk a Foldable típusosztályban legyen
-- Ehhez a foldr függvényt kell csak definiálni rá

-- instance Foldable List where
  -- foldr :: (a -> b -> b) -> b -> List a -> b
  -- foldr f s Nil = s
  -- foldr f s (Cons x xs) = f x (foldr f s xs)


-- A Nat típus legye a Num típusosztályban, ehhez kell:
-- (+), (*), abs, signum, fromInteger, ((-) | negate)
-- instance Num Nat where
--   (+) = add

--   (*) = mul

--   abs = id

--   signum (Succ _) = one
--   signum Zero = Zero

--   fromInteger 0 = Zero
--   fromInteger n | n > 0 = Succ (fromInteger (n-1))

--   n - Zero = n
--   (Succ n) - (Succ m) = n - m 



-- Rekord szintaxis:
-- Eddig ha a data-val definiáltunk adatszerkezetet csak mintaillesztéssel tudtuk kinyerni a konstruktorokból az értékeket.
-- Kérhetünk a fordítótól gettereket:

data Person = Person {
    name :: String,
    age :: Int
  }
  deriving Show

-- A getterek típusa:
-- name :: Person -> String
-- age :: Person -> Int 

-- Kétféle módon is létrehozható Person
p1 :: Person
p1 = Person "Adam" 19

p2 :: Person
p2 = Person {name = "Eve", age = 20}


-- main függvény, IO monád (külön fájlban, Main.hs)