main :: IO()
main = do
    putStrLn "請問您的大名？"
    name <- getLine
    if length name > 1
        then putStrLn $ "歡迎" ++ name ++ "來到奇妙的Haskell世界!"
        else putStrLn $ "歡迎" ++ name ++ "!"