--題目：https://zerojudge.tw/ShowProblem?problemid=a006

parse seq = replace ' ' ',' seq

replace c d [] = []
replace c d (x:xs) | x == c = d : (replace c d xs)
                   | otherwise = x : (replace c d xs) 

main :: IO()
main = do
    putStrLn "輸入三個整數 a, b, c：ex:1 3 -10"
    seq <- getLine
    mySeq <- return (read ("[" ++ parse seq ++ "]") :: [Float])
    a <- return (mySeq !! 0)
    b <- return (mySeq !! 1)
    c <- return (mySeq !! 2)
    d <- return (b^2 - 4*a*c)
    if d < 0 
        then print "No real root"
        else if d == 0 
                then print $ "Two same roots x=" ++ show (-b/(2*a))
                else print $ "Two different roots x1=" ++ show (-b+sqrt d/(2*a)) ++ " , x2=" ++ show (-b-sqrt d/(2*a))

