main :: IO()
main = do
  putStrLn "請問您的大名？"
  使用者的大名 <- getLine
  putStrLn $ "歡迎" ++ 使用者的大名 ++ "來到奇妙的Haskell世界!"
