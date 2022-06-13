module Harmadik where
import Data.Char
import Data.List
import Data.Function

which :: ([Char], [Char], [Char]) -> Char -> Int
which (l1, l2, l3) k
    | k `elem` l1 = 1
    | k `elem` l2 = 2
    | k `elem` l3 = 3
    | otherwise = 0

matches :: (Int, Int) -> (Int, Int) -> Bool
matches (a1, a2) (b1, b2) = a1 == b1 || a1 == b2 || a2 == b1 || a2 == b2

toUpperCase :: String -> String
toUpperCase [] = []
toUpperCase l@(x:xs)
    | isLetter x = toUpper x : xs
    | otherwise = l

swap :: Maybe a -> b -> Maybe b
swap Nothing _ = Nothing
swap x y = Just y


numeric :: String -> Int
numeric [] = 0
numeric (x:xs)
    | x == 'r' = 4 + numeric xs
    | x == 'w' = 2 + numeric xs
    | x == 'x' = 1 + numeric xs

pythagoreans :: [(Int, Int, Int)]
pythagoreans = [(a,b,c) |  b <- [1..100],a <- [1..b], c <- [1..100], (a^2) + (b^2) == (c^2)]

hasLongWord :: Int -> String -> Bool
hasLongWord n l = hasLongWord' n (words l)


hasLongWord' _ [] = False
hasLongWord' n (x:xs)
    | (length x) >= n = True
    | otherwise = hasLongWord' n xs


align :: Int -> String -> String
align n l
    | n /= 0 && (length l) < n = " " ++ align (n-1) l
    | otherwise = l

-- modify :: Eq a => (a -> Maybe a) -> [a] -> [a]
-- modify f (x:xs)
--     | f x == Nothing = xs
--     | otherwise = f x : xs


isLonger :: [a] -> Int -> Bool
isLonger [] _ = False
isLonger (x:xs) n
    | n > 0 = isLonger xs (n-1)
    | otherwise = True


removeAccents :: String -> String
removeAccents "" = ""
removeAccents (x:xs)
    | x == 'é' = 'e' : ujra
    | x == 'ő' = 'o' : ujra
    | x == 'á' = 'a' : ujra
    | x == 'í' = 'i' : ujra
    | x == 'ö' = 'o' : ujra
    | x == 'ü' = 'u' : ujra
    | x == 'ű' = 'u' : ujra
    | otherwise = x : ujra
    where
        ujra = removeAccents xs

strip :: String -> String
strip l = reverse . dropWhile (\x -> x == '_') . reverse . dropWhile (\x -> x == '_') $ l


data RPS
    = Rock
    | Paper
    | Scissors

firstBeats :: [RPS] -> [RPS] -> Int
firstBeats [] [] = 0
firstBeats (x:xs) (y:ys)
    | seged x y = 1 + firstBeats xs ys
    | otherwise = firstBeats xs ys
    where
        seged Rock Scissors = True
        seged Paper Rock = True
        seged Scissors Paper = True
        seged _ _ = False 



data Temperature
    = Daytime Int
    | Night Int

isDaytime :: Temperature -> Bool
isDaytime (Daytime _) = True
isDaytime _ = False

-- extremes :: [Temperature] -> (Int, Int)
extremes l =seged (hom l)
    where
        seged l = (maximum l, minimum l)

hom [] = []
hom ((Daytime n):xs) = n : hom xs
hom ((Night n):xs) = n : hom xs


-- Pár 3 pontos
-- Lista feldarabolása (3 pont)
-- Definiálj függvényt, amely feldarabol egy pozitív egész számokat tartalmazó 
-- listát a lehető leghosszabb részekre úgy, hogy a részlistákban a számok összege 
-- ne haladja meg a megadott értéket! Ha az eredeti lista tartalmaz a megadott 
-- értéknél nagyobb számokat, azok ne szerepeljenek az eredmény listákban. 
-- Feltehetjük, hogy a felső korlátként megadott érték nem negatív!
-- chop2N :: Integral a => a -> [a] -> [[a]]
-- chop2N 13 [] == []
-- chop2N 1 [6,7,1,6,7] == [[1]]
-- chop2N 13 [1..10] == [[1,2,3,4],[5,6],[7],[8],[9],[10]]
-- chop2N 13 [6,7,1,6,7] == [[6,7],[1,6],[7]]
-- chop2N 12 [6,7,1,6,7] == [[6],[7,1],[6],[7]]
-- chop2N 13 [13,1,12,2,12,1] == [[13],[1,12],[2],[12,1]]
-- chop2N 13 [6,15,7,1,15,6,7] == [[6,7],[1,6],[7]]
-- (chop2N 11 $ take 14 $ repeat 1) == [[1,1,1,1,1,1,1,1,1,1,1],[1,1,1]]
-- (chop2N 13 $ take 14 $ repeat 1) == [[1,1,1,1,1,1,1,1,1,1,1,1,1],[1]]
-- (take 3 $ chop2N 7 $ repeat 2) == [[2,2,2],[2,2,2],[2,2,2]]

-- chop2N :: Integral a => a -> [a] -> [[a]]
-- chop2N n [] = []
-- chop2N n l = (seged n l []) : chop2N n (drop (length (seged n l [])) l)
--     where
--         seged _ [] sz = sz
--         seged n (x:xs) sz
--             | n >= (sum sz) = seged n xs (x : sz)
--             | otherwise = sz



-- Hárombetűs soroló (3 pont)
-- Készítsd el a threeChain függvényt, amely egy szavakat tartalmazó listájáról 
-- eldönti, hogy a szomszédos elemek egy karakterben különböznek-e! A függvény 
-- igazat ad vissza, ha az alábbiak teljesülnek:
-- A sorozatban csak hárombetűs szavak vannak.
-- A szomszédos elemek csak egy betűben különböznek.
-- Egy szó csak egyszer szerepel a listában.
-- threeChain [] == True
-- threeChain ["lel"] == True
-- threeChain ["fej","fejt"] == False
-- threeChain ["lel","jaj"] == False
-- threeChain ["lel","fel","kel"] == True
-- threeChain ["tol","tel","fel","fej","tej"] == True
-- threeChain == False
-- threeChain ["eee",['e','e'..],"eef"] == False
-- threeChain [[a,b,c] | a <- cycle "ab", b <- "cd", c <- "ef"] == False

-- threeChain l
--     | (filter (>1) . map length . group . sort $ l) == [] = True
--     | otherwise = False





threeChain :: [String] -> Bool
threeChain [] = True
threeChain [x] = True
threeChain (x:y:xs)
    | (seged x y 0) && not (x `elem` (y:xs)) = threeChain (y:xs)
    | otherwise = False
    where
        seged [] [] n
            | n < 2 = True
            | otherwise = False
        seged [] _ n = False
        seged _ [] n = False
        seged (x:xs) (y:ys) n
            | n >= 3 = False
            | x == y = seged xs ys n
            | otherwise = seged xs ys (n+1)
