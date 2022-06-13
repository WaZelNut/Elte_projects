module Gyakorlas where
import Prelude hiding (dropWhile)
import Data.Char
import Data.List hiding (dropWhile)
import Text.Read

which :: ([Char], [Char], [Char]) -> Char -> Int
which (a,b,c) ef
    | ef `elem` a = 1
    | ef `elem` b = 2
    | ef `elem` c = 3
    | otherwise = 0

f5 :: Integral a => a -> a
f5 osztando = (osztando `mod` 5)

matchingArgs :: Eq a => a -> a -> a -> Bool
matchingArgs a b c
    | a == b = True
    | b == c = True
    | c == a = True
    | otherwise = False

division :: Integral a => (a,a,a) -> Maybe a
division (x,c,v)
    | v == 0 = Nothing
    | c `mod` v == 0 = Nothing  
    | otherwise = Just (x `div` (c `mod` v))

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile f [] = []
dropWhile f (x:xs)
    | f x = dropWhile f xs
    |otherwise = x:xs

-- elemOnEvenIdx :: Eq a => a -> [a] -> Bool
-- elemOnEvenIdx f [] = False
-- elemOnEvenIdx f xs
    -- | f `elem` xs && (xs !! f) `mod` 2 == 0 = True
    -- | otherwise = False


elemOnEvenIdx :: Eq a => a -> [a] -> Bool
elemOnEvenIdx n xs
    | n `elem` evens xs = True
    | otherwise = False

evens :: Eq a => [a] -> [a]
evens [] = []
evens [n] = []
evens (x:y:xs) = y : evens xs

dropEveryNth :: Int -> [a] -> [a]
dropEveryNth s [] = []
dropEveryNth s xs = take (s-1) xs ++ dropEveryNth s (drop s xs)

-- simDiff :: Eq a => [a] -> [a] -> [a]
-- simDiff (x:xs) ys
    -- | not (x `elem` ys) = x : simDiff xs ys

merge :: [a] -> [a] -> [a]
merge xs     []     = xs
merge []     ys     = ys
merge (x:xs) (y:ys) = x : y : merge xs ys

-- simDiff :: Eq a => [a] -> [a] -> [a]
-- simDiff xs ys = concat . filter (\x -> length x == 1) . group . sort . merge xs $ ys

-- simDiff :: Eq a => [a] -> [a] -> [a]
-- simDiff xs ys = help xs ys 0

-- help :: Eq a => [a] -> [a] -> Int -> [a]
-- help [] [] _ = []
-- help [] ys sz = (drop sz ys) ++ help [] [] 0
-- help (x:xs) ys sz
--     | not (x `elem` ys) = x : help xs ys (sz+1)
--     | otherwise = help xs ys (sz)


-- simDiff :: Eq a => [a] -> [a] -> [a]
-- simDiff (x:xs) ys
--     | not (x `elem ys`) = x : help xs ys
--     | otherwise = simDiff xs ()

-- simDiff :: Eq a => [a] -> [a] -> [a]
-- simDiff [] [] = []
-- simDiff [] ys = ys ++ simDiff [] []
-- simDiff (x:xs) (y:ys)
    -- | not (x `elem` (y:ys)) = x : simDiff xs (y:ys)
    -- | otherwise = simDiff xs ys


-- parseNum :: String -> Maybe Integer
-- parseNum xs 
    -- | head xs == '+' = Just xs :: Maybe Integer
    -- | otherwise = readMaybe xs

-- parseNum xs
    -- | dropWhile isDigit xs =="" = readMaybe xs :: Maybe Integer
    -- | otherwise = Nothing


-- parseNum :: String -> Maybe Integer
-- parseNum xs = Just read xs :: Maybe Integer



elevate :: Eq a => a -> [a] -> [a]
elevate k xs = elevateHelp k xs []

elevateHelp :: Eq a => a -> [a] -> [a] -> [a]
elevateHelp _ [] _ = []
elevateHelp k (x:xs) tarolo
    | not (k `elem` (x:xs)) = (x:xs)
    | k == x = x : reverse tarolo ++ xs
    | otherwise = elevateHelp k xs (x : tarolo)


-- localMax :: Ord b => [(a -> b)]{- nem üres -} -> a -> b
-- localMax xs sz = localMaxHelp xs [] sz
-- -- localMax [(+3),(^2), (*4), (^3)] 2 == 5

-- localMaxHelp :: Ord b => [(a -> b)]{- nem üres -} -> a -> [b] -> b
-- localMaxHelp (x:y:xs) t sz
--     | x sz > y sz = localMaxHelp (y:xs) (x sz) sz
--     | otherwise = localMaxHelp (y:xs) t sz

-- localMaxHelp (x:xs) t sz
--     | x sz > t = x sz
--     | otherwise = t


pairMap :: (a -> b) -> [(a,a)] -> [(b,b)]
-- pairMap (+1) [(1,2),(3,4)]
pairMap f [] = []
pairMap f ((x,y):xs) = (f x, f y) : pairMap f xs


applyIfReduces :: Ord a => (a -> a) -> [a] -> [a]
applyIfReduces f = map (\x -> if (f x < x) then f x else x)

data Plant
    = Flower String Int
    | Tree String Int
    deriving (Eq, Show)




survive :: [Plant] -> Int -> [String]
survive [] _ = []
survive ((Flower x y):xs) k
    | y <= k = x : survive xs k
    | otherwise = survive xs k
survive ((Tree _ _):xs) k = survive xs k

avgTreeWater :: [Plant] -> Maybe Double
avgTreeWater xs = seged xs 0

seged :: [Plant] -> Double -> Maybe Double
seged [] sz 
    | sz == 0.0 = Nothing
    | otherwise = Just sz
seged ((Tree nev menny):xs) sz = seged xs (sz + fromIntegral menny)
seged ((Flower _ _):xs) sz = seged xs sz


reverseWordsInside :: String -> String
reverseWordsInside xs
    | (length $ words xs) == 1 || (length $ words xs) == 2 = xs
    | otherwise = (head $ words xs) ++ " " ++ (reverse $ unwords $ tail $ init $ words xs) ++ " " ++ (last $ words xs)