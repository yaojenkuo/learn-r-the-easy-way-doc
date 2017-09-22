# 第 04 天

## 變數類型的判斷與轉換

R 語言針對變數類型的判斷除了使用 `class()` 函數直截了當告訴我們答案以外，也能夠使用一系列 `is.類型名稱()` 的函數回傳邏輯值，用 `TRUE` 或者 `FALSE` 回傳判斷的結果；而變數類型的轉換則是透過一系列 `as.類型名稱()` 的函數進行轉換。

### 變數類型的判斷

除了判斷日期與時間變數類型要使用的是 `inherits()` 函數，其他變數類型都可以使用 `is.類型名稱()`這樣形式的函數判斷。

|函數|範例|
|----|---|
|is.numeric()|is.numeric(7.7)|
|is.integer()|is.integer(7L)|
|is.logical()|is.logical(FALSE)|
|is.character()|is.character("Learn R the easy way")|
|inherits(x, what = "Date")|inherits(Sys.Date(), what = "Date")|
|inherits(x, what = "POSIXct")|inherits(Sys.time(), what = "POSIXct")|

#### 判斷是否為數值

使用 `is.numeric()` 函數請 R 語言判斷這個變數是不是數值。

```r
> is.numeric(8.7)
[1] TRUE
> is.numeric("8.7")
[1] FALSE
```

#### 判斷是否為整數

使用 `is.integer()` 函數請 R 語言判斷這個變數是不是整數。

```r
> is.integer(7L)
[1] TRUE
> is.integer(7)
[1] FALSE
```

#### 判斷是否為邏輯值

使用 `is.logical()` 函數請 R 語言判斷這個變數是不是邏輯值。

```r
> is.logical(FALSE)
[1] TRUE
> is.logical("FALSE")
[1] FALSE
```

#### 判斷是否為文字

使用 `is.character()` 函數請 R 語言判斷這個變數是不是文字。

```r
> is.character("TRUE")
[1] TRUE
> is.character(TRUE)
[1] FALSE
```

#### 判斷是否為日期

使用 `inherit(x, what = "Date")` 函數請 R 語言判斷這個變數 x 是不是日期，`Sys.Date()` 是一個 `Date` 的類型，因此 `inherit(Sys.Date(), what = "Date")` 函數會回傳 `TRUE`；而 `"1970-01-01"` 是一個 `Character` 的類型，`inherit("1970-01-01", what = "Date")` 函數會回傳 `FALSE`。

```r
> inherits(Sys.Date(), what = "Date") # Sys.Date() 是日期類型
[1] TRUE
> inherits("1970-01-01", what = "Date") # "1970-01-01" 是文字類型
[1] FALSE
```

#### 判斷是否為時間

使用 `inherit(x, what = "POSIXct")` 函數請 R 語言判斷這個變數 x 是不是時間，`Sys.time()` 是一個 `POSIXct` 的類型，因此 `inherit(Sys.time(), what = "POSIXct")` 函數會回傳 `TRUE`；而 `"1970-01-01 00:00:00"` 是一個 `Character` 的類型，`inherit("1970-01-01 00:00:00", what = "POSIXct")` 函數會回傳 `FALSE`。

```r
> inherits(Sys.time(), what = "POSIXct") # Sys.time() 是時間類型
[1] TRUE
> inherits("1970-01-01 00:00:00", what = "POSIXct") # "1970-01-01 00:00:00" 是文字類型
[1] FALSE
```

### 變數類型的轉換

使用 `as.類型名稱()` 這樣形式的函數進行轉換。

|函數|範例|
|----|---|
|as.numeric()|as.numeric(7L)|
|as.integer()|as.integer(7)|
|as.logical()|as.logical("TRUE")|
|as.character()|as.character(Sys.Date())|
|as.Date()|as.Date("1970-01-01")|
|as.POSIXct()|as.POSIXct("1970-01-01 00:00:00", tz = "GMT")|

#### 轉換成數值

使用 `as.numeric()` 函數轉換變數為數值類型，我們可以輸入整數、邏輯值、日期或時間讓 R 語言轉換成數值。

```r
> as.numeric(7L)
[1] 7
> as.numeric(TRUE)
[1] 1
> as.numeric(FALSE)
[1] 0
> as.numeric(Sys.Date())
[1] 17223
> as.numeric(Sys.time())
[1] 1488088428
```

#### 轉換成整數

使用 `as.integer()` 函數轉換變數為數值類型，我們可以輸入沒有小數位數的數值、邏輯值、日期或時間讓 R 語言轉換成整數。

