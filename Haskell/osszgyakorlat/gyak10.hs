module Gyak10 where

import Prelude hiding (String, Bool(..), Maybe(..), Either(..))

-- Adatszerkezetek

-- Típusszinonímák (http://lambda.inf.elte.hu/Synonyms.xml):
-- A type kulcsszó segítségével lehet bevezetni
-- A bevezetett típusnév nagybetűvel kezdődjön

-- A type kulcsszóval bevezetett típusok csak egy új nevet adnak típusnak.
-- Haszna: olvashatóbb, átláthatóbb kód
-- DE: nem jelent extra biztonságot, a két típus a háttérben ugyanaz lesz!

-- Pl.: String
type String = [Char]

-- Name
type Name = String
-- Year
type Year = Int

-- A Year típus átadható Int-et váró függvénynek
-- pl.: even (2021 :: Year)

type Square = (Char, Int) --sakktábla mező


-- Paraméteres típusszinonímák
-- Megadható típusparaméter a definícióban:
-- Pair
type Pair a = (a, a) --(1,2) :: Pair Int

-- Nem feltétlen kell felhasználni a paramétereket, de amit használunk a jobb oldalon az szerepeljen a bal oldalon

type ListList a = [[a]]
type P2 a = (a,a)
type PredicateOn a = a -> Bool


-- Származtatott típusok (http://lambda.inf.elte.hu/Newtypes.xml)
-- A newtype kulcszóval lehet bevezetni
-- Meg kell adni: típusnév, konstruktor neve, egy létező típus
-- Pl.:
newtype Name' = N String
  deriving (Show, Eq, Ord)
-- Itt már van különbség a bevezetett és az eredeti típus között, ezt a különbséget a konstruktor jelenti.
-- Csak egy paramétere lehet a konstruktornak!

-- Haszna: jobb olvashatóság, ÉS biztonságosabb kód.
-- Konverzió kell ha át akarunk térni a mögöttes típusra

-- A konstruktor használata:
x :: Name'
x = N "alma"

-- De nem tudjuk megjeleníteni, kérjünk a fordítótól megjelenítő függvényeket:
-- deriving (Show)

-- Hasonlóan egyenlőségvizsgálat, és összehasonlítás: deriving (Eq, Ord)

newtype Year' = Y Int
  deriving(Show,Eq,Ord)
newtype Square' = S (Char, Int)
  deriving (Show, Eq)

s :: (Char, Int) -> Square'
s (c, i)
    | c `elem` ['a'..'h'] && i `elem` [1..8] = S (c, i)
    | otherwise = error "Hiba"

newtype IPoint = P (Int, Int)
  deriving (Show,Eq)

-- Mintaillesztés konstruktorra
mirrorO :: IPoint -> IPoint
mirrorO (P (x,y)) = (P (-x,-y))
translate :: (Int, Int) -> IPoint -> IPoint
translate (a,b) (P (x,y)) = (P (x + a, y + b))



-- Algebrai adattípusok (data) (http://lambda.inf.elte.hu/Algebraic.xml)
-- Kulcsszó: data
-- Itt is konstruktort adunk meg, de lehet több paramétere is.
-- Sőt: lehet több konstruktor is.
-- deriving az előzőekhez hasonlóan
--  Eq-nál és Ord-nál az összes paramétert vizsgálja, a definíció sorrendjében.

data IPoint' = P' Int Int
  deriving (Eq, Ord, Show)


-- Mintaillesztés data-ra
mirrorO' :: IPoint' -> IPoint'
mirrorO' (P' x y) = P' (-x) (-y)
translate' :: (Int, Int) -> IPoint' -> IPoint'
translate' (a,b) (P' x y) = P' (x + a) (y + b)

-- Nulla paraméterű konstruktorok:
data Direction
    = L
    | R
    deriving (Eq, Ord, Show)
numOfLs :: [Direction] -> Int
numOfLs xs = length $ filter (==L) xs
mirror :: Direction -> Direction
mirror L = R
mirror R = L

-- Háromértékű válaszok
data Answer
    = Yes
    | Maybe
    | No
    deriving (Show, Eq, Ord)

(&&&) :: Answer -> Answer -> Answer
infixr 3 &&&
x &&& Yes = x
Yes &&& x = x
Maybe &&& Maybe = Maybe
_ &&& _ = No

-- (&&&) = min

(|||) :: Answer -> Answer -> Answer
infixr 2 |||
(|||) = max



-- CardinalPoint
-- turnLeft :: CardinalPoint -> CardinalPoint
-- turnBack :: CardinalPoint -> CardinalPoint

data Bit
    = One
    | Zero
    deriving (Show, Eq, Ord)

type Binary = [Bit]

plus1 :: Binary -> Binary
plus1 [] = [One]
plus1 (Zero:xs) = One:xs
plus1 (One:xs) = Zero:(plus1 xs)

-- A Bool is így van definiálva
data Bool = False | True deriving(Show,Eq,Ord)

-- Ordering

-- show definiálása deriving nélkül 
-- data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

-- instance Show Day where
--     show Mon = "Hétfő"
--     show Tue = "Kedd"
--     show Wed = "Szerda"
--     show Thu = "Csütörtök"
--     show Fri = "Péntek"
--     show Sat = "Szombat"
--     show Sun = "Vasárnap"


-- Több konstruktor, több paraméterrel
-- Color
-- Piece


-- Paraméteres data (http://lambda.inf.elte.hu/ParametricData.xml)
-- Típusparaméterek is megadhatók a data-nak.
data MaybeInt
    = NoInt
    | JustInt Int
    deriving (Show, Eq, Ord)



safeDiv' :: Int -> Int -> MaybeInt
safeDiv' n 0 = NoInt
safeDiv' n m = JustInt (n `div` m)

data Maybe a
    = Nothing
    | Just a
    deriving (Show, Eq, Ord)

safeDiv :: Integral a => a -> a -> Maybe a
safeDiv n 0 = Nothing
safeDiv n m = Just (n `div` m)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

data Either a b
    = Left a
    | Right b
    deriving (Show,Eq, Ord)