module Zh where
import Data.List
import Data.Char

squareSum :: Num a => (a, a) -> (a, a, a)
squareSum (s1,s2) = (s1,s2,s1^2 + s2^2)

names :: [String] -> [String] -> [String]
names [] _ = []
names _ [] = []
names (x:xs) (y:ys) = [x ++ " " ++ y] ++ names xs ys

triangleArea :: (Double, Double, Double) -> Maybe Double
triangleArea (a,b,c)
    | a < 0 || b < 0 || c < 0 = Nothing   
    | c < (a+b) && a*a + b*b == c*c = Just ((a*b)/2)
    | otherwise = Nothing

doubleIdxs:: Eq a  => [(a,a)] -> Maybe [Int]
doubleIdxs xs
    | doubleIdxsHelp xs 1 == [] = Nothing
    | otherwise = Just (doubleIdxsHelp xs 1)

doubleIdxsHelp:: Eq a  => [(a,a)] -> Int -> [Int]
doubleIdxsHelp [] sz = []
doubleIdxsHelp ((a,b):xs) sz
    | a == b = sz : doubleIdxsHelp xs (sz+1)
    | otherwise = doubleIdxsHelp xs (sz+1)


snakeToCamel :: String -> String
snakeToCamel [] = []
snakeToCamel [x] = [x]
snakeToCamel (x:y:xs)
    | x == '_' = (toUpper y) : snakeToCamel xs
    | otherwise = x : snakeToCamel (y:xs)


removeExtremes :: Ord a => [a] -> [a]
removeExtremes xs = deleteBy (\x y -> x == y) (maximum xs) (removeHelp xs)

removeHelp :: Ord a => [a] -> [a]
removeHelp xs = deleteBy (\x y -> x == y) (minimum xs) xs

replaceLastOcc :: Eq a => a {-mit-} -> a {-mire-} -> [a] -> Maybe [a]
replaceLastOcc _ _ [] = Nothing
replaceLastOcc mit mire list@(x:xs)
    | mit `elem` list = Just $ reverse (seged mit mire (reverse list))
    | otherwise = Nothing
    -- where
    --     seged _ _ [] = []
    --     seged mit mire (x:xs)
    --         | x == mit = mire : xs
    --         | otherwise  = x : seged mit mire xs

seged :: Eq a => a -> a -> [a] -> [a]
seged _ _ [] = []
seged mit mire (x:xs)
    | x == mit = mire : xs
    | otherwise  = x : seged mit mire xs


anagram :: String -> String -> Bool
anagram xs ys = sort xs == sort ys

sumWithLenghtN :: Num a => Int -> [[a]] -> a
sumWithLenghtN n [] = 0
sumWithLenghtN n list@(x:xs)
    | seged n x = sum x + sumWithLenghtN n xs 
    | otherwise = sumWithLenghtN n xs
    where
        seged 0 [] = True --Megegyezik a hosszuk
        seged _ [] = False
        seged n (x:xs)
            | n <= 0 = False
            | otherwise = seged (n-1) xs

isSteady :: Eq b => (a -> b) -> [a] -> Bool
isSteady f [] = True
isSteady _ [x] = True
isSteady f (x:y:xs)
    | f x == f y = isSteady f (y:xs)
    | otherwise = False

data Parcell
    = P String Double Int
    deriving (Eq,Show)
-- cím, súly, utánvét

deliveryFee :: Parcell -> Maybe Double
deliveryFee (P cim suly _)
    | cim =="Asgard" = Just (suly * 100)
    | cim =="Midgard" = Just (suly * 10)
    | cim =="Vanaheim" = Just (suly * 80)
    | cim =="Alfheim" = Just (suly * 50)
    | otherwise = Nothing

deliveryFeeHelp :: Parcell -> Double
deliveryFeeHelp (P cim suly _)
    | cim =="Asgard" = (suly * 100)
    | cim =="Midgard" =  (suly * 10)
    | cim =="Vanaheim" =  (suly * 80)
    | cim =="Alfheim" =  (suly * 50)
    | otherwise = 0

delivery :: [Parcell] -> Double
delivery [] = 0
delivery ((P cim suly utanvet):xs)
    | deliveryFeeHelp (P cim suly utanvet) /= 0 = ((deliveryFeeHelp (P cim suly utanvet)) + fromIntegral utanvet) + (delivery xs)
    | otherwise = delivery xs


-- indAndReplace :: String {- miben -} -> String {- mit -} -> String {- mire -} -> String
-- indAndReplace (x:xs) mit mire


shrinkText :: String -> String
shrinkText [] = []
shrinkText (x:xs)
    | x == '(' && (dropWhile (/= ')' ) xs) /= ""  = shrinkText (drop 1 (dropWhile (/= ')' ) xs))
    | otherwise = x :  shrinkText xs
