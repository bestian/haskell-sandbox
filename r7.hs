import Ring7

main = do print $ Z 3 == Z 10
          print $ Z 10
          print $ take 10 [Z 6, Z 8..]
          print $ [Z 1, Z 3..Z 6]
          print $ [Z 1, Z 1..Z 1]