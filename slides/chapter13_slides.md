---

# 探索資料分析（2）
## 輕鬆學習 R 語言

---

# 安裝 `ggplot2` 套件

```r
install.packages("ggplot2")
```

---

# 一個簡單的 `ggplot2` 散佈圖

用一個簡單的散佈圖藉此暸解它的語法邏輯

```r
library(ggplot2)
ggplot(cars, aes(x = speed, y = dist)) +
    geom_point()
```

---

# 一個簡單的 `ggplot2` 散佈圖（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1305.png)

---

# 不同樣式的資料探索圖形

|`geom_`|圖形|
|---|----|
|`geom_histogram()`|直方圖|
|`geom_boxplot()`|盒鬚圖|
|`geom_line()`|線圖|
|`geom_point()`|散佈圖|
|`geom_bar()`|長條圖|
|`stat_function(fun, geom = "line")`|曲線圖|

---

# 探索數值分佈

使用 `geom_histogram()` 繪製直方圖來探索數值的分佈

```r
library(ggplot2)

set.seed(123)
norm_nums <- rnorm(1000)
hist_df <- data.frame(norm_nums = norm_nums)
ggplot(hist_df, aes(x = norm_nums)) +
    geom_histogram()
```

---

# 探索數值分佈（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1306.png)

---

# 探索數值分佈（3）

調整 `binwidth` 參數來更改，適當增加 `binwidth` 會減少分箱數，反之減少 `binwidth` 會增加分箱數

```r
library(ggplot2)
 
set.seed(123)
norm_nums <- rnorm(1000)
hist_df <- data.frame(norm_nums = norm_nums)
ggplot(hist_df, aes(x = norm_nums)) +
    geom_histogram(binwidth = 0.1) # 比預設的分箱數多
ggplot(hist_df, aes(x = norm_nums)) +
    geom_histogram(binwidth = 0.5) # 比預設的分箱數少
```

---

# 探索數值分佈（4）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1307.png)

---

# 探索數值分佈（5）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1308.png)

---

# 探索不同類別與數值分佈的關係

使用 `geom_boxplot()` 繪製盒鬚圖來探索不同類別與數值分佈的關係

```r
library(ggplot2)

ggplot(iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot()
```

# 探索不同類別與數值分佈的關係（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1309.png)

---

# 探索數值與日期（時間）的關係

使用 `geom_line()` 繪製線圖來探索數值與日期（時間）的關係

```r
library(ggplot2)

x <- seq(from = as.Date("2017-01-01"), to = as.Date("2017-01-31"), by = 1)
set.seed(123) # 確保我們得到一樣的 y
y <- sample(1:100, size = 31, replace = TRUE)
line_df <- data.frame(x = x, y = y)
ggplot(line_df, aes(x = x, y = y)) +
    geom_line()
```

---

# 探索數值與日期（時間）的關係（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1310.png)

---

# 探索數值與日期（時間）的關係（3）

透過 `scale_x_date(date_labels)` 調整日期顯示的格式

```r
library(ggplot2)

x <- seq(from = as.Date("2017-01-01"), to = as.Date("2017-01-31"), by = 1)
set.seed(123) # 確保我們得到一樣的 y
y <- sample(1:100, size = 31, replace = TRUE)
line_df <- data.frame(x = x, y = y)
ggplot(line_df, aes(x = x, y = y)) +
    geom_line() +
    scale_x_date(date_labels = "%m.%d")
```

---

# 探索數值與日期（時間）的關係（4）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1311.png)

---

# 探索兩個數值的關係

使用 `geom_point()` 繪製散佈圖來探索兩個數值的關係

```r
library(ggplot2)

ggplot(cars, aes(x = speed, y = dist)) +
    geom_point()
```

---

# 探索兩個數值的關係（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1312.png)

---

# 探索類別

使用 `geom_bar()` 繪製長條圖來探索類別的分佈

```r
library(ggplot2)

ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
ice_cream_df <- data.frame(ice_cream_flavor = ice_cream_flavor)
ggplot(ice_cream_df, aes(x = ice_cream_flavor)) +
    geom_bar()
```

---

# 探索類別（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1313.png)

---

# 探索類別（3）

資料本身是已經統計過的資訊

```r
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
flavor <- names(table(ice_cream_flavor))
votes <- as.vector(unname(table(ice_cream_flavor)))
ice_cream_df <- data.frame(flavor = flavor, votes = votes)
View(ice_cream_df)
```

---

# 探索類別（4）

這時繪製長條圖就必須要指定一個參數 `stat = "identity"`

```r
library(ggplot2)

ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
flavor <- names(table(ice_cream_flavor))
votes <- as.vector(unname(table(ice_cream_flavor)))
ice_cream_df <- data.frame(flavor = flavor, votes = votes)
ggplot(ice_cream_df, aes(x = flavor, y = votes)) +
    geom_bar(stat = "identity")
```

