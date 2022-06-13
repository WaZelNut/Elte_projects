module Masodik where
import Data.Maybe
import Data.List

contains :: Integral a => a -> (a,a,a) -> Bool
contains f (a,b,c) = f == a || f == b || f == c

triangleArea :: (Double, Double, Double) -> Maybe Double
triangleArea (a,b,c)
    | c < (a+b) && a*a + b*b == c*c = Just ((a*b)/2)
    | otherwise = Nothing


relativePrimes :: Integral a => a -> [a]
relativePrimes sz = [primek | primek <- [1..sz-1], gcd sz primek == 1]

isComplementary :: String -> String -> Bool
isComplementary [] (x:xs) = False
isComplementary (x:xs) [] = False
isComplementary [] [] = True
isComplementary (x:xs) (y:ys)
    | x == 'A' && y == 'T' || y == 'A' && x == 'T' = isComplementary xs ys
    | x == 'C' && y == 'G' || y == 'C' && x == 'G' = isComplementary xs ys
    | otherwise = False


-- atLeastNtimes :: Eq a => Int -> a -> [a] -> Bool
-- atLeastNtimes hanyszor ertek lista = atLeastNtimesHelp hanyszor ertek lista 0

-- atLeastNtimesHelp :: Eq a => Int -> a -> [a] -> Int -> Bool
-- atLeastNtimesHelp hanyszor _ [] tarolo
--     | tarolo > hanyszor = True
--     | otherwise = False
-- atLeastNtimesHelp hanyszor ertek (lista:xs) tarolo
--     | ertek `elem` lista = atLeastNtimesHelp hanyszor ertek xs tarolo+1
--     | otherwise = atLeastNtimesHelp hanyszor ertek xs tarolo

atLeastNtimes :: Eq a => Int -> a -> [a] -> Bool
atLeastNtimes 0 _ _ = True
atLeastNtimes hanyszor ertek _
    | hanyszor < 0 = True
atLeastNtimes _ _ [] = False 
atLeastNtimes hanyszor ertek (lista:xs)
    | ertek == lista = atLeastNtimes (hanyszor-1) ertek xs
    | otherwise = atLeastNtimes hanyszor ertek xs


valuableCustomer :: Int -> [(String, Int)] -> [String]
valuableCustomer _ [] = []
valuableCustomer minimum ((n,e):xs)
    | e >= minimum = n : valuableCustomer minimum xs
    | otherwise = valuableCustomer minimum xs

partialReverse :: Int -> [String] -> [String]
partialReverse hossz = reverseEverySecond . (filter (\x -> length x == hossz))

reverseEverySecond :: [String] -> [String]
reverseEverySecond l = map (\(i,x) -> if odd i then reverse x else x) $ zip [0..] l

match :: String -> String -> Maybe Char
match [] _ = Nothing
match (x:xs) [] = Just x
match (x:xs) (y:ys)
    | x == y = match xs ys
    | otherwise = Just x

applyWithDefault :: (a -> Bool) -> (a -> b) -> b -> [a] -> [b]
applyWithDefault _ _ _ [] = []
applyWithDefault p f e (x:xs)
    | p x == True = f x : applyWithDefault p f e xs
    | otherwise = e : applyWithDefault p f e xs

-- longestAscendingPrefix :: Eq b => (a -> b) -> [a] -> [a]
-- longestAscendingPrefix f xs = scanl1 (\x y -> if x >  y then x else y) xs


data Food
    = Hay
    | Banana
    | Larva
    deriving (Eq, Show)

data Animal
    = Monkey Food Int
    |  Flamingo Food Int
    |  Goat Food Int
    deriving (Eq, Show)


-- canFeedAll :: [Animal] -> [(Food, Int)] -> Bool
-- canFeedAll

-- canFeedAll :: [Animal] -> [(Food, Int)] -> Bool
-- canFeedAll [] [] = True
-- canFeedAll xs [] = False
-- canFeedAll [] [(_, kell1),(_, kell2),(_, kell3)]
--     | kell1 <=0 && kell2 <= 0 && kell3 <= 0 = True
--     |otherwise = False
-- canFeedAll ((Monkey kaja mennyi):xs) [(Banana, kell1),(Hay, kell2),(Larva, kell3)]
--     | kaja == Banana = canFeedAll xs [(Banana, kell1-mennyi),(Hay, kell2),(Larva, kell3)]
-- canFeedAll ((Goat kaja mennyi):xs) [(Banana, kell1),(Hay, kell2),(Larva, kell3)]
--     | kaja == Hay = canFeedAll (xs) [(Banana, kell1),(Hay, kell2-mennyi),(Larva, kell3)]
-- canFeedAll ((Flamingo kaja mennyi):xs) [(Banana, kell1),(Hay, kell2),(Larva, kell3)]
--     | kaja == Larva = canFeedAll (xs) [(Banana, kell1),(Hay, kell2),(Larva, kell3-mennyi)]



-- canFeedAll :: [Animal] -> [(Food, Int)] -> Bool
-- canFeedAll [] [] = True
-- canFeedAll ((Monkey k sz):xs) ((k2,m):ys)
--     | k == k2 = canFeedAll xs ((Banana,m-sz):ys)
--     | otherwise = canFeedAll ((Flamingo k sz):xs) ((k2,m):ys)
-- canFeedAll ((Flamingo k sz):xs) ((k2,m):ys)
--     | k == k2 = canFeedAll xs ((k2,m-sz):ys)
--     | otherwise = canFeedAll ((Goat k sz):xs) ((k2,m):ys)
-- canFeedAll ((Goat k sz):xs) ((k2,m):ys)
--     | k == k2 = canFeedAll xs ((k2,m-sz):ys)
--     | otherwise = canFeedAll ((Monkey k sz):xs) ((k2,m):ys)

chop2N :: Integral a => a -> [a] -> [[a]]
chop2N _ [] = []
chop2N n xs = chop2NSeged n xs 0 []

-- chop2NSeged :: Integral a => a -> [a] -> a -> [a] -> [[a]]
-- chop2NSeged _ [] _ _ = []
-- chop2NSeged n (x:xs) tarolo lista
--     | n <= tarolo = chop2NSeged n xs (tarolo+n) (lista ++ [x])
--     | n >= tarolo && tarolo /= 0 = lista : chop2NSeged n (x:xs) 0 []
--     | otherwise = chop2NSeged n xs 0 []

-- fragileUpdate :: Int -> (a -> Maybe a) -> [a] -> Maybe [a]

-- threeChain :: [String] -> Bool
-- threeChain [] = True
-- threeChain xs
    -- | filter (==3) (map length xs) /= [] =False

-- threeChain (x:xs)
    -- | foldr ()

