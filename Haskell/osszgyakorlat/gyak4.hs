module Gyak4 where
import Prelude hiding (head, tail, length, sum, last, init, minimum, concat, (++), merge,zip)

-- Listagenerátorok (http://lambda.inf.elte.hu/Comprehensions.xml)
-- Matematikai jelölésnek megfelelően
-- Generátorok, feltételek
-- Több generátor használata

-- Néhány listákkal kapcsolatos hasznos függvény:
-- zip, take, drop, concat, words, unwords, elem
--zip: pl. [1,2,3] "abc" összepárosít elemeket
--take első x elemet visszaadja
--drop első x elemet eldobja a többit visszadja
--a take 1 lkistát ad vissza, a head meg értéket ad vissza
--concat a ++-t helyettesíti pl [[1,2],[3,4,5]]
--words [lista elemekre bontja a szöveget]
--unwords ellentetje a words-nek, a listaelemeket összerakja egy stringre, mint a concat csak az unwords ad space-t
-- elem: szerepel e a listában az adott feltétel pl. elem 1 [2,3,4] false lesz

-- Mintaillesztés listákra

isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False
--null megfelelője

isSmall :: [a] -> Bool
isSmall [] = True
isSmall [x] = True
isSmall [x,y] = True
isSmall [x,y,z] = True
isSmall _ = False

-- import Prelude hiding (head, tail)

-- Ez a legfontosabb minta!!! (x:xs)
head  :: [a] -> a
head (x:xs) = x
tail :: [a] -> [a]
tail (x:xs) = xs

-- (x:y:xs)

isSmall' :: [a] -> Bool
isSmall' (x:y:z:w:xs) = False
isSmall' _ = True

-- Mire illeszkednek az alábbi minták?
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


-- Rekurzió (http://lambda.inf.elte.hu/Recursion.xml)
fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n-1)

--0! = 1
-- n! = n *(n-1)!

-- fact 3 
-- 3 * (fact 2)
-- 3 * (2 * (fact 1))
-- 3 * (2 * (1 * (fact 0)))
-- 3 * (2 * (1 * (1)))
-- 3 * (2 * 1)
-- 3 * 2
-- 6

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- Hatékonyabban is lehet (extra anyag):
-- fib2 :: Integer -> Integer
-- fib2 n = fib' 0 1 n
--  where 
--     fib' a b 0 = a
--     fib' a b n = fib' (a+b) a (n-1)


-- * Gyakorlás: hatványozás (szorzást használva)
-- pow :: Int -> Int -> Int


-- Rekurzió listákon
length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + length xs
sum :: Num a => [a] -> a
sum [] = 0
sum (x:xs) = x + sum xs

-- * Gyakorlás
-- product :: Num a => [a] -> a

last :: [a]{-nemüres-} -> a
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
[]  ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)



-- Elemek váltogatva
merge :: [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = x : y : merge xs ys

-- * Gyakorlás:
zip :: [a] -> [b] -> [(a,b)]
-- zip [] ys = []
-- zip xs [] = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys
zip _ _ = []

-- Prímek előállítása listagenerátorral, rekurzív segédfüggvénnyel
-- Módszer: Eratoszthenész szitája (https://hu.wikipedia.org/wiki/Eratoszthen%C3%A9sz_szit%C3%A1ja)
-- primes :: [Integer]