---

# 自訂函數
## 輕鬆學習 R 語言

---

# 自訂函數的外觀架構

自訂函數的外觀架構

```r
function_name <- function(輸入1, 輸入2, ..., 輸入 n, 參數1, 參數2, ..., 參數 n){
    # 呼叫函數後執行的程式
    return(輸出)
}
```

---

# `my_squared()` 函數

```r
# 自訂函數
my_squared <- function(x){
    y <- x^2
    return(y)
}
 
# 呼叫函數
my_squared(2)
my_squared(-2:2)
```

---

# 計算圓的面積

```r
# 自訂函數
circle_area <- function(r){
  area <- pi * r^2 # R 語言有內建圓周率 pi
  return(area)
}
# 呼叫函數
circle_area(3)
circle_area(5)
```

---

# 計算圓的周長

```r
# 自訂函數
circle_circum <- function(r){
  circum <- 2 * pi * r # R 語言有內建圓周率 pi
  return(circum)
}
# 呼叫函數
circle_circum(3)
circle_circum(5)
```

---

# 讓使用者決定要計算圓面積或周長

```r
# 自訂函數
circle_calculator <- function(r, is_area){
  area <- pi * r^2
  circum <- 2 * pi * r
  if (is_area == TRUE){
    return(area)
  } else {
    return(circum)
  }
}
# 呼叫函數
circle_calculator(3, is_area = TRUE)
circle_calculator(3, is_area = FALSE)
```

---

# 讓使用者決定要計算圓面積或周長（2）

假如使用者呼叫函數時沒有指定 `is_area` 參數，就會出現錯誤訊息

```r
# 自訂函數
circle_calculator <- function(r, is_area){
  area <- pi * r^2
  circum <- 2 * pi * r
  if (is_area == TRUE){
    return(area)
  } else {
    return(circum)
  }
}
# 呼叫函數
circle_calculator(3)
```

---

# 讓使用者決定要計算圓面積或周長（3）

給 `is_area` 一個**預設值**為 `TRUE`

```r
# 自訂函數
circle_calculator <- function(r, is_area = TRUE){
  area <- pi * r^2
  circum <- 2 * pi * r
  if (is_area == TRUE){
    return(area)
  } else {
    return(circum)
  }
}
# 呼叫函數
circle_calculator(3)
```

---

# 有多個輸出的自訂函數

將圓面積與周長包含在一個清單中輸出

```r
# 自訂函數
circle_calculator <- function(r){
  area <- pi * r^2
  circum <- 2 * pi * r
  ans_list <- list(area = area, circum = circum) # 為清單中的物件命名方便用 $ 取用
  return(ans_list)
}
# 呼叫函數
circle_with_r_3 <- circle_calculator(3)
circle_with_r_3$area
circle_with_r_3$circum
```

---

# 練習實作 `length()` 函數

```r
# 自訂函數
my_length <- function(x){
    counts <- 0
    for (i in x){
        counts <- counts + 1
    }
    return(counts)
}

# 建立一個向量
my_vec <- seq(from = 15, to = 87, by = 3)

# 呼叫內建與自訂函數
length(my_vec)
my_length(my_vec)
```

---

# 練習實作 `sum()` 函數

```r
# 自訂函數
my_sum <- function(x){
    summation <- 0
    for (i in x){
        summation <- summation + i
    }
    return(summation)
}
# 呼叫內建與自訂函數
sum(1:10)
my_sum(1:10)
```