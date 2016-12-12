import Data.List
import Imp

foo = [1,2,3,5,4,6,0,-5,6,-2,3,4,9,7]
ans1 = sortSqare foo
ans2 = (sort . cube) foo


main :: IO()
main = do
    print $ sort foo
    print $ ans1
    print $ ans2