---

# 把變數集結起來（2）
## 輕鬆學習 R 語言

---

# 三大類型 {.big}
的資料結構

- 一維
    - 向量（vector）
    - 因素向量（factor）
- **二維**
    - **矩陣（matrix）**
    - **資料框（data.frame）**
- 多維
    - 陣列（array）
    - 清單（list）

---

# 矩陣

- 矩陣是能夠儲存列（Row）與欄（Column）的資料結構
- 建立一個 2x3 的矩陣

```r
my_mat <- matrix(1:6, nrow = 2)
my_mat
class(my_mat)
```

---

# 矩陣（2）

`matrix()` 函數還有一個 `byrow` 的參數可以指定要用什麼順序擺放原先在向量中的元素

```r
my_mat <- matrix(1:6, nrow = 2, byrow = TRUE)
my_mat
```

---

# 矩陣（3）

- 同樣能夠以 `[]` 搭配索引值選出裡面的變數
- 用 `[m, n]` 兩個索引值來搭配選擇

```r
my_mat <- matrix(1:6, nrow = 2)
my_mat
my_mat[2, 3] # 選出位於（2, 3）這個位置的 6
my_mat[2, ] # 選出所有第二列（2nd row）的元素
my_mat[, 3] # 選出所有第三欄（2nd column）的元素
```

---

# 矩陣（4）

透過**判斷運算子**來對矩陣進行篩選，選出介於 1 與 6 之間的數字

```r
my_mat <- matrix(1:6, nrow = 2)
filter <- my_mat < 6 & my_mat > 1
my_mat[filter]
```

---

# 矩陣（5）

- 矩陣與向量相似，就是包含**一種**變數類型
- 假如將數值與邏輯值一同放入矩陣，則邏輯值亦會被自動轉換成數值

```r
my_mat <- matrix(c(1, 2, TRUE, FALSE, 3, 4), nrow = 2)
my_mat
class(my_mat[, 2]) # 原本第二欄（2nd column）的輸入是兩個邏輯值
```

---

# 資料框

- 資料框絕對是最需要關注的一種資料結構
- 運用 `data.frame()` 函數手動創造資料框

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)
View(great_nba_teams)
```

---

# 資料框（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch6/ch601.png)

---

# 資料框（3）

- 習慣使用觀測值（Observations，Obs）來稱呼資料框中水平方向的資料
- 使用變數（Variables）來稱呼資料框中垂直方向的資料

|資料方向|矩陣|資料框|
|-------|----|-----|
|水平|Rows|Observations|
|垂直|Columns|Variables|

---

# 資料框（4）

資料框同樣以 `[m, n]` 兩個索引值來搭配選擇出變數

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)
great_nba_teams[1, 1] # 選出第一個變數的第一個觀測值 "Chicago Bulls"
great_nba_teams[1, ] # 選出第一個觀測值
great_nba_teams[, 1] # 選出第一個變數
```

---

# 資料框（5）

資料框支援使用**變數名稱**來選擇，我們可以用 `$變數名稱` 或者 `[, "變數名稱"]` 這兩種寫法

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")
 
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season, stringsAsFactors = FALSE)
great_nba_teams$team_name
great_nba_teams[, "season"]
```

---

# 資料框（6）

透過**判斷運算子**來對資料框進行篩選，選出最終有獲得總冠軍的隊伍

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")
 
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season, stringsAsFactors = FALSE)
filter <- great_nba_teams$is_champion == TRUE
great_nba_teams[filter, ] # 注意這個逗號
```

---

# 資料框（7）

資料框能包含**多種**變數類型

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season, stringsAsFactors = FALSE)
str(great_nba_teams)
```