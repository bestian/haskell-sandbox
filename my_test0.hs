import My

main = do print $ myMap myAbs [-10..10]
          print $ myFilter (>5) [1..10]