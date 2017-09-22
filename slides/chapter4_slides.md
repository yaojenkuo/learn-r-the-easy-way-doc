---

# 變數類型的判斷與轉換
## 輕鬆學習 R 語言

---

# 變數類型的判斷與轉換

- 使用一系列 `is.類型名稱()` 函數回傳判斷結果
- 使用一系列 `as.類型名稱()` 函數回傳轉換結果

---

# 變數類型的判斷

- 判斷日期與時間變數類型要使用的是 `inherits()` 函數

|函數|範例|
|----|---|
|`is.numeric()`|`is.numeric(7.7)`|
|`is.integer()`|`is.integer(7L)`|
|`is.logical()`|`is.logical(FALSE)`|
|`is.character()`|`is.character("Learn R the easy way")`|
|`inherits(x, what = "Date")`|`inherits(Sys.Date(), what = "Date")`|
|`inherits(x, what = "POSIXct")`|`inherits(Sys.time(), what = "POSIXct")`|

---

# 判斷是否為數值

使用 `is.numeric()` 函數請 R 語言判斷這個變數是不是數值

```r
is.numeric(8.7)
is.numeric("8.7")
```

---

# 判斷是否為整數

使用 `is.integer()` 函數請 R 語言判斷這個變數是不是整數

```r
is.integer(7L)
is.integer(7)
```

---

# 判斷是否為邏輯值

使用 `is.logical()` 函數請 R 語言判斷這個變數是不是邏輯值

```r
is.logical(FALSE)
is.logical("FALSE")
```

---

# 判斷是否為文字

使用 `is.character()` 函數請 R 語言判斷這個變數是不是文字。

```r
is.character("TRUE")
is.character(TRUE)
```

---

# 判斷是否為日期

- `Sys.Date()` 是一個 `Date` 的類型，因此 `inherit(Sys.Date(), what = "Date")` 函數會回傳 `TRUE`
- `"1970-01-01"` 是一個 `Character` 的類型，`inherit("1970-01-01", what = "Date")` 函數會回傳 `FALSE`

```r
inherits(Sys.Date(), what = "Date") # Sys.Date() 是日期類型
inherits("1970-01-01", what = "Date") # "1970-01-01" 是文字類型
```

---

# 判斷是否為時間

- `Sys.time()` 是一個 `POSIXct` 的類型，因此 `inherit(Sys.time(), what = "POSIXct")` 函數會回傳 `TRUE`
- `"1970-01-01 00:00:00"` 是一個 `Character` 的類型，`inherit("1970-01-01 00:00:00", what = "POSIXct")` 函數會回傳 `FALSE`

```r
inherits(Sys.time(), what = "POSIXct") # Sys.time() 是時間類型
inherits("1970-01-01 00:00:00", what = "POSIXct") # "1970-01-01 00:00:00" 是文字類型
```

---

# 變數類型的轉換

使用 `as.類型名稱()` 這樣形式的函數進行轉換

|函數|範例|
|----|---|
|`as.numeric()`|`as.numeric(7L)`|
|`as.integer()`|`as.integer(7)`|
|`as.logical()`|`as.logical("TRUE")`|
|`as.character()`|`as.character(Sys.Date())`|
|`as.Date()`|`as.Date("1970-01-01")`|
|`as.POSIXct()`|`as.POSIXct("1970-01-01 00:00:00", tz = "GMT")`|

---

# 轉換成數值

我們可以輸入整數、邏輯值、日期或時間讓 R 語言轉換成數值

```r
as.numeric(7L)
as.numeric(TRUE)
as.numeric(FALSE)
as.numeric(Sys.Date())
as.numeric(Sys.time())
```

---

# 轉換成整數

我們可以輸入沒有小數位數的數值、邏輯值、日期或時間讓 R 語言轉換成整數

```r
as.integer(7)
as.integer(TRUE)
as.integer(FALSE)
as.integer(Sys.Date())
as.integer(Sys.time())
```

---

# 轉換成邏輯值

輸入數值或整數類型的 `0` 會轉換成為 `FALSE`，其他的數字則一律轉換為 `TRUE`

```r
as.logical(0)
as.logical(0L)
as.logical(1L)
as.logical(-1.3)
as.logical(87)
```

---

# 轉換成邏輯值（2）

輸入文字類型的 `"TRUE"`、`"True"` 或 `"true"` 則會轉換成為 `TRUE`，反之亦同

```r
as.logical("TRUE")
as.logical("True")
as.logical("true")
as.logical("FALSE")
as.logical("False")
as.logical("false")
```

---

# 轉換成文字

我們可以輸入任意的變數類型讓 R 語言轉換成文字

```r
as.character(8.7)
as.character(87L)
as.character(TRUE)
as.character(Sys.Date())
as.character(Sys.time())
```

---

# 轉換成日期

我們可以輸入文字讓 R 語言轉換成日期。`as.Date()` 函數預設可以識別 `%Y-%m-%d` 或 `%Y/%m/%d` 這兩種格式

```r
as.Date("1970-01-01")
as.Date("1970/01/01")
```

---

# 轉換成日期（2）

其他的格式，必須要加入 `format` 參數告知日期被記錄的文字格式為何

```r
as.Date("01-01-1970") # 轉換錯誤
as.Date("01-01-1970", format = "%m-%d-%Y") # 轉換正確
as.Date("01/01/70") # 不是預設格式，轉換失敗
as.Date("01/01/70", format = "%m/%d/%y") # 轉換正確
```

---

# 轉換成日期（3）

不同符號所代表的格式整理在下表：

|符號|格式|範例|
|---|----|---|
|%d|日|01|
|%a|禮拜幾的縮寫|Mon|
|%A|禮拜幾|Monday|
|%m|月|01|
|%b|月名稱的縮寫|Jan|
|%B|月名稱|January|
|%y|兩位數的年|70|
|%Y|四位數的年|1970|

---

# 轉換成時間

我們可以輸入文字讓 R 語言轉換成時間。如果沒有指定參數 `tz = `會預設使用電腦的時區

```r
as.POSIXct("1970-01-01 00:00:00")
as.POSIXct("1970-01-01 00:00:00", tz = "GMT")
```