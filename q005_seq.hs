--題目：https://zerojudge.tw/ShowProblem?problemid=a005
{-
輸入說明
第一行是數列的數目t（0 <= t <= 20）。 以下每行均包含四個整數，表示數列的前四項。
約定數列的前五項均為不大於105的自然數，等比數列的比值也是自然數。

輸出說明
對輸入的每個數列，輸出它的前五項。

範例輸入
2
1 2 3 4
1 2 4 8

範例輸出
1 2 3 4 5
1 2 4 8 16
-}

add5 (a:b:c:xs)  | c - b == b - a = a:b:c:xs ++ [(last xs) + (c - b)]
                 | c `div` b == b `div` a = a:b:c:xs ++ [(last xs) * (c `div` b)]
                 | otherwise = error "不是等差或等比數列"

parse seq = replace ' ' ',' seq

replace c d [] = []
replace c d (x:xs) | x == c = d:(replace c d xs)
                   | otherwise = x:(replace c d xs)

showL [] = ""
showL (x:[]) = show x 
showL (x:xs) = show x ++ " " ++ showL xs


main :: IO()
main = do
    putStrLn "請輸入數列個數："
    m  <- getLine
    runSeq (read m :: Int)

runSeq :: Int -> IO()
runSeq n | n == 0  = return ()
         | otherwise = do
              putStrLn "請輸入4個數的等差或等比數列"   
              seq <- getLine
              print $ showL (add5 (read ("[" ++ parse seq ++ "]") :: [Int]))
              runSeq (n-1)
          
          print $ showL (add5 (read ("[" ++ parse seq ++ "]") :: [Int]))