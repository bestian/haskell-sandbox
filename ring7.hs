-- $ runghc ring7.hs


--七的數環

data Z7 = Z Int
instance Eq Z7 where
    (==) (Z a) (Z b) = (b - a) `mod` 7 == 0

instance Num Z7 where
    (+) (Z n) (Z m) = Z (n+m)
    (-) (Z n) (Z m) = Z (n-m)
    (*) (Z n) (Z m) = Z (n*m)
    abs (Z n) = Z (abs n)
    signum (Z n) = Z (signum n)
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


main = do print $ Z 3 == Z 10
          print $ Z 10
          print $ take 10 [Z 6, Z 8..]
          print $ [Z 1, Z 3..Z 6]
          print $ [Z 1, Z 1..Z 1]