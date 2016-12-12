import Data.List
import Imp

foo = [1,2,5,4,6,1,6,3,2,9,2]
ans1 = (sort . sqare) foo
ans2 = (sort . cube) foo


main :: IO()
main = do
    print $ ans1
    print $ ans2