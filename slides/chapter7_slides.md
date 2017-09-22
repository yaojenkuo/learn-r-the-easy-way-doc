---

# 把變數集結起來（3）
## 輕鬆學習 R 語言

---

# 三大類型 {.big}
的資料結構

- 一維
    - 向量（vector）
    - 因素向量（factor）
- 二維
    - 矩陣（matrix）
    - 資料框（data.frame）
- **多維**
    - **陣列（array）**
    - **清單（list）**

---

# 陣列

陣列（array）是矩陣的強化版，在一個陣列的物件之中，可以允許我們儲存多個矩陣

```r
my_arr <- array(1:20, dim = c(2, 2, 5))
my_arr
```

---

# 陣列（2）

有了三個維度，在使用索引值選擇時，就需要增加第三個維度的索引值

```r
my_arr <- array(1:20, dim = c(2, 2, 5))
my_arr[, , 1] # 第一個矩陣
my_arr[, , 2] # 第二個矩陣
my_arr[, , 3] # 第三個矩陣
my_arr[, , 4] # 第四個矩陣
my_arr[, , 5] # 第五個矩陣
```

---

# 陣列（3）

```r
my_arr <- array(1:20, dim = c(2, 2, 5))
my_arr[1, 2, 2] # 選出 7
my_arr[1, , 2] # 選出第二個矩陣的第一個 row
my_arr[, 2, 2] # 選出第二個矩陣的第二個 column
```

---

# 清單

清單（list）是一個終極的**巨大容器**，它可以收納所有的 R 語言物件

```r
title <- "Great NBA Teams"
teams <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
winning_percentage <- wins / (wins + losses)
season <- c("1995-96", "2015-16")
wins_losses <- matrix(c(wins, losses), nrow = 2)
df <- data.frame(Teams = teams, Winning_Percentage = winning_percentage, Season = season)
```

---

# 清單（2）

利用 `list()` 函數將其中幾個物件收納到一個 `great_nba_teams` 之中

```r
great_nba_teams <- list(title, teams, wins_losses, df)
great_nba_teams
```

---

# 清單（3）

要選擇清單裡面的物件，使用 `[[]]` 兩層中括號

```r
great_nba_teams[[1]] # 選出清單中的第一個物件
great_nba_teams[[2]] # 選出清單中的第二個物件
great_nba_teams[[3]] # 選出清單中的第三個物件
great_nba_teams[[4]] # 選出清單中的第四個物件
```

---

# 清單（4）

深入選擇出每個物件中的元素

```r
great_nba_teams[[3]][1, ] # 選出芝加哥公牛隊 1995-96 的戰績
great_nba_teams[[4]]$winning_percentage # 選出創紀錄的球季勝率
```

---

# 清單（5）

建立清單的同時，如果指定了物件的命名，就可以在選擇時使用 `$物件名稱`

```r
great_nba_teams <- list(title = title, teams = teams, wins_losses = wins_losses, df = df)
great_nba_teams$teams # 選出 teams 這個向量
great_nba_teams$df # 選出 df 這個資料框
```

---

# 清單（6）

R 語言有很多非常便利的函數，這些函數的輸出多半是一個清單

```r
x <- 1:10
y <- 2 * x + 5
lm_fit <- lm(formula = y ~ x)
lm_fit$coefficients
lm_fit$coefficients[1] # 截距為 5
lm_fit$coefficients[2] # x 係數為 2
```