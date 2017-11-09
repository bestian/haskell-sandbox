-- run `cabal update`
-- run `cabal install random`
import System.Random 

rollDice :: IO Int
rollDice = getStdRandom (randomR (1,6))

roll :: IO ()
roll = do y <- rollDice
          print $ "dice rolled: " ++ show y
          putStrLn $ "再一次嗎？[y]n"
          c <- getChar
          if c /= 'n'
             then roll
             else return ()

main :: IO()
main = do roll
    