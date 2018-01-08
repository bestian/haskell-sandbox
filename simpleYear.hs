--題目：https://zerojudge.tw/ShowProblem?problemid=a004


main :: IO()
main = do
    putStrLn "請輸入年份："
    m  <- getLine
    ans <- return $ (read m :: Int)  --改這行
    -- if ans ... 
    --- then 
    	--- putStrLn "平年" 
    --- else 
    	--- putStrLn "閏年"