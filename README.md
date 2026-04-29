# haskell-sandbox
這是《普格碼島的水系初心者》範例程式碼，歡迎下載或 fork。

## 第一個程式（建議從這裡開始）

1. 安裝 [Stack](https://docs.haskellstack.org/en/stable/install_and_upgrade/)（會一併準備好 GHC / `runghc` 等工具）。
2. 將本專案 clone 或下載到本機，在終端機進入專案目錄（例如 `haskell-sandbox`）。
3. 執行：

```bash
stack runghc 001.hs
```

程式會印出若干計算結果，並提示輸入一個整數；輸入後會顯示「加 3」的結果。

---

環境與學習資源：

1. [註冊 GitHub 帳號](https://github.com/)
2. [Stack 官方文件](https://docs.haskellstack.org/)（本專案以 Stack 管理編譯器與套件）
3. [安裝 GitHub Desktop](https://desktop.github.com/)
4. [入門指南 Beginner's Online TextBook](http://learnyouahaskell.com/chapters)
5. [入門五步（中文）](https://wiki.haskell.org/Tw/Haskell%E5%85%A5%E9%96%80%E7%9A%845%E5%80%8B%E6%AD%A5%E9%A9%9F)

## 歡迎

安裝好 Stack 後，在專案目錄執行：

```bash
stack runghc welcome.hs
```

即可執行歡迎程式。

## 猜數字

在專案目錄依序執行：

```
cabal update
```

```
cabal install Random
```

```
runghc guessNumber.hs
```

即可玩猜數字小遊戲。
