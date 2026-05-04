
-- 002.hs


-- 階乘 factorial :: Int -> Int
factorial :: Int -> Int
-- 階乘的定義是：

factorial 0 = 1
factorial n = n * factorial (n - 1)

-- 階乘 n 的意思是：n * (n-1) * (n-2) * ... * 1


-- 這個程式用來計算：有 n 個人時，可以分成幾種不同的組。
-- 例如 3 個人 A、B、C，可以分成：
-- A / B / C
-- AB / C
-- AC / B
-- A / BC
-- ABC
-- 所以答案是 5 種。

-- countGroups 是最簡單的入口。
-- 只要告訴它有幾個人，它就會算出全部分組方法。
countGroups :: Int -> Int

-- 如果有 0 個人，就只有 1 種方法：什麼都不分。
-- 這個答案看起來有點奇怪，但它可以讓遞迴順利停下來。
countGroups 0 = 1

-- 如果有 n 個人，我們允許最大的一組有 n 個人。
-- 也就是說，大家全部在同一組也可以。
countGroups n = countGroups_with_max_group_size n n


-- choose n k 的意思是：
-- 從 n 個東西裡面，挑出 k 個東西，有幾種挑法。
-- 例如 choose 4 2 = 6，因為 4 個人裡挑 2 個人有 6 種。
choose :: Int -> Int -> Int
choose n k

  -- 如果想挑的人數小於 0，或比總人數還多，就不可能，答案是 0。
  | k < 0 || k > n = 0

  -- 用組合數公式計算。
  -- product [a..b] 會把 a 到 b 的數字全部乘起來。
  | otherwise = product [n - smallK + 1..n] `div` product [1..smallK]
  where

    -- 從 n 個人挑 k 個，和挑 n-k 個，其實數量一樣。
    -- 例如從 10 人挑 2 人，等於決定哪 8 人不被挑。
    -- 所以這裡選比較小的數字來算，乘法會比較少。
    smallK = min k (n - k)


-- countGroups_with_max_group_size n maxGroupSize 的意思是：
-- 有 n 個人時，如果每一組最多只能有 maxGroupSize 個人，
-- 總共有幾種分組方法。
countGroups_with_max_group_size :: Int -> Int -> Int

-- 如果已經沒有剩下的人要分組，表示前面那種分法成功了。
-- 所以回傳 1，代表「找到 1 種方法」。
countGroups_with_max_group_size 0 _ = 1

countGroups_with_max_group_size n maxGroupSize

  -- 如果人數變成負的，表示這條路不可能，答案是 0。
  | n < 0 = 0

  -- 如果規定每組最多 0 人或更少，這不合理，所以答案是 0。
  | maxGroupSize <= 0 = 0

  -- 這裡是最重要的地方。
  -- 我們先固定「第 1 個還沒分組的人」。
  -- 然後讓他可以自己一組、跟 1 個人一組、跟 2 個人一組……
  -- 但一組最多不能超過 maxGroupSize 個人。
  | otherwise = sum [

      -- 假設這一組要有 groupSize 個人。
      -- 第 1 個人已經固定在這組裡了，
      -- 所以還要從剩下的 n-1 個人裡，挑 groupSize-1 個人進來。
      choose (n - 1) (groupSize - 1) * countGroups_with_max_group_size (n - groupSize) maxGroupSize

      -- groupSize 會從 1 開始試。
      -- 例如 groupSize = 1，就是第 1 個人自己一組。
      -- groupSize = 2，就是第 1 個人和另一個人一組。
      -- 一直試到「剩下人數」和「最大組人數」之中比較小的那個。
      | groupSize <- [1..min n maxGroupSize]
    ]





-- main 是程式真正開始執行的地方。
main :: IO ()
main = do

  -- 先印出提示文字，請使用者輸入一個人數。
  -- putStrLn "請輸入一個人數，我會算分組的方法總數"

  -- 從鍵盤讀入一行文字。
  input <- getLine

  -- getLine 讀進來的是文字，所以要用 read 轉成整數 Int。
  let n = read input :: Int

  -- 算階乘，看看 n 的階乘是多少。
  let fact = factorial n
  putStrLn $ show n ++ " 的階乘是: " ++ show fact

  -- 把人數交給 countGroups，算出答案。
  -- let result = countGroups n

  -- 把答案印出來。
  -- putStrLn $ "將 " ++ show n ++ " 個人分成若干組的方法總數是: " ++ show result
