-- isTriagle :: Num Ord a => a -> a -> a -> Bool
isTriangle a b c  = (a + b > c) && (a + c > b) && (b + c > a)
isRightTriangle a b c = (isTriangle a b c) && 
                          ((a^2 + b^2 == c^2) || (c^2 + a^2 == b^2) || (b^2 + c^2 == a^2))

main :: IO ()
main = do

  putStrLn "請輸入三個整數，我會判它們能不能構成直角三角形"

  x1Str <- getLine
  let x1 = read x1Str :: Int
  x2Str <- getLine
  let x2 = read x2Str :: Int
  x3Str <- getLine
  let x3 = read x3Str :: Int
  print $ isRightTriangle x1 x2 x3

