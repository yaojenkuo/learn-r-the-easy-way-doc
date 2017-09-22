---

# 函數
## 輕鬆學習 R 語言

---

# 數值函數 {.big}

---

# `abs()` 函數

`abs()` 是能夠將我們輸入的數值轉換為絕對值的函數，它的作用跟 $$| |$$ 相同

```r
abs(-5)
abs(-5:-1)
abs("Hello")
```

---

# `sqrt()` 函數

`sqrt()` 是能夠將我們輸入的數值開根號的函數

```r
sqrt(2)
sqrt(1:10)
```

---

# `ceiling()` 函數

`ceiling()` 是能夠將輸入的數值無條件進位的函數

```r
ceiling(9.527)
nums <- sqrt(c(7, 17, 27, 37, 47))
nums
ceiling(nums)
```

---

# `floor()` 函數

`floor()` 是能夠將輸入的數值無條件捨去的函數

```r
floor(9.527)
nums <- sqrt(c(7, 17, 27, 37, 47))
nums
floor(nums)
```

---

# `round()` 函數

`round()` 是能夠指定保留幾個小數位數的函數，以四捨五入的規則決定

```r
round(9.527)
round(9.527, digits = 0)
round(9.527, digits = 1)
round(9.527, digits = 2)
```

---

# `exp()` 函數

`exp()` 是能夠將輸入的數值 `x` 轉換為 $$e^x$$ 的函數（其中 $$e$$ = 2.718282）

```r
exp(1)
exp(2)
```

---

# `log()` 函數

`log()` 是能夠將輸入的數值取自然對數（Natural logarithm）的函數，它的作用跟 $$\ln$$ 相同

```r
log(exp(1))
log(exp(2))
log(exp(3))
```

---

# `log10()` 函數

`log10()` 是能夠將輸入的數值取 10 為底對數（Logarithm）的函數，它的作用跟 $$\log_{10}$$ 相同

```r
log10(10)
log10(10^2)
log10(10^3)
```

---

# 文字函數 {.big}

---

# `toupper()` 函數

`toupper()` 是能夠將輸入的文字全部轉換為大寫的函數

```r
toupper("Learn R the easy way")
```

---

# `tolower()` 函數

`tolower()` 是能夠將輸入的文字全部轉換為小寫的函數

```r
tolower("Learn R the easy way")
```

---

# `substr()` 函數

- `substr()` 是能夠將輸入的文字擷取部分出來的函數
- `start` 指定要從哪一個位置開始擷取，`stop` 指定要擷取到哪一個位置停下來

```r
my_char <- "Learn R the easy way"
substr(my_char, start = 1, stop = 5)
substr(my_char, start = 7, stop = 7)
substr(my_char, start = 9, stop = 11)
substr(my_char, start = 13, stop = 16)
substr(my_char, start = 18, stop = 20)
```

---

# `grep()` 函數

`grep()` 是能夠在文字向量中搜尋某種樣式並將符合樣式的索引值回傳的函數

```r
my_char <- c("Learn", "R", "the", "easy", "way")
grep(pattern = "Learn", my_char)
grep(pattern = "R", my_char)
grep(pattern = "the", my_char)
grep(pattern = "easy", my_char)
grep(pattern = "way", my_char)
grep(pattern = "xyz", my_char)
```

---

# `grep()` 函數（2）

`grep()` 可以指定參數 `ignore.case` 為 TRUE，這樣在搜尋樣式的時候會忽略文字的大小寫

```r
my_char <- c("Learn", "R", "the", "easy", "way")
grep(pattern = "learn", my_char)
grep(pattern = "learn", my_char, ignore.case = TRUE)
```

---

# `sub()` 函數

`sub()` 可以搜尋到指定樣式以後指定替換為其他的文字

```r
my_char <- c("Learn", "R", "the", "easy", "way")
sub(pattern = "easy", replacement = "effortless", my_char)
```

---

# `strsplit()` 函數

`strsplit()` 是能夠將一個文字切割成向量的函數

```r
my_char <- "Learn R the easy way"
strsplit(my_char, split = " ") # 使用一個空格作為切割的根據
my_char <- "Learn,R,the,easy,way"
strsplit(my_char, split = ",") # 使用一個逗號作為切割的根據
```

---

# `paste()` 函數

`paste()` 是能夠將文字連結起來的函數

```r
char_1 <- "Learn"
char_2 <- "R"
char_3 <- "the"
char_4 <- "easy"
char_5 <- "way"
 
paste(char_1, char_2, char_3, char_4, char_5)
paste(char_1, char_2, char_3, char_4, char_5, sep = ",")
paste(char_1, char_2, char_3, char_4, char_5, sep = "")
```

---

# 描述統計函數 {.big}

---

# `mean()` 函數

`mean()` 是能夠將輸入數值向量的平均值回傳的函數

```r
my_seq <- 1:5
mean(my_seq)
my_seq <- c(my_seq, NA) # 加入一個 NA
mean(my_seq) # 輸出為 NA
mean(my_seq, na.rm = TRUE) # 排除遺漏值
```

---

# `sd()` 函數

`sd()` 是能夠將輸入數值向量的標準差回傳的函數

```r
my_seq <- 1:5
sd(my_seq)
my_seq <- c(my_seq, NA) # 加入一個 NA
sd(my_seq)
sd(my_seq, na.rm = TRUE) # 排除遺漏值
```

---

# `median()` 函數

`median()` 是能夠將輸入數值向量的中位數回傳的函數

```r
my_seq <- 1:5
median(my_seq)
my_seq <- c(my_seq, NA) # 加入一個 NA
median(my_seq)
median(my_seq, na.rm = TRUE) # 排除遺漏值
```

---

# `range()` 函數

`range()` 是能夠將輸入數值向量的最大值與最小值回傳的函數

```r
my_seq <- 1:5
range(my_seq)
my_seq <- c(my_seq, NA) # 加入一個 NA
range(my_seq)
range(my_seq, na.rm = TRUE) # 排除遺漏值
```

---

# `sum()` 函數

`sum()` 是能夠將輸入數值向量所有數值加總回傳的函數

```r
my_seq <- 1:5
sum(my_seq)
my_seq <- c(my_seq, NA) # 加入一個 NA
sum(my_seq)
sum(my_seq, na.rm = TRUE) # 排除遺漏值
```

---

# `max()` 函數

`max()` 是能夠將輸入數值向量的最大值回傳的函數

```r
my_seq <- 1:5
max(my_seq)
my_seq <- c(my_seq, NA) # 加入一個 NA
max(my_seq)
max(my_seq, na.rm = TRUE) # 排除遺漏值
```

---

# `min()` 函數

`min()` 是能夠將輸入數值向量的最小值回傳的函數

```r
my_seq <- 1:5
min(my_seq)
my_seq <- c(my_seq, NA) # 加入一個 NA
min(my_seq)
min(my_seq, na.rm = TRUE) # 排除遺漏值
```