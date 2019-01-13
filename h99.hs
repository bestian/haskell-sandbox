-- run `cabal update`
-- run `cabal install random`
import System.Random 

--https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems

--q1 Find the last element of a list.

myLast [] = error "empty list"
myLast (x:[]) = x
myLast (_:xs) = myLast xs

--q2 Find the last but one element of a list.

myButLast [] = error "empty list"
myButLast (x:[]) = error "only one emlement"
myButLast (x:y:[]) = x
myButLast (_:xs) = myButLast xs

--Problem 3: Find the K'th element of a list. The first element in the list is number 1.
elementAt [] _ = error "index of out bound"
elementAt (x:xs) 1 = x
elementAt (x:xs) k = elementAt xs (k-1)


--Problem 4: (*) Find the number of elements of a list.
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

--Problem 5 (*) Reverse a list.
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) =  myReverse xs ++ [x]

--6 Problem 6 (*) Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x).

isPalindrome list = reverse list == list


--7 Problem 7(**) Flatten a nested list structure.
data NestedList a = Elem a | List [NestedList a]
flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List []) = []
flatten (List (x:xs)) = flatten x ++ flatten (List xs)


--8 Problem 8 (**) Eliminate consecutive duplicates of list elements
compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:y:xs) | x == y      = compress (x:xs)
                  | otherwise   = x:(compress (y:xs))

--9 Problem 9
--(**) Pack consecutive duplicates of list elements into sublists.
--If a list contains repeated elements they should be placed in separate sublists.
pack [] = []
pack a@(x:xs) = takeWhile (== x) a:pack (dropWhile (== x) a)


--10 Problem 10
--(*) Run-length encoding of a list. 
--Use the result of problem P09 to implement the so-called run-length encoding data compression method. 
--Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

encode xs = map toTuple ys
    where ys = pack xs
          toTuple a@(x:xs) = (length a, x)
    
    
--Problem 11
--(*) Modified run-length encoding.
--Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list.
--Only elements with duplicates are transferred as (N E) lists.

data Run a = Single a | Multiple Int a deriving Eq

encodeModified xs = map toRun (encode xs)
    where toRun (1, x) = Single x
          toRun (a, x) = Multiple a x

--2 Problem 12
--(**) Decode a run-length encoded list.
--Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.

decodeModified xs = concat (map de xs)
    where de (Single x) = [x]
          de (Multiple 1 x) = de (Single x)
          de (Multiple k x) = x: de (Multiple (k-1) x) 

-- Problem 13 (跳過)
-- Problem 14
--(*) Duplicate the elements of a list.
dupli [] = []
dupli (x:xs) = [x,x] ++ dupli xs

--Problem 15
--(**) Replicate the elements of a list a given number of times.
repli [] n = []
repli (x:xs) n = copy x n ++ repli xs n
            where copy x k = take k (repeat x)
            
--Problem 16
--(**) Drop every N'th element from a list.
dropEvery xs k | length xs < k = xs
               | otherwise     = take (k-1) xs ++ dropEvery (drop k xs) k
               

-- Problem 17
--(*) Split a list into two parts; the length of the first part is given.

mySplit xs k = (take k xs, drop k xs)

--Problem 18
--(**) Extract a slice from a list.
--Given two indices, i and k, the slice is the list containing the elements between the i'th and k'th element of the original list (both limits included). Start counting the elements with 1.

slice xs i k = drop (i-1) (take k xs)

--9 Problem 19
--(**) Rotate a list N places to the left.
rotate xs k | k >= 0    = drop k xs ++ take k xs
            | otherwise = drop (length xs + k) xs ++ take (length xs + k) xs

--Problem 20
--(*) Remove the K'th element from a list.
removeAt k xs = (xs !! (k-1), take (k-1) xs ++ drop k xs)


-- Problem 21
-- Insert an element at a given position into a list.
insertAt x xs k = take (k-1) xs ++ [x] ++ drop (k-1) xs 


--Problem 22
--Create a list containing all integers within a given range.
range = enumFromTo

rnd_select :: [a] -> Int -> IO [a]
rnd_select _  0 = return []
rnd_select [] _ = return []
rnd_select xs count = do r <- randomRIO (0, (length xs)-1)
                         rest <- rnd_select ((snd . removeAt (r+1)) xs) (count-1)
                         return ((xs!!r) : rest)

--Problem 24
--Lotto: Draw N different random numbers from the set 1..M.
diff_select a b = rnd_select [1..b] a

--Problem 25
--Generate a random permutation of the elements of a list.
rnd_permu xs = rnd_select xs (length xs)

--Problem 26
--(**) Generate the combinations of K distinct objects chosen from the N elements of a list
combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations _ [] = []
combinations n (x:xs) = (map (x:) (combinations (n-1) xs)) ++ (combinations n xs)

--Problem 27(跳過)
--Group the elements of a set into disjoint subsets.

--Problem 28
--Sorting a list of lists according to length of sublists
sortBy :: Ord b => (a -> b) -> [a] -> [a]
sortBy f [] = []
sortBy f (x:xs) = bs ++ [x] ++ cs
    where bs = sortBy f (filter (\y -> f y < f x) xs)
          cs = sortBy f (filter (\y -> f y >= f x) xs)

lsort = sortBy length

main = do print $ myLast [1,2,3,4] == 4
          print $ myButLast [1,2,3,4] == 3
          print $ elementAt [1,2,3] 2 == 2
          print $ elementAt "haskell" 5 == 'e'
          print $ myLength "Hello, world!" == 13
          print $ myReverse [1,2,3,4] == [4,3,2,1]
          print $ isPalindrome "madamimadam" == True
          print $ flatten (Elem 5) == [5]
          print $ flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) == [1,2,3,4,5]
          print $ compress "aaaabccaadeeee" == "abcade"
          print $ pack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'] == ["aaaa","b","cc","aa","d","eeee"]
          print $ encode "aaaabccaadeeee" == [(4,'a'),(1,'b'),(2,'c'),(2,'a'),(1,'d'),(4,'e')]
          print $ encodeModified "aaaabccaadeeee" == [Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 4 'e']
          print $ decodeModified [Multiple 4 'a',Single 'b',Multiple 2 'c',Multiple 2 'a',Single 'd',Multiple 4 'e'] == "aaaabccaadeeee"
          print $ dupli [1, 2, 3] == [1,1,2,2,3,3]
          print $ repli "abc" 3 == "aaabbbccc"
          print $ dropEvery "abcdefghik" 3 == "abdeghk"
          print $ mySplit "abcdefghik" 3 == ("abc", "defghik")
          print $ slice ['a','b','c','d','e','f','g','h','i','k'] 3 7 == "cdefg"
          print $ rotate ['a','b','c','d','e','f','g','h'] 3 == "defghabc"
          print $ rotate ['a','b','c','d','e','f','g','h'] (-2) == "ghabcdef"
          print $ removeAt 2 "abcd" == ('b',"acd")
          print $ insertAt 'X' "abcd" 2 == "aXbcd"
          print $ range 4 9 == [4,5,6,7,8,9] 
          a <- rnd_select "abcdefgh" 3
          b <- diff_select 6 49
          c <- rnd_permu "abcdef"
          print a
          print b
          print c
          print $ combinations 3 "abcdef"
          print $ lsort ["abc","de","fgh","de","ijkl","mn","o"] == ["o","de","de","mn","abc","fgh","ijkl"]