```r
> as.integer(7)
[1] 7
> as.integer(TRUE)
[1] 1
> as.integer(FALSE)
[1] 0
> as.integer(Sys.Date())
[1] 17223
> as.integer(Sys.time())
[1] 1488088344
```

#### 轉換成邏輯值

使用 `as.logical()` 函數轉換變數為邏輯值類型，輸入數值或整數類型的 `0` 會轉換成為 `FALSE`，其他的數字則一律轉換為 `TRUE`。

```r
> as.logical(0)
[1] FALSE
> as.logical(0L)
[1] FALSE
> as.logical(1L)
[1] TRUE
> as.logical(-1.3)
[1] TRUE
> as.logical(87)
[1] TRUE
```

輸入文字類型的 `"TRUE"`、`"True"` 或 `"true"` 則會轉換成為 `TRUE`，反之亦同。

```r
> as.logical("TRUE")
[1] TRUE
> as.logical("True")
[1] TRUE
> as.logical("true")
[1] TRUE
> as.logical("FALSE")
[1] FALSE
> as.logical("False")
[1] FALSE
> as.logical("false")
[1] FALSE
```

#### 轉換成文字

使用 `as.character()` 函數轉換變數為文字類型，我們可以輸入任意的變數類型讓 R 語言轉換成文字。

```r
> as.character(8.7)
[1] "8.7"
> as.character(87L)
[1] "87"
> as.character(TRUE)
[1] "TRUE"
> as.character(Sys.Date())
[1] "2017-02-25"
> as.character(Sys.time())
[1] "2017-02-25 20:22:32"
```

#### 轉換成日期

使用 `as.Date()` 函數轉換變數為日期類型，我們可以輸入文字讓 R 語言轉換成日期。`as.Date()` 函數預設可以識別 `%Y-%m-%d` 或 `%Y/%m/%d` 這兩種格式。

```r
> as.Date("1970-01-01")
[1] "1970-01-01"
> as.Date("1970/01/01")
[1] "1970-01-01"
```

如果是其他的格式，必須要加入 `format` 參數告知日期被記錄的文字格式為何，函數才能順利轉換，例如文字不是預設的格式，而是將月與日的資訊寫在年份的前面，沒有以 `format` 參數指定就會轉換成錯誤的日期：

```r
> as.Date("01-01-1970") # 轉換錯誤
[1] "0001-01-19"
> as.Date("01-01-1970", format = "%m-%d-%Y") # 轉換正確
[1] "1970-01-01"
> as.Date("01/01/70") # 不是預設格式，轉換失敗
Error in charToDate(x) : 
  character string is not in a standard unambiguous format
> as.Date("01/01/70", format = "%m/%d/%y") # 轉換正確
[1] "1970-01-01"
```

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

#### 轉換成時間

使用 `as.POSIXct()` 函數轉換變數為時間類型，我們可以輸入文字讓 R 語言轉換成時間。如果沒有指定參數 `tz = `會預設使用電腦的時區。

```r
> as.POSIXct("1970-01-01 00:00:00")
[1] "1970-01-01 08:00:00 CST"
> as.POSIXct("1970-01-01 00:00:00", tz = "GMT")
[1] "1970-01-01 GMT"
```

### 小結

第四天我們學會了如何判斷 R 語言的基本變數類型以及如何在變數類型之間進行轉換。

### 練習題

###### 1. 1999 年 9 月 21 日 1 時 47 分 16 秒發生震央位於南投縣集集鎮，芮氏規模 7.3 的地震，請以文字記錄這個時間，並將它指派給 `major_quake_time`

```r
major_quake_time <- "___"
```

###### 2. 1999 年 9 月 21 日 1 時 57 分 15 秒發生第一個芮氏規模超過 6 的餘震，請以文字記錄這個時間，並將它指派給 `first_aftershock_time`

```r
first_aftershock_time <- "___"
```

###### 3. 請將前兩題的生成的變數轉換為時間類型，計算間隔多久發生第一個芮氏規模超過 6 的餘震

```r
major_quake_time <- as.POSIXct(___)
first_aftershock_time <- as.POSIXct(___)
___ - ___
```

### 延伸資訊

- [Dates and Times in R](https://www.stat.berkeley.edu/~s133/dates.html)
- [Quick-R](http://www.statmethods.net/input/dates.html)
- [921大地震](https://zh.wikipedia.org/wiki/921%E5%A4%A7%E5%9C%B0%E9%9C%87)