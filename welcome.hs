main :: IO()
main = do
    putStrLn "請問您的大名？"
    n  <- getLine
    if length n > 2
        then putStrLn $ "歡迎" ++ n ++ "來到奇妙的Haskell世界!"
        else putStrLn $ "歡迎" ++ n ++ "!"