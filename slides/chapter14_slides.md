---

# 資料處理技巧
## 輕鬆學習 R 語言

---

# 解構為單一變數值

取出內建資料集 `iris` 第一筆觀測值的第五個變數（Species）的值

```r
iris[1, 5]
iris[1, "Species"]
```

---

# 解構為向量

取出內建資料集 `iris` 的某一個變數

```r
iris$Sepal.Length # 亦可以寫作 iris[, "Sepal.Length"]
```

---

# 解構為較小的資料框

透過指定 `[m, n]` 中的索引值取出前六個觀測值與其中三個變數

```r
iris[1:6, c("Sepal.Length", "Petal.Length", "Species")]
```

---

# 解構為較小的資料框（2）

或者利用邏輯值判斷選擇部分的資料框, 這也是實務上較常使用的方式

```r
iris[iris$Petal.Length >= 6, c("Sepal.Length", "Petal.Length", "Species")]
```

---

# 解構為較小的資料框（3）

使用更多的邏輯值判斷，可以使用 `&`（and）或者 `|`（or）這樣的運算子連結判斷條件

```r
filter <- (iris$Petal.Length >= 6) & (iris$Sepal.Length >= 7.5)
iris[filter, c("Sepal.Length", "Petal.Length", "Species")]
```

---

# 新增一個變數

直接將新的向量指派給既有的資料框：

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)

# 既有的資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion)

# 新增一個變數
season <- c("1995-96", "2015-16")
great_nba_teams$season <- season
great_nba_teams
```

---

# 新增一個衍生的變數

直接將計算後的向量指派給既有的資料框

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
 
# 既有的資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion)

# 新增一個衍生變數
great_nba_teams$winning_percentage <- great_nba_teams$wins / (great_nba_teams$wins + great_nba_teams$losses)
great_nba_teams
```

---

# 刪除變數

將欲刪除的變數指派為 `NULL`

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)

# 既有的資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion)

# 刪除變數
great_nba_teams$is_champion <- NULL
great_nba_teams
```

---

# 新增觀測值

先將屬於**因素向量**的變數轉換回文字，再使用 `rbind()` 函數

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框，選擇不要將文字變數記錄為因素向量
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season, stringsAsFactors = FALSE)
 
# 新增觀測值
lakers_7172 <- c("Los Angeles Lakers", 69, 13, TRUE, "1971-72")
great_nba_teams <- rbind(great_nba_teams, lakers_7172)
great_nba_teams
```

---

# 刪除觀測值

與解構資料框的方式相同

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)

# 刪除觀測值
great_nba_teams <- great_nba_teams[-2, ]
great_nba_teams
```

---

# 重新命名變數

利用 `names()` 函數為資料框的變數重新命名

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)
# 重新命名 team_name 為 team
names(great_nba_teams)[1] <- "team"
great_nba_teams
```

---

### 調整變數的位置

調整變數位置為：`season`、`is_champion`、`wins`、`losses` 與 `team_name`。

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)

# 調整變數的位置
great_nba_teams <- great_nba_teams[, c("season", "is_champion", "wins", "losses", "team_name")]
great_nba_teams
```

---

# 對類別變數重新編碼

將 `great_nba_teams$is_champion` 的邏輯值重新編碼為 `"Y"` 與 `"N"`：

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)

# 重新編碼
great_nba_teams$is_champion[great_nba_teams$is_champion == TRUE] <- "Y"
great_nba_teams$is_champion[great_nba_teams$is_champion == FALSE] <- "N"
great_nba_teams
```

---

# 對數值變數重新編碼為類別變數

利用 `cut()` 函數將 `straw_hat_df$age` 的數值重新編碼為 `"20 歲以下"`、`"超過 20 歲但 30 歲以下"` 與 `"超過 30 歲"`

```r
# 既有的資料框
name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, age)

# 將 straw_hat_df$age 重新編碼
straw_hat_df$age_category <- cut(straw_hat_df$age, breaks = c(0, 20, 30, Inf), labels = c("20 歲以下", "超過 20 歲但 30 歲以下", "超過 30 歲"))
straw_hat_df
```

---

# 垂直合併

垂直合併使用 `rbind()` 函數

```r
cars_upper <- cars[1:25, ]
cars_bottom <- cars[26:50, ]

cars_combined <- rbind(cars_upper, cars_bottom)
```

---

# 水平合併

單純的水平合併使用 `cbind()` 函數

```r
cars_left <- cars[, 1]
cars_right <- cars[, 2]

cars_combined <- cbind(cars_left, cars_right)
```

---

# `merge()` 函數

預設是保留左右資料框的交集

```r
# 左邊的資料框
name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "多尼多尼·喬巴")
age <- c(19, 21, 20, 17)
left_df <- data.frame(name, age)

# 右邊的資料框
name <- c("蒙其·D·魯夫", "多尼多尼·喬巴", "妮可·羅賓")
devil_fruit <- c("橡膠果實", "人人果實", "花花果實")
right_df <- data.frame(name, devil_fruit)

# 合併後的資料框
merged_df <- merge(left_df, right_df)
merged_df
```

---

# `merge()` 函數（2）

- 保留所有**左邊**資料框的觀測值，可以指定參數 `all.x = TRUE`
- 右邊資料框對應不到部分，就會以遺漏值 `NA` 呈現

```r
# 合併後的資料框
merged_df <- merge(left_df, right_df, all.x = TRUE)
merged_df
```

---

# `merge()` 函數（3）

- 保留所有**右邊**資料框的觀測值，我們可以指定參數 `all.y = TRUE`
- 左邊資料框對應不到部分，就會以遺漏值 `NA` 呈現

```r
merged_df <- merge(left_df, right_df, all.y = TRUE)
merged_df
```

---

# `merge()` 函數（4）

- 保留**兩邊**資料框的觀測值，我們可以指定參數 `all.x = TRUE` 與 `all.y = TRUE`
- 對應不到部分一樣會以遺漏值 `NA` 呈現

```r
# 合併後的資料框
merged_df <- merge(left_df, right_df, all.x = TRUE, all.y = TRUE)
merged_df
```

# `merge()` 函數（5）

左邊與右邊資料框用來作為對照依據的變數都取名為 `name`，所以 `merge()` 函數會自動辨認，但是當取名不同的時候，就會出現所謂的**笛卡爾連接（Cartesian Join）**

```r
# 左邊的資料框
name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "多尼多尼·喬巴")
age <- c(19, 21, 20, 17)
left_df <- data.frame(name, age)

# 右邊的資料框
character <- c("蒙其·D·魯夫", "多尼多尼·喬巴", "妮可·羅賓")
devil_fruit <- c("橡膠果實", "人人果實", "花花果實")
right_df <- data.frame(character, devil_fruit)

# 合併後的資料框
merged_df <- merge(left_df, right_df)
merged_df
```

---

# `merge()` 函數（6）

只要加入 `by.x = "name"` 與 `by.y = "character"` 就可以解決

```r
# 合併後的資料框
merged_df <- merge(left_df, right_df, by.x = "name", by.y = "character")
merged_df
```