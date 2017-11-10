import Ring7

main :: IO ()
main = do putStrLn $ "今天是星期幾？"
          d <- getLine
          putStrLn $　"一年後的今天是星期" ++ show (Z (read d :: Int) + 365)
          putStrLn $ "你想算幾天後是星期幾？"
          x <- getLine
          putStrLn $ x ++ "天後是星期" ++ show (Z (read d :: Int) + Z (read x :: Int))
