module Gyak2 where

import Data.Char

-- Kétparaméteres függvények
returnFirst :: Char -> Int -> Char
returnFirst c n = c

add :: Int -> Int -> Int
add x y = x + y

-- Gyakorlás*
-- Téglalap területe
-- area :: Int -> Int -> Int

-- Nagyobb-e az első szám
greater :: Int -> Int -> Bool
greater x y  = x > y

-- Extra feladat*
-- Az első szám osztható-e a másodikkal?
isDivisibleBy :: Int -> Int -> Bool
isDivisibleBy a s = a `mod` s == 0

-- Írjunk ennek a segítségével (felhasználásával) "konkrétabb" függvényeket a 4-gyel, 100-zal és 400-zal
-- való oszthatóság vizsgálatára. (Add meg a típusukat is!)

-- isDiv4
-- isDiv100
-- isDiv400

-- Definiálj egy függvényt ami egy évszámról megmondja, hogy szökőév-e.
-- Egy év szökőév ha osztható 4-gyel ÉS (nem osztható 100-zal VAGY osztható 400-zal)
-- isLeapYear :: Int -> Bool


-- Polimorfizmus
-- Parametrikus polimorfizmus
idInt :: Int -> Int
idInt x = x
idBool :: Bool -> Bool
idBool x = x

-- Típusváltozók használata
id' :: a -> a
id' x = x

add' :: Num a => a -> a -> a
add' x y = y + x

-- Típusosztályok
-- Num, Integral, Fractional
-- Eq, Ord
osszead :: Num a => a -> a -> a
osszead x y = x + y

--eloszt :: Fractional a => a -> a -> a

--hatvany :: (Num a, Integral b) => a -> b -> a

-- Ad-hoc polimorfizmus
-- Különböző definíció különböző típusokra
-- Például: (+) a Num típusosztályban


-- Mintaillesztés, pattern matching
-- Összes eset felsorolása
not' :: Bool -> Bool
not' True = False
not' False = True

-- Változó használata
not'' :: Bool -> Bool
not'' True = False
not'' x = True

-- Joker, jele: _
not''' :: Bool -> Bool
not''' True = False
not''' _ = True

and' :: Bool -> Bool -> Bool
and' True True = True
and' _ _ = False
-- and' True False = False
-- and' False True = False
-- and' False False = False

lessThanTwo :: Int -> Bool
lessThanTwo 0 = True
lessThanTwo 1 = True
lessThanTwo _ = False

-- Gyakorlás *
-- or'


-- Rendezett n-esek, tuple
-- bármilyen típusú értéket tudnak tárolni
-- több értéket összecsoportosítanak
-- előre definiáltan fix a hosszuk
-- szintaktikus cukorka a konstruktorhoz: (,) a b == (a,b)
-- 62 komponensű lehet, de a hozzájuk köthető függvények 15-ig vannak definiálva
-- Példák...

isEvenTuple :: Int -> (Int, Bool)
isEvenTuple n = (n, even n)

triplicate :: a -> (a,a,a)
triplicate x = (x,x,x)

-- Típusváltozó vs változó
swap :: (a,b) -> (b,a)
swap (x,y) = (y, x)

doubleTheTuple :: (a,b) -> ((a,b),(a,b))
doubleTheTuple (x,y) = ((x,y),(x,y))

-- Mintaillesztés tuple-re
condInc :: (Int, Bool) -> Int
condInc (n, True) = n + 1
condInc (n, _) = n


-- Konverziós függvények (http://lambda.inf.elte.hu/Conversion.xml)
-- floor, truncate, ceiling, round, fromIntegral, realToFrac, fromEnum, toEnum

-- import Data.Char | Vagy modul elejére vagy a terminálba beírni.
-- ord, chr