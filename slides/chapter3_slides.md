---

# 暸解不同的變數類型（2）
## 輕鬆學習 R 語言

---

# 6 種 {.big}

變數類型

---

# R 語言變數類型

|變數類型|變數類型英文|範例|
|-------|----------|----|
|數值|numeric|2|
|整數|integer|2L|
|邏輯值|logical|TRUE|
|**文字**|character|"Learning R the easy way"|
|**日期**|Date|Sys.Date()|
|**時間**|POSIXct POSIXt|Sys.time()|

---

# 文字

在 R 語言中我們可以使用單引號（'）或雙引號（"）來建立文字（character）

```r
first_name <- 'Tony'
first_name
class(first_name)
```

---

# 日期

```r
sys_date <- Sys.Date() # 系統日期
sys_date # 看起來跟文字相同
class(sys_date)
```

---

# 日期（2）

日期可以被轉換為整數，而文字不行的

```r
sys_date <- Sys.Date()
sys_date_char <- as.character(sys_date) # 創造一個文字類型
as.integer(sys_date)
as.integer(sys_date_char)
```

---

# 日期（3）

R 語言預設以西元 1970 年 1 月 1 日作為 0，在這一天以後的每天都 `+1` 來記錄，而這一天以前的每天都 `-1` 來記錄

```r
date_of_origin <- as.Date("1970-01-01")
as.integer(date_of_origin)
as.integer(date_of_origin + 1)
as.integer(date_of_origin - 1)
date_of_origin
date_of_origin + 1
date_of_origin - 1
```

---

# 時間

```r
sys_time <- Sys.time() # 系統時間
sys_time # 看起來跟文字相同
class(sys_time)
```

---

# 時間（2）

R 語言預設以西元 1970 年 1 月 1 日格林威治標準時間（Greenwich Mean Time，GMT）00 時 00 分 00 秒作為 0，在這個時間點以後的每秒都 `+1` 來記錄，這個時間點以前的每秒都 `-1`

---

# 時間（3）

```r
time_of_origin <- as.POSIXct("1970-01-01 00:00:00", tz = "GMT")
as.integer(time_of_origin)
as.integer(time_of_origin + 1)
as.integer(time_of_origin - 1)
time_of_origin
time_of_origin + 1
time_of_origin - 1
```

# 時間（4）

假如您的電腦和我一樣時區是設在中原標準時間（Chungyuan Standard Time，CST），早格林威治標準時間八個小時（GMT + 8），則基準時間會是西元 1970 年 1 月 1 日 08 時 00 分 00 秒。

```r
time_of_origin_cst <- as.POSIXct("1970-01-01 08:00:00")
as.integer(time_of_origin_cst)
```