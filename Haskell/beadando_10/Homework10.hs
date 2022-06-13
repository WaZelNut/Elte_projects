module Homework10 where

safeMaximum :: Ord a => [a] -> Maybe a
safeMaximum [] = Nothing
safeMaximum xs = Just (maximum xs)


mapJust :: (a -> b) -> Maybe a -> Maybe b
mapJust h (Just xs) = Just (h xs) 
mapJust h _ = Nothing







data Bit = One | Zero deriving (Show, Eq, Ord)
type Binary = [Bit]

plus1 :: Binary -> Binary
plus1 [] = [One]
plus1 (One:xs) = Zero:(plus1 xs)
plus1 (Zero:xs) = One:xs

convert :: Binary -> [Int]
convert [] = []
convert (x:xs)
    | x == One = 1 : convert xs
    | otherwise = 0 : convert xs


bintodec :: Integral i => i -> i
bintodec 0 = 0
bintodec i = 2 * bintodec (div i 10) + (mod i 10)

add :: Binary -> Binary -> Binary
add  [] [] = []
add [Zero] [Zero] = [Zero]
add [] ys = ys
add xs [] = xs
add xs ys =  annyiszor1 decimalcounter xs
    where
        decimalcounter = (bintodec (joiner (convert (reverse ys))))

annyiszor1 :: Int -> Binary -> Binary
annyiszor1 1 [] = [One]
annyiszor1 1 (One:xs) = Zero:(plus1 xs)
annyiszor1 1 (Zero:xs) = One:xs
annyiszor1 db (x:xs)
    | x == One = let helper = Zero:(plus1 xs) in annyiszor1 (db-1) helper
    | x == Zero = let helper = One:xs in annyiszor1 (db-1) helper


joiner :: [Int] -> Int
joiner = read . concatMap show




data Direction
    = R
    | L
    | U
    | D
    deriving (Show, Eq, Ord)

data Move 
    = Step
    | Turn Direction
    deriving (Show,Eq,Ord)

performMoves :: [Move] -> (Int, Int) -> Direction -> (Int, Int)
performMoves [] (x,y) _ = (x,y)
performMoves (l:ls) (x,y) R
    | l == Turn R = performMoves ls (x,y) R
    | l == Turn L = performMoves ls (x,y) L
    | l == Turn U = performMoves ls (x,y) U
    | l == Turn D = performMoves ls (x,y) D
    | l == Step = performMoves ls (x+1,y) R

performMoves (l:ls) (x,y) L
    | l == Turn R = performMoves ls (x,y) R
    | l == Turn L = performMoves ls (x,y) L
    | l == Turn U = performMoves ls (x,y) U
    | l == Turn D = performMoves ls (x,y) D
    | l == Step = performMoves ls (x-1,y) L

performMoves (l:ls) (x,y) U
    | l == Turn R = performMoves ls (x,y) R
    | l == Turn L = performMoves ls (x,y) L
    | l == Turn U = performMoves ls (x,y) U
    | l == Turn D = performMoves ls (x,y) D
    | l == Step = performMoves ls (x,y+1) U

performMoves (l:ls) (x,y) D
    | l == Turn R = performMoves ls (x,y) R
    | l == Turn L = performMoves ls (x,y) L
    | l == Turn U = performMoves ls (x,y) U
    | l == Turn D = performMoves ls (x,y) D
    | l == Step = performMoves ls (x,y-1) D