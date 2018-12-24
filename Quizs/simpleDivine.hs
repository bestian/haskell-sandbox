--題目：https://zerojudge.tw/ShowProblem?problemid=a003

divines = ["普通", "吉", "大吉"]

main :: IO()
main = do
    putStrLn "請輸入月份和日期："
    m  <- getLine
    d  <- getLine
    ans <- return $ ((read m :: Int) * 2 + (read d :: Int)) `mod` 3
    putStrLn $ divines !! ans 