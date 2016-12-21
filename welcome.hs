-- $ runghc welcome.hs



main :: IO()
main = do
  印一行 "請問您的大名？"
  使用者的大名 <- 讀一行
  印一行 $ "歡迎" ++ 使用者的大名 ++ "來到奇妙的Haskell世界!"




印一行 :: String -> IO()
印一行 = putStrLn

讀一行 :: IO String
讀一行 = getLine