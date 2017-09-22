# 第 10 天

## 自訂函數

我們在**函數**章節學習了很多 R 語言針對數值、文字與描述性統計的內建函數，既然函數對我們的重要性這麼高，您有沒有想過自己撰寫函數來滿足特殊的需求呢？比如說，針對手邊雜亂無章的資料，撰寫一個叫做 `clean_data()` 函數，只要呼叫它，就能夠回傳您想要的資料樣式。聽起來真是令人心動，我們趕快來瞭解一下如何自訂函數。

### 自訂函數的外觀架構

一個自訂函數的外觀架構長得像這個樣子：

```r
function_name <- function(輸入1, 輸入2, ..., 輸入 n, 參數1, 參數2, ..., 參數 n){
    # 呼叫函數後執行的程式
    return(輸出)
}
```

首先要給函數取個名字（`function_name`），告訴 R 語言這是一個函數的物件（`function(...)`），接著在小括號中放入想好的輸入（inputs）與參數（parameters），然後在大括號內縮排撰寫我們主要的程式，最後把輸出結果放在 `return()` 函數裡面。

我們很快地來實作第一個自訂函數，它的作用是將輸入的數字平方之後回傳，我們就叫它 `my_squared()` 函數。記得在撰寫多行且具有縮排的程式時候，我們都應該使用左上角的來源（Source）區塊編寫比較方便：

![圖 10-1 my_squared() 函數](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch10/ch1001.png)

```r
> # 自訂函數
> my_squared <- function(x){
+     y <- x^2
+     return(y)
+ }
> 
> # 呼叫函數
> my_squared(2)
[1] 4
> my_squared(-2:2)
[1] 4 1 0 1 4
```

### 練習更多自訂函數

熟能生巧，我們再來練習自訂幾個簡單的函數！

#### 計算圓的面積

我們來實作一個自訂函數叫做 `circle_area()`，當使用者輸入一個圓形的半徑，它會計算出該圓形的面積。

```r
> # 自訂函數
> circle_area <- function(r){
+   area <- pi * r^2 # R 語言有內建圓周率 pi
+   return(area)
+ }
> # 呼叫函數
> circle_area(3)
[1] 28.27433
> circle_area(5)
[1] 78.53982
```

#### 計算圓的周長

我們來實作一個自訂函數叫做 `circle_circum()`，當使用者輸入一個圓形的半徑，它會計算出該圓形的周長。

```r
> # 自訂函數
> circle_circum <- function(r){
+   circum <- 2 * pi * r # R 語言有內建圓周率 pi
+   return(circum)
+ }
> # 呼叫函數
> circle_circum(3)
[1] 18.84956
> circle_circum(5)
[1] 31.41593
```

#### 讓使用者決定要計算圓面積或周長

我們把前面兩個自訂函數的功能整合起來到一個函數裡面，這個時候我們會正式納入**參數（parameters）**的觀念到這個自訂函數中，使用一個邏輯值參數 `is_area` 來讓使用者呼叫時決定要計算面積或者周長。

```r
> # 自訂函數
> circle_calculator <- function(r, is_area){
+   area <- pi * r^2
+   circum <- 2 * pi * r
+   if (is_area == TRUE){
+     return(area)
+   } else {
+     return(circum)
+   }
+ }
> # 呼叫函數
> circle_calculator(3, is_area = TRUE)
[1] 28.27433
> circle_calculator(3, is_area = FALSE)
[1] 18.84956
```

這裡我們設計使用邏輯值做為 `is_area` 參數的原因是預期僅有兩種可能（面積或周長），假如使用者呼叫函數時沒有指定 `is_area` 參數，就會出現錯誤訊息：

```r
> # 自訂函數
> circle_calculator <- function(r, is_area){
+   area <- pi * r^2
+   circum <- 2 * pi * r
+   if (is_area == TRUE){
+     return(area)
+   } else {
+     return(circum)
+   }
+ }
> # 呼叫函數
> circle_calculator(3)
Error in circle_calculator(3) : 
  argument "is_area" is missing, with no default
```

於是我們稍微修改一下自訂函數，給 `is_area` 一個**預設值**為 `TRUE`，意思就是說當使用者呼叫函數時沒有指定 `is_area` 參數時，函數會指派 `TRUE` 給該參數（假定使用者是計算圓面積。）

```r
> # 自訂函數
> circle_calculator <- function(r, is_area = TRUE){
+   area <- pi * r^2
+   circum <- 2 * pi * r
+   if (is_area == TRUE){
+     return(area)
+   } else {
+     return(circum)
+   }
+ }
> # 呼叫函數
> circle_calculator(3)
[1] 28.27433
```

#### 有多個輸出的自訂函數

還記得我們在**把變數集結起來（3）**學習清單這個資料結構的時候，我們就舉了 R 語言的 `lm()` 函數作為例子，一個線性模型可以包含很多的輸出（像是係數、殘差...等），而眾多的輸出可以加以命名，並儲存在清單之中。

因此我們可以再修正一下 `circle_calculator()` 這個自訂函數，這次我們將圓面積與周長包含在一個清單中輸出，讓使用者依照名稱選擇圓面積或者周長：

```r
> # 自訂函數
> circle_calculator <- function(r){
+   area <- pi * r^2
+   circum <- 2 * pi * r
+   ans_list <- list(area = area, circum = circum) # 為清單中的物件命名方便用 $ 取用
+   return(ans_list)
+ }
> # 呼叫函數
> circle_with_r_3 <- circle_calculator(3)
> circle_with_r_3$area
[1] 28.27433
> circle_with_r_3$circum
[1] 18.84956
```

