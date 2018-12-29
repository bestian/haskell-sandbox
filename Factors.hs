--因數與質數
module Factors
( factors, isPrime,
    isPerfect, pf) where


factors n = getFact n [] [1..m]
  where m = (floor . sqrt . fromIntegral) n
        getFact n xs [] = xs
        getFact n xs (y:ys) | n == y^2     = xs ++ [y]
                          | n `mod` y == 0 = xs ++ [y, n `div` y] ++ getFact n xs ys
                          | otherwise    = xs ++ getFact n xs ys

isPrime p = factors p == [1,p]

isPerfect n = (sum . factors) n == 2*n

pf :: Integer -> [Integer]
pf n | n <= 1      = []
     | isPrime n   = [n]
     | otherwise   = p:pf (n `div` p)
         where primes = filter isPrime [2..(floor . sqrt . fromIntegral) n]
               pfs = filter (\x -> n `mod` x == 0) primes
               p = head pfs


