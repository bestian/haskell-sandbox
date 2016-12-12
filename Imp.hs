module Imp 
( sqare
, cube ) where


sqare :: Num a => [a] -> [a]
sqare xs = map (\x -> x^2) xs

cube :: Num a => [a] -> [a]
cube xs = map (\x -> x^3) xs