class (Eq a) => Almost a where
   (~~) :: a -> a -> Bool
   
instance Almost Double where
   x ~~ y = abs (y-x) < 1e-7
   
instance Almost Float where
   x ~~ y = abs (y-x) < 1e-7

instance Almost a => Almost [a] where
   xs ~~ ys = all id (zipWith (~~) xs ys)

main = do print $ ([3.0, 4.0, 5.0] :: [Float]) ~~ ([3.000000001, 4.0, 5.0000000001] :: [Float])