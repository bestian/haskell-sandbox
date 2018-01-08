--題目：https://zerojudge.tw/ShowProblem?problemid=a010
--質因數分解
--Input 一個整數, 大於1 且 小於等於 1000000
--20 => 2^2 * 5
--17 => 17
--999997 => 757 * 1321



factorize :: Int -> [Char]

main :: IO()
main = do
    putStrLn "請輸入正整數："
    m  <- getLine
    ans <- return $ (read m :: Int)  
    print $ factorize ans