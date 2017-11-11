--統計問題
module Stat
( mean, 
    sortBy, median,
    count, mode) where

--平均數
mean xs = sum xs / fromIntegral (length xs)


{- 依一個函數來排序 -}
sortBy f [] = []
sortBy f (x:xs) = as ++ [x] ++ cs
    where as = sortBy f (filter (\y -> f y < f x) xs)
          cs = sortBy f (filter (\y -> f y >= f x) xs)



--中位數
median c | length c `mod` 2 /= 0     = (sortBy id c) !! ((length c) `div` 2)
         | otherwise                 = ((sortBy id c) !! ((length c) `div` 2) + (sortBy id c) !! ((length c) `div` 2 - 1)) / 2


count a [] = 0
count a (x:xs) | x == a       = 1 + count a xs
               | otherwise    = count a xs


--眾數
mode xs = fst ((last. 排順序) (zip xs 重覆次數))
         where 重覆次數 = map (\x -> count x xs) xs
               排順序 = sortBy snd