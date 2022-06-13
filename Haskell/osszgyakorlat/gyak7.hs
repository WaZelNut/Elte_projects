module Gyak7 where
import Data.List hiding (unzip,splitAt)
import Prelude hiding (unzip,splitAt)

-- Házikban:
-- l@(x:y:z:xs) mintaillesztés után nem kell indexelni,
-- l !! 0 helyett x, l !! 1 helyett z, l !! 2 helyett z

-- Állítsuk elő egy lista elemeinek az ismétlés nélküli kombinációit! (A lista elemeit tekintsük különbözőknek.)
combinations :: Int -> [a] -> [[a]]
combinations 0 xs = [[]]
combinations n [] = []
combinations n xs | n < 0 = []
combinations n (x:xs) = [x:c | c<-combinations (n-1) xs] ++ combinations n xs


-- Lokális függvények: where (http://lambda.inf.elte.hu/Where.xml)

-- Függvénykompozíció operátor
-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
-- matematikai megjelenítés: f o g   o -> kör lenne     (f o g)(x) = f(g(x))

-- A konstans minták hasznosak, ha egy n-est visszaadó függvény végeredményére akarunk mintát illeszteni. Példa:
unzip :: [(a, b)] -> ([a], [b])
unzip [] = ([],[])
unzip ((f,s):xs) = (f : fs, s : ss)
  where
      (fs,ss) = unzip xs


-- Lista adott ponton elvágása (Prelude-beli függvény)
splitAt :: Int -> [a] -> ([a], [a])
splitAt n xs | n < 0 = ([],xs)
splitAt 0 xs = ([],xs)
splitAt n [] = ([],[])
splitAt n (x:xs) = (x:left, right)
  where
    (left, right) = splitAt (n-1) xs

-- Összefésüléses rendezés: Mergesort (http://lambda.inf.elte.hu/Where.xml#feladat-%C3%B6sszef%C3%A9s%C3%BCl%C3%A9ses-rendez%C3%A9s)
-- Segédfüggvények hozzá: split, sortMerge

-- A sortMerge házi feladat, csak azért van itt egy megoldás hogy az msort műküdjön. Ez a megoldás nem hatékony, ne így csináljátok a háziban!
sortMerge :: Ord a => [a] -> [a] -> [a]
sortMerge xs ys = sort (xs ++ ys)

split :: [a] -> ([a], [a])
split [] = ([],[])
split [x] = ([x],[])
split (x:y:xs) = (x:left,y:right)
  where
      (left,right) = split xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = sortMerge (msort left) (msort right)
  where
      (left, right) = split xs

-- Prímek előállítása listagenerátorral, rekurzív segédfüggvénnyel (filterPrime)
-- Módszer: Eratoszthenész szitája (https://hu.wikipedia.org/wiki/Eratoszthen%C3%A9sz_szit%C3%A1ja)

primes :: [Integer]
primes = filterPrime [2..]
  where
    filterPrime (p:ps) = p : filterPrime [e | e <- ps, e `mod` p /= 0]


-- Végrekurzió (tail recursion), gyűjtögető rekurzió
-- A rekurzív ág kiértékelésében az utolsó művelet maga a rekurzív hívás.
-- Általában az egyik paraméterben gyűjtögetjük az eredményt.
-- Hatékonyabb mint a sima rekurzió, de általában segédfüggvényre van szükségünk.

-- Klasszikus faktoriális
fac :: Integer -> Integer
fac 0 = 1
fac n = n * fac (n-1)

-- Gyűjtögetéssel (extra paraméter)
facAcc :: Integer -> Integer -> Integer
facAcc 0 result = result
facAcc n result = facAcc (n-1) (n*result)

-- Lokális segédfüggvénnyel
fac' :: Integer -> Integer
fac' n = factHelp n 1
  where
    factHelp :: Integer -> Integer -> Integer
    factHelp 0 result = result
    factHelp n result = facAcc (n-1) (n*result)

-- length' :: [a] -> Int

-- reverse' :: [a] -> [a]

-- minimum' :: Ord a => [a] -> a



-- Curryzés
-- Minden függvénynek csak egy paramétere van

-- Operátor szeletek (http://lambda.inf.elte.hu/Higherorder.xml#szeletek)

inc :: Int -> Int
inc = (+1)


double :: Int -> Int
double = (2*)

distance :: Int -> (Int -> Int)
distance x y = abs (x - y)

distanceFrom5 :: Int -> Int
distanceFrom5 = distance 5

add3Mul2 :: Int -> Int
add3Mul2 = (*2) . (+3)