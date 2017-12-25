--題目：https://zerojudge.tw/ShowProblem?problemid=a003

divines = ['普通', '吉', '大吉']

main :: IO()
main = do
    putStrLn "請輸入月份和日期："
    m  <- getLine
    d  <- getLine
    ans <- return $ (read m :: Int) + (read d :: Int) --改這行
    print ans --改這行