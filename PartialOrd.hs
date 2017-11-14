--部份排序與格序
module PartialOrd
(OrderingP, Par, Point(P), Lat, (>~), (<~) ) where

type OrderingP = Maybe Ordering
class Par a where
    compareP :: a -> a -> OrderingP
class (Par a) => Lat a where
    inf :: a -> a -> a
    sup :: a -> a -> a

data Point =  P (Float, Float) deriving (Show, Eq)

instance Par Point where
    compareP (P (a,b)) (P (c,d)) | a == c && b == d  = Just EQ
                                 | a >= c && b >= d  = Just GT
                                 | a <= c && b <= d  = Just LT
                                 | otherwise         = Nothing
instance Lat Point where
    inf (P (a,b)) (P (c,d)) = P (min a c, min b d)
    sup (P (a,b)) (P (c,d)) = P (max a c, max b d)
  

instance Par Int where
    compareP x y | x == y         = Just EQ
                 | x `mod` y == 0 = Just GT
                 | y `mod` x == 0 = Just LT
                 | otherwise         = Nothing

instance Par Integer where
    compareP x y | x == y         = Just EQ
                 | x `mod` y == 0 = Just GT
                 | y `mod` x == 0 = Just LT
                 | otherwise         = Nothing

instance Lat Int where
    inf x y = gcd x y
    sup x y = lcm x y

instance Lat Integer where
    inf x y = gcd x y
    sup x y = lcm x y

infix >~
(>~) :: (Par a) => a -> a -> Bool
x >~ y | x `compareP` y == Just GT  || x `compareP` y == Just EQ = True
       | otherwise                                               = False

infix <~
(<~) :: (Par a) => a -> a -> Bool
x <~ y | x `compareP` y == Just LT  || x `compareP` y == Just EQ = True
       | otherwise                                               = False