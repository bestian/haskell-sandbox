# haskell-sandbox
這是《普格碼島的水系初心者》範例程式碼
歡迎下載或是fork me on github
請安裝ghci之後，直接執行。

1. [註冊github帳號](https://github.com/)
2. [安裝單機開發環境Install Haskell Platform](https://www.haskell.org/platform/)
3. [安裝github桌機版](https://desktop.github.com/)
4. [入門指南Beginner's Online TextBook ](http://learnyouahaskell.com/chapters)
5. [入門五步(中文)](https://wiki.haskell.org/Tw/Haskell%E5%85%A5%E9%96%80%E7%9A%845%E5%80%8B%E6%AD%A5%E9%A9%9F)

## 歡迎
安裝好開發環境後，請下載本專案，之後以命令列進入專案目錄，再輸入：
```runghc welcome.hs```
即可執行第一個歡迎程式。

## 猜數字
以命令列進入專案目錄，再輸入：
```
cabal update
```
```
cabal install Random
```
```
runghc guessNumber.hs
```
即可玩猜數字小遊戲
