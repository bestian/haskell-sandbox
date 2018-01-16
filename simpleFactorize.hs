--題目：https://zerojudge.tw/ShowProblem?problemid=a010
--質因數分解
--Input 一個整數, 大於1 且 小於等於 1000000
--20 => 2^2 * 5
--17 => 17
--999997 => 757 * 1321

isPrime p = all (\k -> p `mod` k /= 0) [2..p-1]
primes = filter isPrime [2..1000000]

join :: [Char] -> [[Char]] -> [Char]
join s [] = []
join s (x:[]) = x
join s (x:xs) = x ++ s ++ (join s xs)

showPrime c p | c == 0   = []
              | c == 1 = show p
              | otherwise = show p ++ "^" ++ show c
countPrime x p | x `mod` p /= 0  = 0
               | otherwise       = 1 + (countPrime (x `div` p) p)


factorize :: Int -> [Char]
factorize x = join " * " $ zipWith showPrime (map (\p -> countPrime x p) myPrimes) myPrimes
    where myPrimes = filter (\p -> x `mod` p == 0) (takeWhile (<=x) primes)


main :: IO()
main = do
    putStrLn "請輸入正整數："
    m  <- getLine
    ans <- return $ (read m :: Int)  
    print $ factorize ans
