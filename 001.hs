import System.IO (hSetEncoding, stdout, utf8)

f :: Num a => a -> a
f x = x + 3

main :: IO ()
main = do
  hSetEncoding stdout utf8   -- ⭐ 關鍵

  let list = [1,2..10]
  print $ f 8
  print $ f (-6)
  print $ map f list

  putStrLn "請輸入一個整數，我會把它加3"

  xStr <- getLine
  let x = read xStr :: Int
  print $ f x
