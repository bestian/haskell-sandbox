module Imp 
( sortSqare
, cube ) where

import Data.List


sortSqare :: (Ord a, Num a) => [a] -> [a]
sortSqare xs = sort ys
	where ys = map (\x -> x^2) xs


cube :: Num a => [a] -> [a]
cube xs = map (\x -> x^3) xs