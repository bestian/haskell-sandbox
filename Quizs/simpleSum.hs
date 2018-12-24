main :: IO()
main = do
    putStrLn "請輸入兩個數："
    n1  <- getLine
    n2  <- getLine
    ans <- return $ (read n1 :: Int) + (read n2 :: Int)
    print ans