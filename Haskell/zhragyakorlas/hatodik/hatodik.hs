module Gyak where
import Data.Char
import Data.List
import Data.Maybe

whichIsEmpty :: [a] -> [b] -> Maybe Int
whichIsEmpty [] [] = Just 1
whichIsEmpty [] (x:xs) = Just 1
whichIsEmpty (x:xs) [] = Just 2
whichIsEmpty (x:xs) (y:ys) = Nothing

match :: Eq a => (a,a) -> (a, a) -> Bool
match (a1, a2) (b1, b2) = a1 == b1 || a1 == b2 || a2 == b1 || a2 == b2

indicesOfEmpties :: Eq a => [[a]] -> [Int]
indicesOfEmpties l = seged l 1
    where
        seged [] _ = []
        seged (x:xs) n
            | x == [] = n : seged xs (n+1)
            | otherwise = seged xs (n+1)


applyOnWords :: (String -> String) -> String -> String
applyOnWords f = unwords . map f . words


restUntil :: (a -> [a] -> Bool) -> [a] -> [a]
restUntil f [] = []
restUntil f (x:xs)
    | (f x xs) == False = restUntil f xs
    | otherwise = (x:xs)


replaceAll :: Eq a => a {-mit-} -> [a] -> a {-mire-} -> [a]
replaceAll _ [] _ = []
replaceAll mit (x:xs) mire
    | x == mit = mire : replaceAll mit xs mire
    | otherwise = x : replaceAll mit xs mire

listWordsWithUpper :: String -> [String]
listWordsWithUpper l = seged1 (words l)
    where
        seged1 [] = []
        seged1 (x:xs)
            | seged2 x == True = x : seged1 xs
            | otherwise = seged1 xs
            where
                seged2 [] = False
                seged2 l@(x:xs)
                    | isUpper x = True
                    | otherwise = seged2 xs


applyWhile :: (a -> Bool) -> (a -> a) -> [a] -> [a]
applyWhile _ _ [] = []
applyWhile p f l@(x:xs)
    | p x == True = (f x) : applyWhile p f xs
    | otherwise = l

replaceWithDefIfNot :: (a -> Bool) -> [a] -> [a] -> [a]
replaceWithDefIfNot _ [] _ = []
replaceWithDefIfNot _ l [] = l
replaceWithDefIfNot f (x:xs) (y:ys)
    | f x = x : replaceWithDefIfNot f xs (y:ys)
    | otherwise = y : replaceWithDefIfNot f xs ys


applyAlternately :: (a -> b) -> (a -> b) -> [a] -> [b]
applyAlternately _ _ [] = []
applyAlternately f1 _ [x] = f1 x : []
applyAlternately f1 f2 (x:y:xs) = f1 x : f2 y : applyAlternately f1 f2 xs


zipMaybe :: [a] -> [b] -> [(Maybe a, Maybe b)]
zipMaybe [] [] = []
zipMaybe (x:xs) [] = (Just x, Nothing) : zipMaybe xs []
zipMaybe [] (y:ys) = (Nothing, Just y) : zipMaybe [] ys
zipMaybe (x:xs) (y:ys) = (Just x, Just y) : zipMaybe xs ys


data Temperature
    = Night Double
    | Daytime Double
    deriving (Show,Eq)

isDaytime :: Temperature -> Bool
isDaytime (Daytime _) = True
isDaytime (Night _) = False

daytimeAvg :: [Temperature] -> Double
daytimeAvg l = (daytimeAvg' l) / (seged l)
    where
        seged [] = 0
        seged ((Daytime _):xs) = 1 + seged xs
        seged ((Night _):xs) = seged xs



daytimeAvg' :: [Temperature] -> Double
daytimeAvg' [] = 0
daytimeAvg' ((Daytime ert):xs) = ert + daytimeAvg' xs
daytimeAvg' ((Night _):xs) = daytimeAvg' xs

asd :: Double -> Double -> Double
asd x y = x + y + 0

lackOfLetters :: String -> [Char] -> Maybe [Char]
lackOfLetters l k
    | Just (nub (seged l k)) == Just "" = Nothing
    | otherwise = Just (nub (seged l k))
    where
        seged [] _ = []
        seged (x:xs) k
            | (toLower x) `elem` k = seged xs k
            | otherwise = (toLower x) : seged xs k


-- fixedPointIn :: Eq a => (a -> a) -> a -> Int -> Maybe Int
-- fixedPointIn f l n = fixedPointIn' f l n 0


-- -- fixedPointIn' :: Eq a => (a -> a) -> a -> Int -> Maybe Int
-- fixedPointIn' _ [] _ _ = Nothing
-- fixedPointIn' f x n sz
--     | f x == x || n > 0 = Just sz
--     | otherwise = fixedPointIn' f xs (n-1) (sz+1)