#### 練習實作 `length()` 函數

我們可以利用 R 語言的內建函數 `length()` 計算一個向量的長度（元素個數），我們可以試著自訂 `my_length()` 函數做一樣的事情：

```r
> # 自訂函數
> my_length <- function(x){
+     counts <- 0
+     for (i in x){
+         counts <- counts + 1
+     }
+     return(counts)
+ }
> 
> # 建立一個向量
> my_vec <- seq(from = 15, to = 87, by = 3)
> 
> # 呼叫內建與自訂函數
> length(my_vec)
[1] 25
> my_length(my_vec)
[1] 25
```

我們初始化一個計數器 `counts`，每一次迭代時，這個計數器就會累加 1，當迭代完畢後，回傳計數器最後的值。

#### 練習實作 `sum()` 函數

我們可以利用 R 語言的內建函數 `sum()` 計算一個向量的元素總和，我們可以試著自訂 `my_sum()` 函數做一樣的事情：

```r
> # 自訂函數
> my_sum <- function(x){
+     summation <- 0
+     for (i in x){
+         summation <- summation + i
+     }
+     return(summation)
+ }
> # 呼叫內建與自訂函數
> sum(1:10)
[1] 55
> my_sum(1:10)
[1] 55
```

### 處理一個雜亂無章的資料

回應我們今天一開始提到的概念，手邊有一個雜亂無章的資料，如果能寫一個 `clean_data()` 函數把它依照自己理想的方法處理，是多麽輕鬆方便的一件事呢？假設我們雜亂無章的資料長得像這樣：

```r
> # 雜亂無章的資料
> messy_data <- data.frame(c(1, 2, 3, 4, NA), c(1, 2, 3, NA, 5), c(1, 2, NA, 4, 5))
> names(messy_data) <- c("a", "b", "c")
> messy_data
   a  b  c
1  1  1  1
2  2  2  2
3  3  3 NA
4  4 NA  4
5 NA  5  5
```

我們理想中的 `clean_data()` 函數會提供兩種輸出：

1. 把有出現 `NA` 的觀測值都刪除
2. 把 `NA` 用某個數值取代

```r
# 自訂函數
clean_data <- function(df, impute_value){
    n_rows <- nrow(df)
    na_sum <- rep(NA, times = n_rows)
    for (i in 1:n_rows){
        na_sum[i] <- sum(is.na(df[i, ])) # 計算每個觀測值有幾個 NA
        df[i, ][is.na(df[i, ])] <- impute_value # 把 NA 用某個數值取代
    }
    complete_cases <- df[as.logical(!na_sum), ] # 把沒有出現 NA 的觀測值保留下來
    imputed_data <- df
    df_list <- list(complete_cases = complete_cases, imputed_data = imputed_data)
    return(df_list)
}
```

讓我們來呼叫 `clean_data()` 函數，並且指定用 `999` 取代 `NA` 試試看：

```r
> # 自訂函數
> clean_data <- function(df, impute_value){
+     n_rows <- nrow(df)
+     na_sum <- rep(NA, times = n_rows)
+     for (i in 1:n_rows){
+         na_sum[i] <- sum(is.na(df[i, ])) # 計算每個觀測值有幾個 NA
+         df[i, ][is.na(df[i, ])] <- impute_value # 把 NA 用某個數值取代
+     }
+     complete_cases <- df[as.logical(!na_sum), ] # 把沒有出現 NA 的觀測值保留下來
+     imputed_data <- df
+     df_list <- list(complete_cases = complete_cases, imputed_data = imputed_data)
+     return(df_list)
+ }
> # 雜亂無章的資料
> messy_data <- data.frame(c(1, 2, 3, 4, NA), c(1, 2, 3, NA, 5), c(1, 2, NA, 4, 5))
> names(messy_data) <- c("a", "b", "c")
> # 呼叫函數
> cleaned_data <- clean_data(messy_data, impute_value = 999)
> cleaned_data$complete_cases
  a b c
1 1 1 1
2 2 2 2
> cleaned_data$imputed_data
    a   b   c
1   1   1   1
2   2   2   2
3   3   3 999
4   4 999   4
5 999   5   5
```

太完美了，不論是將有遺漏值的觀測值全部刪去或是替換成指定的數字都沒有問題！

### 小結

好啦！第十天的內容就是這麼多，我們學會了如何自訂函數，並且透過大量的範例熟練輸入、參數與輸出的設計，最後我們設計了一個 `clean_data()` 函數可以針對資料框中的遺漏值做兩種不同的處理。

### 練習題

###### 1. 請練習自訂一個函數 `my_factorial()`，只要輸入整數 n，就會計算出 $$n!$$ 回傳

```r
# 自訂函數
my_factorial <- function(n){
    n <- as.integer(___)
    ans <- 1
    for (i in 1:n){
        ans <- ___ * ___
    }
    return(ans)
}

# 呼叫函數
my_factorial(5)
```

###### 2. 延續我們實作的 `my_sum()` 函數與 `my_length()` 函數，請練習自訂一個函數 `my_mean()`，平均數的公式：

$$\bar{x} = \frac{\sum_{i = 1}^{n}x_i}{n}$$

```r
# 自訂函數
my_mean <- function(x){
    my_sum <- 0
    my_length <- 0
    for (i in x){
        my_sum <- ___ + ___
        my_length <- ___ + ___
    }
    return(___ / ___)
}

# 呼叫函數
my_mean(1:10)
mean(1:10)
```