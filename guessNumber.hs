-- run `cabal update`
-- run `cabal install random`
import System.Random 

roll100 :: IO Int
roll100 = getStdRandom (randomR (1,100))

guess :: Int -> IO ()
guess x = do putStrLn "猜猜看1~100"
             l <- getLine
             if (read l :: Int) < x
                then do putStrLn "猜得太小了"
                        guess x
                else if (read l :: Int) > x
                        then do putStrLn "猜得太大了"
                                guess x
                        else do putStrLn "猜中了！你好棒！"
                                return ()


main :: IO()
main = do x <- roll100
          guess x
    