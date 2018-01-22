--題目：https://zerojudge.tw/ShowProblem?problemid=a059
{-
內容
給你一個範圍 a 到 b ，請你找出 a 與 b 之間所有完全平方數的和。

例如：範圍 [3, 25] 中所有完全平方數的和就是 4 + 9 + 16 + 25  = 54 。
輸入說明
輸入的第一列有一個整數 T （1≦T≦100），代表以下有多少組測試資料。

每組測試資料為兩列，包含兩個數 a 與 b （0≦a≦b≦1000）。

輸出說明
每組測試資料輸出一列，內容為 a 及 b 間所有完全平方數的和。

範例輸入
2
1
5
5
35

範例輸出
Case 1: 5
Case 2: 50
-}

main :: IO()
main = do
    putStrLn "請輸入範圍個數："
    m  <- getLine
    runIn (read m :: Int)

runIn :: Int -> IO()
runIn n = do
    if n == 0
        then return ()
        else do
            putStrLn "請用兩行分別輸入範圍之下限和上限："
            a <- getLine
            b <- getLine
            putStrLn "範圍中的平方數總和為"
            print $ (sum . filter isSquare) [(read a :: Int) .. (read b :: Int)]
            runIn (n-1)

isSquare :: Int -> Bool
isSquare n = (fromIntegral . floor) y == y
            where y = (sqrt . fromIntegral) n
