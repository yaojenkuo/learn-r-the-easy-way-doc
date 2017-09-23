---

# 探索資料分析
## 輕鬆學習 R 語言

---

# 資料的維度

使用 `nrow()`、`ncol()` 與 `dim()` 這三個函數可以得知這個資料的維度資訊

```r
nrow(iris) # 告訴我們內建資料 iris 有幾個觀測值
ncol(iris) # 告訴我們內建資料 iris 有幾個變數
dim(iris) # 告訴我們內建資料 iris 有幾個觀測值與有幾個變數
```

---

# 資料的外觀

- 使用 `head()` 與 `tail()` 這兩個函數可以得知部分資料的外觀
- 使用 `names()` 函數可以得知變數名稱

```r
head(iris) # 印出內建資料 iris 的前六個觀測值（含變數名稱）
tail(iris) # 印出內建資料 iris 的後六個觀測值（含變數名稱）
names(iris) # 印出內建資料 iris 的五個變數名稱
```

---

# 變數的分佈情況

使用 `summary()` 函數可以得知每一個變數的描述性統計量

```r
summary(iris) # 印出內建資料 iris 的變數描述性統計
```

---

# 包含很多資訊的 `str()` 函數

使用 `str()` 函數可以輸出關於資料很多的資訊

```r
str(iris)
```

---

# Base Plotting System

|函數|圖形|範例|
|---|----|------|
|`hist()`|直方圖|`hist(rnorm(1000))`|
|`boxplot()`|盒鬚圖|`boxplot(Sepal.Length ~ Species, data = iris)`|
|`plot(..., type = "l")`|線圖|`plot(AirPassengers, type = "l")`|
|`plot()`|散佈圖|`plot(cars)`|
|`barplot()`|長條圖|`barplot(table(mtcars$cyl))`|
|`curve()`|曲線圖|`curve(sin, from = 0, to = pi * 2)`|

---

# 探索數值分佈

使用 `hist()` 函數繪製直方圖來探索數值的分佈

```r
hist(rnorm(1000))
```

# 探索數值分佈（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1203.png)

---

# 探索不同類別與數值分佈的關係

使用 `boxplot()` 函數繪製盒鬚圖來探索不同類別與數值分佈的關係

```r
boxplot(Sepal.Length ~ Species, data = iris)
```

---

# 探索不同類別與數值分佈的關係（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1204.png)

---

# 探索數值與日期（時間）的關係

使用 `plot(..., type = "l")` 函數繪製線圖來探索數值與日期（時間）的關係

```r
x <- seq(from = as.Date("2017-01-01"), to = as.Date("2017-01-31"), by = 1)
set.seed(123) # 確保我們得到一樣的 y
y <- sample(1:100, size = 31, replace = TRUE)
plot(x, y, type = "l")
```

---

# 探索數值與日期（時間）的關係（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1205.png)

---

# 探索數值與日期（時間）的關係（3）

像是 `AirPassengers` 與 `LakeHuron` 等它們的資料結構是 `ts` 可以直接作為 `plot()` 函數的輸入

```r
class(AirPassengers)
class(LakeHuron)
plot(AirPassengers)
plot(LakeHuron)
```

---

# 探索數值與日期（時間）的關係（4）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1206.png)

---

# 探索數值與日期（時間）的關係（5）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1207.png)

---

# 探索兩個數值的關係

使用 `plot()` 函數繪製散佈圖來探索兩個數值的關係

```r
plot(cars$speed, cars$dist)
```

---

# 探索兩個數值的關係（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1208.png)

---

# 探索類別

使用 `barplot()` 函數繪製長條圖來探索類別的分佈，假如我們有一個向量 `ice_cream_flavor` 紀錄了 100 個人最喜歡的冰淇淋口味

```r
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
ice_cream_flavor
```

---

# 探索類別（2）

使用 `table()` 函數

```r
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
plot(table(ice_cream_flavor))
```

---

# 探索類別（3）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1211.png)

---

# 繪畫函數

- 使用 `curve()` 函數將內建或者自訂的函數繪製出來
- 將 `sin()` 函數在 $$-\pi$$ 與 $$\pi$$ 之間的輸出描繪出來：

