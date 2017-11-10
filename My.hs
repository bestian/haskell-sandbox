--相似與幾何圖形
module My
( 
myAbs,
myMap
) where



myAbs :: (Ord a, Num a) => a -> a
myAbs x | x < 0     = -x
        | otherwise = x


myMap :: (a -> b) -> [a] -> [b] --入一個a->b函數，再入一個a串列，出一個b串列
myMap _ [] = []   --遞迴終點
myMap f (x:xs) = f x: myMap f xs --套入一個後，其他繼續算