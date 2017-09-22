---

# 暸解不同的變數類型
## 輕鬆學習 R 語言

---

# 6 種 {.big}

變數類型

---

# R 語言變數類型

|變數類型|變數類型英文|範例|
|-------|----------|----|
|**數值**|numeric|2|
|**整數**|integer|2L|
|**邏輯值**|logical|TRUE|
|文字|character|"Learning R the easy way"|
|日期|Date|Sys.Date()|
|時間|POSIXct POSIXt|Sys.time()|

---

# 使用函數 `class()`

- 讓 R 語言告訴我們輸入的變數是什麼類型

```r
class(2)
class(2L)
class(TRUE)
class("Learning R the easy way")
class(Sys.Date())
class(Sys.time())
```

---

# 賦值

- 符號 `<-` 稱為賦值
- 它的作用是將符號右邊的值指派給符號左邊的物件
- 在 RStudio 中可以按 `alt` 與 `-` 生成 `<-` 符號

```r
my_num <- 2
class(my_num)
```

---

# 數值

不論輸入的數字帶有小數位數或不帶有小數位數，R 語言預設儲存為數值（numeric）

```r
my_num <- 2.33
class(my_num)
my_num <- 2.0
class(my_num)
my_num <- 2
class(my_num)
```

---

# 整數

輸入一個整數並加入 `L`，R 語言就會儲存為整數（integer）

```r
my_int <- 2L
class(my_int)
my_int <- 2.0L
class(my_int)
my_int <- 2.33L
class(my_int)
```

---

# 邏輯值

- 進行**判斷條件**或者**篩選**的時候需要使用邏輯值（logical）
- 邏輯值只有 `TRUE` 與 `FALSE` 這兩個值，或者可以簡寫為 `T` 與 `F`

```r
class(TRUE)
class(FALSE)
class(T)
class(F)
```

---

# 邏輯值（2）

- R 語言對大小寫是敏感的（case-sensitive）

```r
class(TRUE)
class(True)
class(true)
```

---

# 邏輯值（3）

- 透過**判斷條件**得到邏輯值的輸出

```r
8 > 7 # 判斷 8 是否大於 7
8 < 7 # 判斷 8 是否小於 7
8 >= 7 # 判斷 8 是否大於等於 7
8 <= 7 # 判斷 8 是否小於等於 7
8 == 7 # 判斷 8 是否等於 7
8 != 7 # 判斷 8 是否不等於 7
7 %in% c(8, 7) # 判斷 7 是否包含於一個 c(8, 7) 之中
```

---

# 寫作註解

- 在 `#` 符號後面編寫註解，用口語方式告訴別人這段程式在做什麼事情

---

# 常見的判斷運算子

|判斷運算子|作用|
|---------|---|
|`==`|等於|
|`>`|大於|
|`<`|小於|
|`>=`|大於等於|
|`<=`|小於等於|
|`!=`|不等於|
|`%in%`|包含於|

---

# 常見的數學運算子

|數學運算子|作用|
|---------|---|
|`+`|加|
|`-`|減|
|`*`|乘|
|`/`|除|
|`^` 或 `**`|次方|
|`%%`|回傳餘數|

---

# 四則運算

僅有數值的運算：

```r
first_num <- 8
second_num <- 7

first_num + second_num
first_num - second_num
first_num * second_num
first_num / second_num
first_num^second_num
first_num %% second_num
```

---

# 四則運算（2）

僅有整數的運算，注意相除之後 R 語言自動幫我們把答案轉換成了適當類型：

```r
first_int <- 8L
second_int <- 7L

ans <- first_int * second_int
ans
class(ans)
ans <- first_int / second_int
ans
class(ans)
```

---

# 四則運算（3）

納入邏輯值做四則運算：

```r
my_num <- 8
my_int <- 7L
my_logi <- TRUE

ans <- my_num + my_int + my_logi
ans
class(ans)
my_logi <- FALSE
ans <- my_num + my_int + my_logi
ans
class(ans)
```

---

# 四則運算（4）

- 在 R 語言中，`TRUE` 跟 `1` 或者 `1L` 是相等的；`FALSE` 跟 `0` 或者 `0L` 是相等的

```r
my_num <- 0
my_int <- 0L
my_logi <- FALSE
my_num == my_logi
my_int == my_logi
my_num <- 1
my_int <- 1L
my_logi <- TRUE
my_num == my_logi
my_int == my_logi
```