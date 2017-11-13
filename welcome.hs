main :: IO()
main = do
    putStrLn "請問您的大名？"
    james <- getLine
    if length james > 1
        then putStrLn $ "歡迎" ++ james ++ "來到奇妙的Haskell世界!"
        else putStrLn $ "歡迎" ++ james ++ "!"