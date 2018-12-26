import Data.Char

enc 'z' = 'a'
enc 'Z' = 'A'
enc c = chr (ord c + 1)
      
encode s = map enc s

dec 'a' = 'z'
dec 'A' = 'Z'
dec c = chr (ord c - 1) 

decode s = map dec s

main :: IO()
main = do
     contents <- readFile "./encode/input.txt" --將讀到的內容存進一個自訂變數中
     writeFile "./encode/output.txt" (encode contents) --編成密碼後寫入另一檔案
     contents2 <- readFile "./encode/output.txt" --讀編成密碼後的一檔案
     writeFile "./encode/output2.txt" (decode contents2) --解碼後寫入另一檔案