---

# 探索類別（5）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1314.png)

---

# 繪畫函數

使用 `stat_function(fun, geom = "line")` 將函數繪製出來，需要在資料框中設定輸入的值域

```r
library(ggplot2)

sin_df <- data.frame(x = c(-pi, pi))
sin_df
ggplot(sin_df, aes(x = x)) +
    stat_function(fun = sin, geom = "line")
```

---

# 繪畫函數（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1315.png)

---

# 繪畫函數（3）

如果是一個自訂函數 `my_sqr()`

```r
library(ggplot2)

my_sqr <- function(x){
    return(x^2)
}
my_sqr_df <- data.frame(x = c(-3, 3))
ggplot(my_sqr_df, aes(x = x)) +
    stat_function(fun = my_sqr, geom = "line")
```

---

# 繪畫函數（4）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1316.png)

---

# 自訂標題、X 軸標籤與 Y 軸標籤

加入 `ggtitle()`、`xlab()` 與 `ylab()` 分別指定

```r
library(ggplot2)

ggplot(cars, aes(x = speed, y = dist)) +
    geom_point() + 
    ggtitle("Car speed vs. braking distance") +
    xlab("Car speed(mph)") + 
    ylab("Braking distance(ft)")
```

---

# 自訂標題、X 軸標籤與 Y 軸標籤（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1317.png)

---

# 隱藏格線

`ggplot2` 繪製的圖形預設都有格線，我們可以加入 `theme()` 進行非常細緻的格線隱藏設定

|目的|設定|
|----|---|
|隱藏主要格線|`panel.grid.major = element_blank()`|
|隱藏次要格線|`panel.grid.minor = element_blank()`|
|隱藏 X 軸主要格線|`panel.grid.major.x = element_blank()`|
|隱藏 Y 軸主要格線|`panel.grid.major.y = element_blank()`|
|隱藏 X 軸次要格線|`panel.grid.minor.x = element_blank()`|
|隱藏 Y 軸次要格線|`panel.grid.minor.y = element_blank()`|

---

# 隱藏主要與次要格線

```r
library(ggplot2)

ggplot(cars, aes(x = speed, y = dist)) +
    geom_point() +
    theme(panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank())
```

---

# 隱藏主要與次要格線（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1318.png)

---

# 調整圖形為水平方向

加入 `coord_flip()`

```r
library(ggplot2)

ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
ice_cream_df <- data.frame(ice_cream_flavor = ice_cream_flavor)
ggplot(ice_cream_df, aes(x = ice_cream_flavor)) +
    geom_bar() +
    coord_flip()
```

---

# 調整圖形為水平方向（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1319.png)

---

# 在直方圖上加上密度曲線

在 `geom_histogram()` 設定中加入 `aes(y = ..density..)` 以及加入 `geom_density()`

```r
library(ggplot2)

set.seed(123)
norm_nums <- rnorm(1000)
hist_df <- data.frame(norm_nums = norm_nums)
ggplot(hist_df, aes(x = norm_nums)) +
    geom_histogram(binwidth = 0.5, aes(y = ..density..), alpha= 0.5) +
    geom_density()
```

---

# 在直方圖上加上密度曲線（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1320.png)

---

# 調整資料點的形狀與顏色

在 `geom_point()` 中加入 `shape` 與 `colour` 的設定

```r
library(ggplot2)

ggplot(cars, aes(x = speed, y = dist)) +
    geom_point(shape = 2, colour = "red") # 資料點改成紅色的空心三角形
```

---

# 調整資料點的形狀與顏色（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1321.png)

---

# 調整資料點的形狀與顏色（3）

應用不同的**類別**區分資料點的形狀與顏色

```r
library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point(aes(shape = Species, colour = Species))
```

---

# 調整資料點的形狀與顏色（4）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1322.png)

---

# 繪畫多個圖形

- `ggplot2` 套件本身並沒有針對繪畫多個圖形這部分設計函數
- 可以利用另外一個套件 `gridExtra` 所提供的 `grid.arrange()` 函數

```r
library(ggplot2)
library(gridExtra)

g1 <- ggplot(iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot()
g2 <- ggplot(iris, aes(x = Species, y = Sepal.Width)) +
    geom_boxplot()
g3 <- ggplot(iris, aes(x = Species, y = Petal.Length)) +
    geom_boxplot()
g4 <- ggplot(iris, aes(x = Species, y = Petal.Width)) +
    geom_boxplot()
grid.arrange(g1, g2, g3, g4, nrow = 2, ncol = 2)
```

# 繪畫多個圖形（2）

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1323.png)