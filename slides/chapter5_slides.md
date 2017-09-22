---

# 把變數集結起來
## 輕鬆學習 R 語言

---

# 三大類型 {.big}
的資料結構

- **一維**
    - **向量（vector）**
    - **因素向量（factor）**
- 二維
    - 矩陣（matrix）
    - 資料框（data.frame）
- 多維
    - 陣列（array）
    - 清單（list）

---

# 向量

使用 `c()` 函數將我們想要放入的任意變數集結在一個向量之中

```r
weekends <- c("Saturday", "Sunday")
my_lucky_numbers <- c(7L, 24L)
weekends
my_lucky_numbers
```

---

# 向量（2）

可以使用 `[3]` 這個索引值選出秋天

```r
four_seasons <- c("spring", "summer", "autumn", "winter")
favorite_season <- four_seasons[3]
favorite_season
```

---

# 向量（3）

夏天太熱、冬天太冷，不要放在喜歡的季節中，可以使用 `[c(-2, -4)]` 刪去

```r
four_seasons <- c("spring", "summer", "autumn", "winter")
favorite_seasons <- four_seasons[c(-2, -4)]
favorite_seasons
```

---

# 向量（4）

只能包含
一種 {.big}
變數類型

```r
lucky_numbers <- c(7L, 24)
class(lucky_numbers[1])
```

---

# 向量（5）

將邏輯值跟整數放入同一個向量之中，那麼向量會將邏輯值轉換成整數

```r
lucky_numbers <- c(7L, FALSE)
lucky_numbers
class(lucky_numbers[2])
```

---

# 向量（6）

將邏輯值、整數、數值還有文字放入同一個向量之中，那麼向量會全部轉換成文字

```r
mixed_vars <- c(TRUE, 7L, 24, "spring")
mixed_vars
class(mixed_vars[1])
class(mixed_vars[2])
class(mixed_vars[3])
```

---

# 向量（7）

利用**判斷運算子**來對向量進行篩選

```r
four_seasons <- c("spring", "summer", "autumn", "winter")
my_favorite_season <- four_seasons == "autumn"
four_seasons[my_favorite_season]
```

---

# 向量（8）

不只一個條件，我們可以使用 **&（AND）** 以及 **|（OR）** 這兩個符號連結判斷條件

```r
four_seasons <- c("spring", "summer", "autumn", "winter")
my_favorite_seasons <- four_seasons == "spring" | four_seasons == "autumn" # 我喜歡春天或秋天
four_seasons[my_favorite_seasons]
```

---

# 向量（9）

透過 `rep()` 函數、`seq()` 函數與 `:` 快速產生向量

```r
rep(7L, times = 8)
rep("R", times = 10)
seq(from = 7, to = 77, by = 7)
seq(from = 1, to = 10, by = 1)
1:10
11:20
```

---

# 因素向量

- 針對儲存文字的向量有一個特殊的資料結構稱為因素向量（factor）
- 是一個帶有層級（Levels）資訊的向量
- 使用 `factor()` 函數可以將向量轉換成因素向量

---

# 因素向量（2）

輸出因素向量時會將層級的資訊輸出

```r
four_seasons <- c("spring", "summer", "autumn", "winter")
four_seasons
four_seasons_factor <- factor(four_seasons)
four_seasons_factor
```

---

# 因素向量（3）

轉換為因素向量時利用 `ordered = TRUE` 與 `levels = ` 的參數來排列一下對於四個季節的喜好

```r
four_seasons <- c("spring", "summer", "autumn", "winter")
four_seasons_factor <- factor(four_seasons, ordered = TRUE, levels = c("summer", "winter", "spring", "autumn"))
four_seasons_factor
```

---

# 因素向量（4）

有排序的因素向量適合用在有順序的文字，像是形容溫度的文字

```r
temperatures <- c("warm", "hot", "cold")
temp_factors <- factor(temperatures, ordered = TRUE, levels = c("cold", "warm", "hot"))
temp_factors
```

# 因素向量（5）

假如只有指定 `ordered = TRUE` 但沒有指定 `levels = `，R 語言會預設使用字母順序排序，可能就會產生不符合直覺的排序

```r
temperatures <- c("warm", "hot", "cold")
temp_factors <- factor(temperatures, ordered = TRUE)
temp_factors
```