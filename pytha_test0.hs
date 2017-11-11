import Pytha

main = do print $ (take 100. iterate next) (2,1)
          print $ (take 100. map pytha . iterate next) (2,1)
          print $ (all checkP . take 100. map pytha . iterate next) (2,1)