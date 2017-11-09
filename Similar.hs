--相似與幾何圖形
module Similar
( Sim, M2, Shape(Square,Rectangle,Triangle), (~~), perimeter, area ) where


class (Eq a) => Sim a where
   (~~) :: a -> a -> Bool
   
class M2 a where
   perimeter :: a -> Float
   area :: a -> Float 
   
data Shape = Square Float | Rectangle Float Float | Triangle Float Float Float
     deriving Eq
     
instance M2 Shape where
    perimeter (Square a) = 4*a
    perimeter (Rectangle a b) = 2*a + 2*b
    perimeter (Triangle a b c) = a + b + c
    area (Square a) = a^2
    area (Rectangle a b) = a * b
    area (Triangle a b c) = sqrt (s*(s-a)*(s-b)*(s-c)) -- 海龍公式，證明見http://jwilson.coe.uga.edu/EMT725/Heron/HeronProofAlg.html
        where s = (a+b+c)/2

instance Sim Shape where
   Square _ ~~ Square _ = True
   Square _ ~~ Rectangle a b = a == b
   Rectangle a b ~~ Square c = Square c ~~ Rectangle a b
   Rectangle a b ~~ Rectangle c d = a*c == b*d
   Triangle a b c ~~ Triangle x y z = x/a == y/b && y/b == z/c
   _~~ _ = False
   
instance Ord Shape where
   x `compare` y = area x `compare` area y 
   

instance Sim Double where
   x ~~ y = abs (y-x) < 1e-14
   
instance Sim Float where
   x ~~ y = abs (y-x) < 1e-5

instance Sim a => Sim [a] where
   xs ~~ ys = all id (zipWith (~~) xs ys)