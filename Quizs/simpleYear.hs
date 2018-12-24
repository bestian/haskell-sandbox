--題目：https://zerojudge.tw/ShowProblem?problemid=a004


main :: IO()
main = do
    putStrLn "請輸入年份："
    m  <- getLine
    ans <- return $ (read m :: Int)  --改這行
    if ((ans `mod` 4  == 0 ) && (ans `mod` 100 /= 0)) ||  (ans `mod` 400 == 0) 
        then  putStrLn "閏年"   
        else  putStrLn "平年" 
            