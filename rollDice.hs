-- run `cabal update`
-- run `cabal install random`
import System.Random 

rollDice :: IO Int
rollDice = getStdRandom (randomR (1,6))

main :: IO()
main = do
    y <- rollDice
    print $ "dice rolled: " ++ show y