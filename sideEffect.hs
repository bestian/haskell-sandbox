-- run `cabal install random`
import System.Random 

rollDice :: IO Int
rollDice = getStdRandom (randomR (1,6))

main :: IO()
main = do	
    print $ "enter a name, please."
    x <- getLine
    print $ x
    print $ "enter another name, please."
    x <- getLine
    print $ x
    y <- rollDice
    print $ "i've just rolled a dice:"
    print $ y
    print $ "i've just rolled another dice:"
    y <- rollDice
    print $ y