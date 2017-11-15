import My

main = do print $ myTakeWile (<5) [1..10] == takeWile (<5) [1..10]
		  print $ myDrop 3 "happy" == "py"
		  print $ myDropWhile (<5) [1..10] == dropWhile (<5) [1..10] 