--題目：https://zerojudge.tw/ShowProblem?problemid=a034

{-
內容
還記得計算機概論嗎？還記得二進位嗎？

現在我們來計算一下將一個10進位的數字換成二進位數字
 

輸入說明
一個十進位的數值
 

輸出說明
輸出二進位制的結果

範例輸入
3
6
範例輸出
11
110
-}

main :: IO()
main = do
    putStrLn "我們來計算一下將一個10進位的數字換成二進位數字"
    x <- getLine
    print $ to2 (read x :: Int)


to2 :: Int -> [Char]
to2 n | n == 0  = "0"
      | n == 1  = "1"
      | n == 2  = "10"
      | n `mod` 2 == 0 = to2 (n `div` 2)++"0"
      | otherwise = to2 (n `div` 2)++"1"
