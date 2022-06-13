module Gyakorlas where
import Data.List
import Data.Char
import Data.Maybe

concatTripleString :: ([Char], [Char], [Char]) -> [Char]
concatTripleString (x,y,z) = x ++ y ++ z ++ []

mods :: Integral a => a -> a -> Maybe (a, a)
mods _ 0 = Nothing
mods 0 _ = Nothing
mods x y = Just (x `mod` y, y `mod` x)

dropEmpties :: Eq a => [[a]] -> [[a]]
dropEmpties [] = []
dropEmpties (x:xs)
    | x == [] = dropEmpties xs
    | otherwise = x : dropEmpties xs

createChain :: Integer -> String
createChain n = seged n 1
    where
        seged n szam
            | n <= 0 = ""
            | otherwise = "(" ++ show szam ++ ")" ++ seged (n-1) (szam+1)


aLtErNaTiNgCaPs :: String -> String
aLtErNaTiNgCaPs (x:y:xs) = toLower x : toUpper y : aLtErNaTiNgCaPs xs
aLtErNaTiNgCaPs (x:xs) = toLower x : aLtErNaTiNgCaPs xs
aLtErNaTiNgCaPs [] = []

result :: [Maybe Bool] -> Int -> Bool
result [] jegy
    | jegy < 0 = True
    | otherwise = False
result (x:xs) jegy
    | x == Just True = result xs (jegy-1)
    | x == Just False = result xs (jegy+1)
    | otherwise = result xs jegy

maximumIF :: Ord a => (a -> Bool) -> [a] -> Maybe a
maximumIF f l = seged f (reverse l)
    where
        seged _ [] = Nothing
        seged f (x:xs)
            | f x == True = Just x
            | otherwise = seged f xs

fillBlanks :: String -> String -> String
fillBlanks [] [] = []
fillBlanks xs [] = xs
fillBlanks [] ys = []
fillBlanks (x:xs) (y:ys)
    | x == '_' = y : fillBlanks xs ys
    | otherwise = x : fillBlanks xs (y:ys)

riffleShuffle :: [a] -> [a]
riffleShuffle l = seged (eleje l) (kozepe l)
    where
        seged [] [] = []
        seged [] y = y
        seged x [] = x
        seged (x:xs) (y:ys) = x : y : seged xs ys

eleje :: [a] -> [a]
eleje [] = []
eleje xs = take ((length xs) `div` 2) xs

kozepe :: [a] -> [a]
kozepe [] = []
kozepe xs = drop ((length xs) `div` 2 ) xs


getPositions :: Eq a => a -> [a] -> Maybe [Int]
getPositions n xs
    | n `elem` xs = Just (seged n xs 1)
    | otherwise = Nothing
    where
        seged _ [] _ = []
        seged n (x:xs) szam
            | n == x = szam : seged n xs (szam+1)
            | otherwise = seged n xs (szam+1)


applies :: [a -> b] -> [a] -> [b]
applies [] _ = []
applies (f:xs) l = seged f l ++ applies xs l
    where
        seged f [] = []
        seged f (x:xs) = f x : seged f xs

data FiniteList
    = Empty
    | NonEmpty Int [Integer]
    deriving (Show, Eq)


toFinite :: Int -> [Integer] -> FiniteList
toFinite _ [] = Empty
toFinite n l
    | n <= 0 = Empty
    | otherwise = NonEmpty (seged1 l n) (seged2 l n)
    where
        seged1 l n = length (seged2 l n)

        seged2 [] _ = []
        seged2 (x:xs) n
            | n > 0 = x : seged2 xs (n-1)
            | otherwise = []

concatFL :: [FiniteList] -> FiniteList
concatFL [] = Empty
concatFL l
    | all (==Empty) l = Empty
    | otherwise = NonEmpty (seged1 l 0)  (seged2 l)
    where
        seged1 [] sz = sz
        seged1 (Empty:xs) sz = seged1 xs sz
        seged1 (NonEmpty k _ :xs) sz = seged1 xs (sz + k)

        seged2 [] = []
        seged2 (Empty:xs) = seged2 xs
        seged2 (NonEmpty _ l:xs) = l ++ seged2 xs


difference :: String -> String -> Maybe String
difference l1 l2
    | l1 == l2 = Nothing
    | seged l1 l2 == "" = Nothing
    | otherwise = Just (seged l1 l2)
    where
        seged [] xs = []
        seged xs [] = xs
        seged (x:xs) (y:ys)
            | x == y = seged xs ys
            | otherwise = x : seged xs ys


-- filterByMajority :: [(a -> Bool)] -> [a] -> [a]

