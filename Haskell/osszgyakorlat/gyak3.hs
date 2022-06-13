module Gyak3 where

import Data.Char

doubleTheTuple :: (a,b) -> ((a,b), (a,b))
doubleTheTuple t = (t, t)

-- Mintaillesztés tuple-re
condInc :: (Int, Bool) -> Int
condInc (n, True) = n + 1
condInc (n, _) = n


-- Konverziós függvények (http://lambda.inf.elte.hu/Conversion.xml)
-- floor, truncate, ceiling, round, fromIntegral, realToFrac, fromEnum, toEnum

-- import Data.Char
-- ord, chr


-- Listák (http://lambda.inf.elte.hu/Lists.xml)
-- Egyszerű listák

smallPrimes :: [Int]
smallPrimes = [2, 3, 5, 7]

bools :: [Bool]
bools = [True, False]

empty :: [a]
empty = []

-- Egy elem hozzáadása a listához (:)
addElem :: a -> [a] -> [a]
addElem x l = x : l

-- Listák összefűzése (++)
addList :: [a] -> [a] -> [a]
addList l1 l2 = l1 ++ l2

-- Indexelés (!!)
nthElem :: [a] -> Int -> a
nthElem l n = l !! n

-- Lista hossza: length :: [a] -> Int
--Foldable t => t a az egyenlő a [a] listával

-- String típus
-- alma :: String
-- alma' :: [Char]

-- Pontpont kifejezések
oddsUntil100 :: [Int]
oddsUntil100 = [1,3..100]
alphabet :: String
alphabet = ['a'..'z']

-- Végtelen lista

-- sum, product

-- Hányféleképpen választhatunk ki n különböző elemből m elemet?
combinations :: Integer -> Integer -> Integer
combinations n m = product [1..n] `div` (product [1..m] * product [1..(n-m)])

-- Mintaillesztés listákra
-- []
-- [x]
-- (x:xs)
-- (xs:x)
-- (_:_)
-- [xs:x]
-- ([]:[])
-- (zs:b:z)      
-- ((x:y):xs)
-- ([x,_])
-- [(x,_)]
-- (x:y:[])
-- ((,) x y:_)
-- (xs:ys:zs)
-- ([xs:ys:_])
-- [_,_:xs]
-- [a,(x,y),_a]
-- (c:cs:[(x,xs)])
-- ([d]:[ds])

-- isEmpty :: [a] -> Bool

-- import Prelude hiding (head, tail)

-- head
-- tail

-- isSmallList :: [a] -> Bool

-- Listagenerátorok (http://lambda.inf.elte.hu/Comprehensions.xml)
-- Matematikai jelölésnek megfelelően
-- Generátorok, feltételek


-- powersOfTwo
-- evenPowersOfTwo

-- isPrime


-- Több generátor
-- hoursAndMinutes

