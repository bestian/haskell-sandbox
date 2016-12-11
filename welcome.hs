
main :: IO()
main = do
	print $ "What's your name?"
	x <- getLine
	print $ "Welcome, " ++ x ++ "!"