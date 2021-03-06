--七的數環
module Ring_7
( Z7(Z)  ) where

import Data.Ratio

data Z7 = Z Int
instance Eq Z7 where
    (==) (Z a) (Z b) = (b - a) `mod` 7 == 0


instance Num Z7 where
    (+) (Z n) (Z m) = Z (n+m)
    (-) (Z n) (Z m) = Z (n-m)
    (*) (Z n) (Z m) = Z (n*m)
    abs (Z n) = Z (min (n `mod` 7) ((-n) `mod` 7))
    signum (Z n) | n `mod` 7 == 0 = Z 0
                 | n `mod` 7 > 3  = Z (-1)
                 | otherwise      = Z 1
    fromInteger n = Z (fromInteger n)
    
instance Enum Z7 where
    succ (Z n) = Z (succ n)
    pred (Z n) = Z (pred n)
    fromEnum (Z n) = n `mod` 7
    toEnum n = Z n
    enumFrom (Z n) = iterate (+ (Z 1)) (Z n)
    enumFromTo (Z n) (Z m) | Z n == Z m  = [Z n]
                           | otherwise   = (Z n):enumFromTo (Z (n+1)) (Z m)
    enumFromThen (Z n) (Z m) = iterate (+ Z (m-n)) (Z n)
    enumFromThenTo (Z a) (Z b) (Z n) = takeWhile ( /= Z n) (iterate (+ Z (b-a)) (Z a)) ++ [Z n]


instance Show Z7 where
    show (Z n) = show (n `mod` 7)

instance Fractional Z7 where
    (Z _) / (Z 0) = error "divided by 0" 
    (Z a) / (Z b) = (head . filter (\k -> k * (Z b) == (Z a))) [Z 0..Z 6]
    recip (Z 0) = error "divided by 0" 
    recip (Z a) = (head . filter (\k -> k * (Z a) == (Z 1))) [Z 0..Z 6]
    fromRational r = Z ((fromInteger . numerator) r) / Z ((fromInteger . denominator) r)