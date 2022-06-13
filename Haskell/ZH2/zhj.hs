module Zh where

import Data.List
import Data.Function

sortTuple :: Ord a => (a, a) -> (a, a)
sortTuple (x,y)
    | x > y = (y,x)
    | otherwise = (x,y)

ratio :: Integral a => (a, a) -> Maybe a
ratio (x,y)
    | y == 0 = Nothing
    | x `mod` y == 0 = Just (abs (x `div` y))
    | otherwise = Nothing

nonEmpties :: Eq a => [[a]] -> Int
nonEmpties [] = 0
nonEmpties (x:xs)
    | seged x = 1 + nonEmpties xs
    | otherwise = nonEmpties xs
    where
        seged [] = False
        seged _ = True

superFact :: Integer -> Integer
superFact 0 = 1
superFact n = product [1..n] * superFact (n-1)

equalsOn :: Eq b => (a -> b) -> (a -> b) -> [a] -> Bool
equalsOn _ _ [] = True
equalsOn f1 f2 (x:xs)
    | f1 x == f2 x = equalsOn f1 f2 xs
    | otherwise = False


toPairs :: [a] -> [(a,a)]
toPairs [] = [] 
toPairs [_] = []
toPairs (x:y:xs) = (x,y) : toPairs (y:xs)


avgWordLength :: String -> Int
avgWordLength l = seged1 (words l)
    where
        seged1 l
            | (seged3 l) /= 0 = (seged2 l) `div` (seged3 l)
            | otherwise = 0
            where
                seged2 [] = 0
                seged2 (x:xs) = length x + seged2 xs


                seged3 [] = 0
                seged3 (x:xs) = 1 + seged3 xs

compress :: String -> String
compress l = concat . map (\x -> if x !! 0 == '1' then drop 1 x else x) . map reverse . map (\x -> (head x : show (length x))) . group $ l

allSatisfying :: (a -> Bool) -> [[a]] -> [a]
allSatisfying _ [] = []
allSatisfying f (x:xs)
    | seged f x = x ++ allSatisfying f xs
    | otherwise = allSatisfying f xs
    where
        seged _ [] = True
        seged f (x:xs)
            | f x = seged f xs
            | otherwise = False

matchStart :: Eq a => [a] {-mi-} -> [a] {-miben-} -> Maybe Int
matchStart mit miben = matchStart' mit miben 1

matchStart' :: Eq a => [a] {-mi-} -> [a] {-miben-} -> Int -> Maybe Int
matchStart' [] [] n = Just n
matchStart' mit [] n = Nothing
matchStart' mit l@(miben:xs) n
    | mit `isPrefixOf` l = Just n
    | otherwise = matchStart' mit xs (n+1)


longerThan :: Integral b => [a] -> b -> Bool
longerThan [] n
    | n >= 0 = False
    | otherwise = True
longerThan (x:xs) n
    | n < 0 = True
    | otherwise = longerThan xs (n-1)


data Command
    = Forward Int
    | Backward Int
    | TurnRight
    | TurnLeft
    deriving (Show, Eq)

opposite :: Command -> Command
opposite (Forward x) = Backward x
opposite (Backward x) = Forward x
opposite (TurnRight) = TurnLeft
opposite (TurnLeft) = TurnRight

guideBack :: [Command] -> [Command]
guideBack l = seged (reverse l)
    where
        seged [] = []
        seged (x:xs) = (opposite x) : seged xs

replaceAt :: Num a => [a] {-miben-} -> Int {-hol-} -> a {-mire-} -> [a]
replaceAt [] hol mire
    | hol /= 0 = 0 : replaceAt [] (hol-1) mire
    | otherwise = mire : []
replaceAt (x:xs) hol mire
    | hol < 0 = (x:xs)
    | hol == 0 = mire : xs
    | otherwise = x : replaceAt xs (hol-1) mire


--  Az Ord miatt nem működik, ha a 120 sor nem lenne, akkor jó eredményt adna minden tesztesetre
-- maxValFun :: Ord b => [a -> b] -> a -> Maybe Int
-- maxValFun l ert = maxValFun' (seged l ert) 1 1 1
--     where
--         seged [] _ = []
--         seged (x:xs) ert = (x ert) : seged xs ert



-- maxValFun' [] folyton maxInd max
--     | folyton == 1 = Nothing 
--     | otherwise = Just maxInd
-- maxValFun' (x:xs) folyton maxInd max
--     | max <= x = maxValFun' xs (folyton+1) folyton x
--     | otherwise = maxValFun' xs (folyton+1) maxInd max 







-- maxValFun :: Ord b => [a -> b] -> a -> Maybe Int
-- maxValFun l ertek = seged l ertek 1 (-1)
--     where
--         seged [] ertek sorszam tar
--             | tar == (-1) = Nothing
--             | otherwise = Just sorszam
--         seged (x:xs) ertek sorszam tar
--             | tar == (-1) = seged xs ertek (sorszam + 1) (x ertek)
--             | tar < (x ertek) = seged xs ertek (sorszam + 1) (x ertek) 
--             | otherwise = seged xs ertek (sorszam + 1) tar


-- asd :: Ord b => [a -> b] -> a -> b
-- asd (x:xs) ert = x ert


-- maxValFun l ert = maxValFun' (seged l ert)
--     where
--         seged [] _ = []
--         seged (x:xs) ert = (x ert) : seged xs ert

-- maxValFun' =fst . head . maximumBy (compare `on` snd) . zip [1..]

