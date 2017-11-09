main :: IO()
main = do
    putStrLn "請問您的大名？"
    大名 <- getLine
    if length 大名 > 1
        then putStrLn $ "歡迎" ++ 大名 ++ "來到奇妙的Haskell世界!"
        else putStrLn $ "歡迎" ++ 大名 ++ "!"