```r
curve(sin, from = -pi, to = pi)
```

---

# 繪畫函數（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1212.png)

---

# 繪畫函數（3）

如果是一個自訂函數 `my_sqr()`

```r
my_sqr <- function(x){
    return(x^2)
}
curve(my_sqr, from = -3, to = 3)
```

---

# 繪畫函數（4）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1213.png)

---

# 自訂標題、X 軸標籤與 Y 軸標籤

在繪圖函數中加入 `main`、`xlab` 與 `ylab` 這三個參數分別指定

```r
plot(cars, main = "Car speed vs. braking distance", xlab = "Car speed(mph)", ylab = "Braking distance(ft)")
```

---

# 自訂標題、X 軸標籤與 Y 軸標籤（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1214.png)

---

# 加入格線

繪圖之後呼叫 `grid()` 函數為圖形加上 X 軸與 Y 軸的格線

```r
plot(cars, main = "Car speed vs. braking distance", xlab = "Car speed(mph)", ylab = "Braking distance(ft)")
grid()
```

---

# 加入格線（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1215.png)

---

# 調整圖形為水平方向

在繪圖函數中指定參數 `horiz = TRUE`

```r
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
barplot(table(ice_cream_flavor), horiz = TRUE)
```

---

# 調整圖形為水平方向（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1216.png)

---

# 調整刻度顯示方向

指定參數 `las = 1` 讓文字與座標軸垂直

```r
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
barplot(table(ice_cream_flavor), horiz = TRUE, las = 1)
```

---

# 調整刻度顯示方向（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1217.png)

---

# 調整刻度文字大小

承上，我們的 `chocolate` 文字被切去了開頭，我們可以指定參數 `cex.name` 將 Y 軸的刻度文字縮小一些

```r
barplot(table(ice_cream_flavor), horiz = TRUE, las = 1, cex.name = 0.8)
```

---

# 調整刻度文字大小（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1218.png)

---

# 調整刻度文字大小（3）

假如想調整 X 軸的刻度文字，我們可以指定 `cex.axis`

```r
barplot(table(ice_cream_flavor), horiz = TRUE, las = 1, cex.name = 0.8, cex.axis = 1.2)
```

---

# 調整刻度文字大小（4）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1219.png)

---

# 在直方圖上加上密度曲線

使用 `density()` 函數搭配 `lines()` 函數產生密度曲線，並且調整直方圖的參數 `freq = FALSE`

```r
norm_dist <- rnorm(1000)
hist(norm_dist, freq = FALSE)
lines(density(norm_dist))
```

---

# 在直方圖上加上密度曲線（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1220.png)

---

# 調整資料點的形狀與顏色

指定參數 `pch` 與 `col` 可以分別調整資料點的形狀與顏色

```r
plot(cars, pch = 2, col = "red") # 資料點改成紅色的空心三角形
```

---

# 調整資料點的形狀與顏色（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1221.png)

---

# 調整資料點的形狀與顏色（3）

實務上更多的應用會是以不同的**類別**區分資料點的形狀與顏色：

```r
iris_pch <- c(1, 2, 3)[as.numeric(iris$Species)]
plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species, pch = iris_pch)
```

---

# 調整資料點的形狀與顏色（4）

![]](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1222.png)

# 繪畫多個圖形

在呼叫繪圖函數之前先呼叫 `par(mfrow = c(m, n))` 將畫布切割為 mxn 個區塊

```r
par(mfrow = c(2, 2))
boxplot(iris$Sepal.Length ~ iris$Species, main = "Sepal length by species")
boxplot(iris$Sepal.Width ~ iris$Species, main = "Sepal width by species")
boxplot(iris$Petal.Length ~ iris$Species, main = "Petal length by species")
boxplot(iris$Petal.Width ~ iris$Species, main = "Petal width by species")
```

---

# 繪畫多個圖形（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1223.png)

---

# 輸出圖形

利用 RStudio 介面中右下角的 `Plots` 頁籤點選 `Export` 輸出繪圖成為圖檔

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1224.png)

---

# 輸出圖形（2）

指定輸出圖檔的格式、輸出圖檔的路徑、圖檔檔名、長與寬

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch12/ch1225.png)
