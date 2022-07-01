module Homework12 where

fromBin :: [Int] -> Integer
fromBin = foldr (\x y -> (fromIntegral x) + 2*y) 0

polinom :: Integral a => [a] -> a -> a
polinom xs n = (foldr (\x y -> y*n+x) 0 xs)

factorials :: Integer -> [Integer]
factorials n = scanl1 (\x y -> x*y) [1..n]