module My
( 
myAbs, mySignum,
myMap, myFilter,
myLength, myHead, myTail, myReverse, myLast, myInit,
myComposite,
myZip, myFst, mySnd, myZipWith,
myRepeat, myCycle, myIterate, myTake, myTakeWhile, myDrop, myDropWhile,
isWhole, mySqrt, 開立方,
sortBy,
sigma, delta,
myEven, myOdd
) where


myAbs :: (Eq a, Num a) => a -> a
myAbs x | signum x == -1 = -x
        | otherwise      = x

mySignum :: (Eq a, Num a) => a -> a
mySignum x | x == 0    = 0
           | abs x == x = 1
           | otherwise  = -1

myMap :: (a -> b) -> [a] -> [b] --入一個a->b函數，再入一個a串列，出一個b串列
myMap _ [] = []   --遞迴終點
myMap f (x:xs) = f x: myMap f xs --套入一個後，其他繼續算

myFilter :: (a -> Bool) -> [a] -> [a]  --入一個命題函數，再入一個a串列，出一個a串列
myFilter _ [] = []  --遞迴終點
myFilter p (x:xs) | p x       = x: myFilter p xs  --通過就留，剩下繼續篩
                  | otherwise = myFilter p xs

myLength :: [a] -> Int  --入一個a串列，出一個整數
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

myHead :: [a] -> a
myHead [] = error "empty list"
myHead (x:_) = x

myTail :: [a] -> [a]
myTail [] = error "empty list"
myTail (_:xs) = xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

myLast :: [a] -> a
myLast = head . reverse

myInit :: [a] -> [a]
myInit = tail . reverse

myComposite :: (b -> c) -> (a -> b) -> (a -> c)
f `myComposite` g = (\x -> f (g x))

myZip :: [a] -> [b] -> [(a,b)]
myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (y:ys) = (x,y):myZip xs ys

myFst :: (a,b) -> a
myFst (a,_) = a

mySnd :: (a,b) -> b
mySnd (_,b) = b

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ _ [] = []
myZipWith _ [] _ = []
myZipWith f (x:xs) (y:ys) = f x y:myZipWith f xs ys

myRepeat :: a -> [a]  --入一個a，出一個a串列
myRepeat x = x:myRepeat x

myCycle :: [a] -> [a] --入一個a串列，出一個a串列
myCycle xs = xs ++ myCycle xs

myIterate :: (a -> a) -> a -> [a] --入一個函式和一個元素，出一個串列
myIterate f x = x:map f (myIterate f x)

myTake :: Int -> [a] -> [a]
myTake _ [] = []
myTake n (x:xs) | n <= 0     = []
                | otherwise  = x:myTake (n-1) xs

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ [] = []
myTakeWhile p (x:xs) | p x    = x:myTakeWhile p xs
                     | otherwise = []

myDrop :: Int -> [a] -> [a]
myDrop _ [] = []
myDrop n (x:xs)  | n <= 0    = x:xs
                 | otherwise = myDrop (n-1) xs

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = [] 
myDropWhile p (x:xs) | p x       = myDropWhile p xs
                     | otherwise = x:xs

isWhole :: (RealFrac a) => a -> Bool
isWhole x = (fromIntegral . floor) x == x

mySqrt :: Double -> Double
mySqrt n = 逼近法 1 n n
  where 逼近法 下界 上界 目標 | 上界 - 下界 < 1e-14 =  算術平均
                           | otherwise          = 逼近法 (目標 / 算術平均) 算術平均 目標
                    where 算術平均 = (下界 + 上界) / 2


開立方 n = 二分逼近法 1 n n
    where 二分逼近法 下界 上界 目標
            | 上界 - 下界 < 2e-15  = 算術平均
            | 算術平均 ^ 3 > 目標 = 二分逼近法 下界 算術平均 目標 
            | 算術平均 ^ 3 < 目標 = 二分逼近法 算術平均 上界 目標 
            | otherwise    = 算術平均
                  where 算術平均 = (下界 + 上界) / 2


sortBy :: Ord b => (a -> b) -> [a] -> [a]
sortBy f [] = []
sortBy f (x:xs) = bs ++ [x] ++ cs
    where bs = sortBy f (filter (\y -> f y < f x) xs)
          cs = sortBy f (filter (\y -> f y >= f x) xs)


sigma :: Num a => [a] -> [a]
sigma xs = map (\k -> (sum . take k) xs) [1..length xs]

delta :: Num a => [a] -> [a]
delta [] = []
delta xs = zipWith (subtract) xs (tail xs)

myEven :: Integral a => a -> Bool
myEven = even

myOdd :: Integral a => a -> Bool
myOdd = odd

myGcd :: Integral a => a
myGcd = gcd

myLcm :: Integral a => a
myLcm = lcm
