module Negyedik where
import Data.List
import Data.Char
import Data.Function

byDunaOrTisza :: String -> Bool
byDunaOrTisza xs = take 4 xs == "Duna" || take 5 xs == "Tisza"

howManyDoubles :: Eq a => [[a]] -> Int
howManyDoubles xs = seged xs 0
    where
        seged [] n = n
        seged (x:xs) n
            | x !! 0 == x !! 1 = seged xs (n+1)
            | otherwise = seged xs n


blackJackPoints :: Integral a => [a] -> Maybe a
blackJackPoints xs
    | sum xs <= 21 && seged xs = Just (sum xs)
    | otherwise = Nothing
    where
        seged [] = True
        seged (x:xs)
            | x > 11 = False
            | otherwise = seged xs

notDivisibleByThree:: Integral a => [a] -> Maybe Int
notDivisibleByThree xs = seged xs 1
    where
        seged [] n = Nothing
        seged (x:xs) n
            | x `mod` 3 == 0 = seged xs (n+1)
            | otherwise = Just n

crowd :: Int -> String
crowd n = seged n 0
    where
        seged n lepteto
            | n `mod` 2 == 1 = paratlan n lepteto
            | otherwise = paros n lepteto
            where
                paratlan n lepteto
                    | lepteto == n = []
                    | lepteto < n `div` 2 = "(-_" ++ seged n (lepteto + 1)
                    | lepteto == n `div` 2 = "(-_-)" ++ seged n (lepteto + 1)
                    | lepteto > n `div` 2 = "_-)" ++ seged n (lepteto + 1)

                paros n lepteto
                    | lepteto == n = []
                    | lepteto == n `div` 2 || lepteto == (n `div` 2) - 1 = "(-_-)" ++ seged n (lepteto + 1)
                    | lepteto < n `div` 2 = "(-_" ++ seged n (lepteto + 1)
                    | lepteto > n `div` 2 = "_-)" ++ seged n (lepteto + 1)

atLeastNFrom :: Eq a => Int -> a -> [a] -> Bool
atLeastNFrom hanyszor _ []
    | hanyszor <= 0 = True
    | otherwise = False
atLeastNFrom hanyszor mi (x:xs)
    | mi == x = atLeastNFrom (hanyszor-1) mi xs
    | otherwise = atLeastNFrom hanyszor mi xs

mapEither :: (a -> Bool) -> (a -> b) -> (a -> b) -> [a] -> [b]
mapEither _ _ _ [] = []
mapEither f a1 a2 (x:xs)
    | f x = (a1 x) : mapEither f a1 a2 xs
    | otherwise = (a2 x) : mapEither f a1 a2 xs

-- numberOfFails :: Integral a => [[a]] -> Int
-- numberOfFails list = seged list 0
--     where
--         seged [] n = n
--         seged (x:xs) n
--             | x == [] = seged xs n
--             | (sum x) `div` (length x) == 1 = seged xs (n+1)
--             | otherwise = seged xs n

mergedOf :: Eq a => [a] -> [a] -> [a] -> Bool
mergedOf xs ys list = seged xs ys list []
    where
        seged [] [] list id
            | list == reverse id = True
            | otherwise = False
        seged xs [] list id = seged [] [] list (id ++ reverse xs) 
        seged [] ys list id = seged [] [] list (id ++ reverse ys)
        seged (x:xs) (y:ys) list id = seged xs ys list (y : x : id)


-- segítség mit ír ki
-- mergedOf :: Eq a => [a] -> [a] -> [a]
-- mergedOf xs ys = seged xs ys []
--     where
--         seged [] []  id = reverse id
--         seged xs []  id = seged [] []  (id ++ reverse xs) 
--         seged [] ys  id = seged [] []  (id ++ reverse ys)
--         seged (x:xs) (y:ys)  id = seged xs ys  (y : x : id)


encode :: String -> String
encode = concat . map (\x -> if x !! 1 == '1' then take 1 x else x) . map (\x -> (head x : show (length x))) . group

data  Weather
    = Sunny
    | Cloudy
    | Rainy
    deriving (Show, Eq)

data Forecast
    = Prediction Weather Int
    deriving (Show, Eq)


-- summerVacation :: [Forecast] -> [Weather]

nthSmallest :: (Integral a, Eq b) => a -> [b] -> Maybe b
nthSmallest s l = seged (s-1) (map (\x -> head x) $ group l)
    where
        seged sz [] = Nothing
        seged sz (x:xs)
            | sz < 0 = Nothing
            | sz /=0 = seged (sz-1) xs
            | otherwise = Just x

-- highlight :: String -> String -> String
-- highlight _ [] = []
-- highlight szo l@(x:xs)
--     | take (length szo) l == szo = map toUpper (take (length szo) l) ++ highlight szo xs
--     | otherwise = x : highlight szo xs

roughNumber :: Int -> Int -> Bool
roughNumber durva szam =