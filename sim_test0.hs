import Similar

main = do print $ perimeter (Triangle 3 4 5)
          print $ Triangle 3 4 5 ~~ Triangle 6 8 10
          print $ ([3+1e-6, 4.0, 5+1e-6] :: [Float])
          print $ ([3+1e-15, 4.0, 5+1e-15] :: [Double])
          print $ [3, 4, 5] ~~ ([3+1e-6, 4.0, 5+1e-6] :: [Float])
          print $ [3.0, 4.0, 5.0] ~~ ([3+1e-6, 4.0, 5+1e-6] :: [Double])