--題目：https://zerojudge.tw/ShowProblem?problemid=a005


main :: IO()
main = do
    putStrLn "請輸入數列個數："
    m  <- getLine
    runSeq (read m :: Int)

runSeq :: Int -> IO()
runSeq n | n == 0  = return ()
         | otherwise = do
             
            putStrLn "請輸入4項等差或等比數列：(ex:1 2 3 4 or 1 2 4 8)"
            seq  <- getLine
            mySeq <- return (read ("[" ++ parse seq ++ "]") :: [Int])
            print $ showL (add5 mySeq)
            runSeq (n-1)

parse seq = replace ' ' ',' seq

replace c d [] = []
replace c d (x:xs) | x == c = d : (replace c d xs)
                   | otherwise = x : (replace c d xs) 

add5 (x:y:z:xs) | z - y == y - x = x:y:z:xs ++ [(last xs) + (y - x)]
                | z `div` y == y `div` x = x:y:z:xs ++ [(last xs) * (y `div` x)]
                | otherwise = error "not 等差或等比數列"

showL [] = ""
showL (x:[]) = show x 
showL (x:xs) = show x ++ " " ++ showL xs

