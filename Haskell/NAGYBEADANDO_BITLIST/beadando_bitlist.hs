module NAGYBEADANDO_BITLIST where
import Data.List

type BitList = [Int]

-----------------------------------------------------Első feladat-----------------------------------------------------
countEliminable :: BitList -> Int
countEliminable = length . filter (>1) . map length . group

-----------------------------------------------------Második feladat-----------------------------------------------------

eliminateNth :: BitList -> Int -> BitList
eliminateNth [] _ = []
eliminateNth [x] _ = [x]
eliminateNth xs n
    | n < 1 && eliminalhato xs = concat $ deleteN (elsoeliminalhato xs-1) $ group xs
    | 1 <= n && n <= countEliminable xs && eliminalhato xs = concat $ deleteN ((nedikEliminalhato xs n)-1) (group xs)
    | n >= countEliminable xs && eliminalhato xs = concat $ deleteN ((nedikEliminalhato xs (countEliminable xs))-1) (group xs)
    | otherwise = xs

-----------------------------------------------------Harmadik feladat-----------------------------------------------------
elimination :: BitList -> Bool
elimination xs
    | elimination1 xs == False = elimination2 xs
    | elimination2 xs == False = elimination3 xs
    | elimination3 xs == False = elimination4 xs
    | elimination4 xs == False = elimination5 xs
    | elimination1 xs == True || elimination2 xs == True || elimination3 xs == True || elimination4 xs == True || elimination5 xs == True = True
    | otherwise = False






-----------------------------------------------------Segédfüggvények-----------------------------------------------------


-----------------------------------------------------Második segédek-----------------------------------------------------
deleteN :: Eq a => Int -> [[a]] -> [[a]]
deleteN _ [[]] = [[]]
deleteN i (x:xs)
   | i == 0 = xs
   | otherwise = x : deleteN (i-1) xs


eliminalhato :: BitList -> Bool
eliminalhato xs
    | length  (group xs) == 1 = True --Ha 1 darab eliminálható elem van benne
    | length ( group (map length (group xs))) == 1 = False
    | length ( group (map length (group xs))) > 1 = True

elsoeliminalhato :: BitList -> Int
elsoeliminalhato = fst . head . filter (\(_, s) -> s>1) . zip [1..] . map length . group

nedikEliminalhato :: BitList -> Int -> Int
nedikEliminalhato xs n = fst (( filter (\(_, s) -> s>1) $ zip [1..] $ map length $ group xs) !! (n-1))


-----------------------------------------------------Harmadik segédek-----------------------------------------------------
elimination1 :: BitList -> Bool
elimination1 xs
    | length ( filter (>1) (map length (group xs))) >= 1 = elimination1 (eliminateNth xs 1)
    | length ( group (map length (group xs))) == 1 = False
    | length ( group (map length (group xs))) == 0 = True

elimination2 :: BitList -> Bool
elimination2 xs
    | length ( filter (>1) (map length (group xs))) >= 1 = elimination1 (eliminateNth xs 2)
    | length ( group (map length (group xs))) == 1 = False
    | length ( group (map length (group xs))) == 0 = True

elimination3 :: BitList -> Bool
elimination3 xs
    | length ( filter (>1) (map length (group xs))) >= 1 = elimination2 (eliminateNth xs 3)
    | length ( group (map length (group xs))) == 1 = False
    | length ( group (map length (group xs))) == 0 = True

elimination4 :: BitList -> Bool
elimination4 xs
    | length ( filter (>1) (map length (group xs))) >= 1 = elimination3 (eliminateNth xs 4)
    | length ( group (map length (group xs))) == 1 = False
    | length ( group (map length (group xs))) == 0 = True

elimination5 :: BitList -> Bool
elimination5 xs
    | length ( filter (>1) (map length (group xs))) >= 1 = elimination4 (eliminateNth xs 5)
    | length ( group (map length (group xs))) == 1 = False
    | length ( group (map length (group xs))) == 0 = True