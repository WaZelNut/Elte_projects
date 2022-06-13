module Gyakorlas where
import Data.List
import Data.Char
import Data.Function

addi :: Int -> Int
addi x = x + 1

-- Készíts egy függvényt, mely egy lista sorozatról eldönti, hogy a benne található listák elemszáma szigorú monoton növekszik-e! 
-- A függvény adjon vissza Nothing értéket, ha a tulajdonság igaz. Illetve adja meg azon listák sorszámát, rendezett pár formájában,
-- Just konstruktorba csomagolva, ahol ez a tulajdonság először sérül.

-- Az indexelést 0-tól kezdjük.

-- Megjegyzés: A sorozatban előfordulhatnak végtelen listák is, azonban az feltételezhető, hogy két szomszédos lista nem lesz végtelen!

inconsistencyInGrowing' :: [[a]] -> Int -> Maybe (Int, Int)
inconsistencyInGrowing' [] _ = Nothing
inconsistencyInGrowing' [_] _ = Nothing
inconsistencyInGrowing' (x:y:xs) i
    | seged x y = inconsistencyInGrowing' (y:xs) (i+1)
    | otherwise = Just (i,(i+1))
    where
        seged _ [] = False
        seged [] _ = True
        seged (x:xs) (y:ys) = seged xs ys

inconsistencyInGrowing :: [[a]] -> Maybe (Int, Int)
inconsistencyInGrowing l = inconsistencyInGrowing' l 0


findAndReplace :: String {- miben -} -> String {- mit -} -> String {- mire -} -> String
findAndReplace [] mit mire = []
findAndReplace miben mit mire
    | mit `isPrefixOf` miben = mire ++ findAndReplace (drop (length mit) miben) mit mire
    | otherwise = (head miben) : findAndReplace (tail miben) mit mire



-- highlight :: String -> String -> String
highlight' [] x n = x
highlight' _ [] n = []
highlight' l1 l2@(x:xs) n
    | l1 `isPrefixOf` l2 = toUpper x : highlight' l1 xs ((length (l1) - 1)) 
    | n /= 0 = toUpper x : highlight' l1 xs (n-1)
    | otherwise = x : highlight' l1 xs n

highlight :: String -> String -> String
highlight l1 l2 = highlight' l1 l2 0


data Weather
    = Sunny
    | Cloudy
    | Rainy
    deriving (Show, Eq)

data Forecast
    = Prediction Weather Int
    deriving (Show, Eq)

-- summerVacation :: [Forecast] -> [Weather]
summerVacation l = maximumBy (compare `on` length) . reverse . filter (\x -> (head x) /= Rainy)
 . groupBy ((==) `on` (==Rainy)) $ map (\(Prediction i _) -> i ) l
    -- where
        -- seged [] = []
        -- seged ((Prediction i _):xs) = i : seged xs

-- isRainy Rainy = True
-- isRainy _ = False
