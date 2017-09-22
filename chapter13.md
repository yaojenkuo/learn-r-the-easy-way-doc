# 第 13 天

## 探索資料分析（2）

除了內建的 **Base Plotting System** 可以繪製圖形，有很高比例的 R 語言使用者更依賴使用 `ggplot2` 這個繪圖套件，它簡潔、彈性高以及美觀的輸出，是吸引這些使用者的原因。`gg` 意指 **grammer of graphics**，核心理念是利用正規而有結構的文法來探索資料，它的作者是 [Hadley Wickham](http://hadley.nz/) 與 Winston Chang。

### 安裝 `ggplot2` 套件

我們先來複習一下怎麼進行安裝套件，透過命令列（Console）安裝的方法是輸入：

```r
> install.packages("ggplot2")
```

透過 RStudio 介面安裝的步驟是在右下角的 **packages** 頁籤點選 **install**：

![圖 13-1 點選 install](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1301.png)

接著是輸入安裝套件的名稱：ggplot2。

![圖 13-2 輸入 ggplot2](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1302.png)

### 載入 `ggplot2` 套件

接著我們複習怎麼載入套件，透過命令列（Console）載入的方法是輸入：

```r
library(ggplot2)
```

透過 RStudio 介面載入的方法是在右下角的 **packages** 頁籤下找到 `ggplot2` 然後將前面的核取方框打勾即可。

![圖 13-3 載入 ggplot2](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1303.png)

### 一個簡單的 `ggplot2` 散佈圖

成功安裝且載入 `ggplot2` 套件以後，我們用一個簡單的散佈圖藉此暸解它的語法邏輯：

```r
> library(ggplot2)

> ggplot(cars, aes(x = speed, y = dist))
```

![圖 13-4 簡單的散佈圖](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1304.png)

這段程式會建立出一個 `ggplot` 的物件並且綁定 `cars` 的兩個變數到這個物件之上，這裡我們可以觀察到 `ggplot2` 繪圖來源是資料框，素材是資料框中的變數，`aes()` 則負責將素材綁定至 X 軸與 Y 軸，`aes` 是 **aesthetic mappings** 的縮寫。

接下來我們還要告訴 `ggplot` 物件要用什麼樣的形式呈現這個繪圖，這時會利用 `geom_()` 指定繪圖的形式，`geom` 是 **geometric objects** 的縮寫，底線後面則會加上樣式，以我們現在繪製簡單的散佈圖需求而言，使用 `geom_point()` 就可以加上點的樣式：

```r
> library(ggplot2)

> ggplot(cars, aes(x = speed, y = dist)) + geom_point()
```

![圖 13-5 簡單的散佈圖（2）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1305.png)

### `ggplot2` 繪圖

在開始檢視不同樣式的資料探索圖形之前，我們用下表對這些 `geom_()` 有一個概觀：

|`geom_`|圖形|
|---|----|
|`geom_histogram()`|直方圖|
|`geom_boxplot()`|盒鬚圖|
|`geom_line()`|線圖|
|`geom_point()`|散佈圖|
|`geom_bar()`|長條圖|
|`stat_function(fun, geom = "line")`|曲線圖|

#### 探索數值分佈

由於 `ggplot2` 的繪圖來源是一個資料框，讓我們將 `rnorm(1000)` 儲存為一個 `hist_df` 資料框中的 `norm_nums` 變數，再使用 `geom_histogram()` 繪製直方圖來探索數值的分佈：

```r
> library(ggplot2)
> 
> set.seed(123)
> norm_nums <- rnorm(1000)
> hist_df <- data.frame(norm_nums = norm_nums)
> ggplot(hist_df, aes(x = norm_nums)) + geom_histogram()
`stat_bin()` using `bins = 30`. Pick better value with
`binwidth`.
```

![圖 13-6 ggplot2 直方圖](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1306.png)

由於直方圖的**分箱數（bins）**使用了 30 個分箱這個預設值，我們可以透過調整 `binwidth` 參數來更改，適當增加 `binwidth` 會減少分箱數，反之減少 `binwidth` 會增加分箱數，至於增加與減少的幅度，視資料的範圍斟酌：

```r
> library(ggplot2)
> 
> set.seed(123)
> norm_nums <- rnorm(1000)
> hist_df <- data.frame(norm_nums = norm_nums)
> ggplot(hist_df, aes(x = norm_nums)) + geom_histogram(binwidth = 0.1) # 比預設的分箱數多
> ggplot(hist_df, aes(x = norm_nums)) + geom_histogram(binwidth = 0.5) # 比預設的分箱數少
```

![圖 13-7 ggplot2 直方圖（2）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1307.png)

![圖 13-8 ggplot2 直方圖（3）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1308.png)

#### 探索不同類別與數值分佈的關係

使用 `geom_boxplot()` 繪製盒鬚圖來探索不同類別與數值分佈的關係，我們探索內建資料 `iris` 中不同鳶尾花品種（`Species` 變數）的萼片長度（`Sepal.Length` 變數）分佈差異：

```r
> library(ggplot2)

> ggplot(iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot()
```

![圖 13-9 ggplot2 盒鬚圖](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1309.png)

#### 探索數值與日期（時間）的關係

使用 `geom_line()` 繪製線圖來探索數值與日期（時間）的關係：

```r
> library(ggplot2)
>
> x <- seq(from = as.Date("2017-01-01"), to = as.Date("2017-01-31"), by = 1)
> set.seed(123) # 確保我們得到一樣的 y
> y <- sample(1:100, size = 31, replace = TRUE)
> line_df <- data.frame(x = x, y = y)
> ggplot(line_df, aes(x = x, y = y)) + geom_line()
```

![圖 13-10 ggplot2 線圖](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1310.png)

我們可以透過增加 `scale_x_date(date_labels)` 調整日期顯示的格式，預設是使用 `%b %d` 這個顯示格式（月份縮寫與日，中間以空格隔開），關於這個縮寫代表的意義可以參考[第 04 天：變數類型的判斷與轉換](chapter4.md)。在下面的程式我們改為使用 `%m.%d` 月份與日都以數字表示，中間以 `.` 隔開：

```r
> library(ggplot2)
>
> x <- seq(from = as.Date("2017-01-01"), to = as.Date("2017-01-31"), by = 1)
> set.seed(123) # 確保我們得到一樣的 y
> y <- sample(1:100, size = 31, replace = TRUE)
> line_df <- data.frame(x = x, y = y)
> ggplot(line_df, aes(x = x, y = y)) + geom_line() + scale_x_date(date_labels = "%m.%d")
```

![圖 13-11 ggplot2 線圖（2）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1311.png)

#### 探索兩個數值的關係

使用 `geom_point()` 繪製散佈圖來探索兩個數值的關係：

```r
> library(ggplot2)

> ggplot(cars, aes(x = speed, y = dist)) + geom_point()
```

![圖 13-12 ggplot2 散佈圖](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1312.png)

#### 探索類別

使用 `geom_bar()` 繪製長條圖來探索類別的分佈，例如 `ice_cream_df` 資料框紀錄了 100 個人最喜歡的冰淇淋口味：

```r
> library(ggplot2)

> ice_cream_flavor <- rep(NA, times = 100)
> for (i in 1:100){
+     ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
+ }
> ice_cream_df <- data.frame(ice_cream_flavor = ice_cream_flavor)
> ggplot(ice_cream_df, aes(x = ice_cream_flavor)) + geom_bar()
```

![圖 13-13 ggplot2 長條圖](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1313.png)

與 **Base Plotting System** 最大的不同在於，我們不需要再使用 `table()` 函數先統計各種口味的人數才能繪圖，`ggplot2` 針對類別變數自動會分別加總。

假如我們的資料本身是已經統計過的資訊，比如長得像這樣：

```r
> ice_cream_flavor <- rep(NA, times = 100)
> for (i in 1:100){
+     ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
+ }
> flavor <- names(table(ice_cream_flavor))
> votes <- as.vector(unname(table(ice_cream_flavor)))
> ice_cream_df <- data.frame(flavor = flavor, votes = votes)
> ice_cream_df
     flavor votes
1 chocolate    32
2    matcha    20
3     other    25
4   vanilla    23
```

這時繪製長條圖就必須要指定一個參數 `stat = "identity"`：

```r
> library(ggplot2)
>
> ice_cream_flavor <- rep(NA, times = 100)
> for (i in 1:100){
+     ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
+ }
> flavor <- names(table(ice_cream_flavor))
> votes <- as.vector(unname(table(ice_cream_flavor)))
> ice_cream_df <- data.frame(flavor = flavor, votes = votes)
> ggplot(ice_cream_df, aes(x = flavor, y = votes)) + geom_bar(stat = "identity")
```

![圖 13-14 ggplot2 長條圖（2）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1314.png)

不然會出現這樣的錯誤訊息：

```r
> library(ggplot2)
>
> ice_cream_flavor <- rep(NA, times = 100)
> for (i in 1:100){
+     ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
+ }
> flavor <- names(table(ice_cream_flavor))
> votes <- as.vector(unname(table(ice_cream_flavor)))
> ice_cream_df <- data.frame(flavor = flavor, votes = votes)
> ggplot(ice_cream_df, aes(x = flavor, y = votes)) + geom_bar()
Error: stat_count() must not be used with a y aesthetic.
```

這是因為 `ggplot2` 的 `geom_bar()` 預設會協助我們計算類別變數中的相異個數：`stat = "count"`，也就是 `table()` 函數做的事情，假如長條的高度已經在資料框中被計算好，那麼就用 `stat = "identity"` 就可以了，這是很多初接觸 `ggplot2` 的使用者會感到困惑的地方，值得我們花一些篇幅解釋。

#### 繪畫函數

使用 `stat_function(fun, geom = "line")` 將函數繪製出來，我們需要在資料框中設定輸入的值域，舉例來說我們可以將 `sin()` 函數在 $$-\pi$$ 與 $$\pi$$ 之間的輸出描繪出來：

```r
> library(ggplot2)

> sin_df <- data.frame(x = c(-pi, pi))
> sin_df
          x
1 -3.141593
2  3.141593
> ggplot(sin_df, aes(x = x)) + stat_function(fun = sin, geom = "line")
```

![圖 13-15 ggplot2 繪畫函數](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1315.png)

如果是一個自訂函數 `my_sqr()`，很簡單的 $$y = f(x) = x^2$$，我們可以將它在 -3 與 3 之間的輸出描繪出來：

```r
> library(ggplot2)
> 
> my_sqr <- function(x){
+     return(x^2)
+ }
> my_sqr_df <- data.frame(x = c(-3, 3))
> ggplot(my_sqr_df, aes(x = x)) + stat_function(fun = my_sqr, geom = "line")
```

![圖 13-16 ggplot2 繪畫函數（2）](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1316.png)

#### 常用的自訂元素

##### 自訂標題、X 軸標籤與 Y 軸標籤

加入 `ggtitle()`、`xlab()` 與 `ylab()` 分別指定：

```r
> library(ggplot2)

> ggplot(cars, aes(x = speed, y = dist)) +
+     geom_point() + 
+     ggtitle("Car speed vs. braking distance") +
+     xlab("Car speed(mph)") + 
+     ylab("Braking distance(ft)")
```

![圖 13-17 ggplot2 自訂標題與座標軸標籤](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1317.png)

##### 隱藏格線

`ggplot2` 繪製的圖形預設都有格線，我們可以加入 `theme()` 進行非常細緻的格線隱藏設定：

|目的|設定|
|----|---|
|隱藏主要格線|`panel.grid.major = element_blank()`|
|隱藏次要格線|`panel.grid.minor = element_blank()`|
|隱藏 X 軸主要格線|`panel.grid.major.x = element_blank()`|
|隱藏 Y 軸主要格線|`panel.grid.major.y = element_blank()`|
|隱藏 X 軸次要格線|`panel.grid.minor.x = element_blank()`|
|隱藏 Y 軸次要格線|`panel.grid.minor.y = element_blank()`|

隱藏主要與次要格線：

```r
> library(ggplot2)

> ggplot(cars, aes(x = speed, y = dist)) +
+     geom_point() +
+     theme(panel.grid.major = element_blank(), 
+           panel.grid.minor = element_blank())
```

![圖 13-18 ggplot2 隱藏格線](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1318.png)

##### 調整圖形為水平方向

加入 `coord_flip()`，這是 **coordinate flip** 的縮寫。

```r
> library(ggplot2)

> ice_cream_flavor <- rep(NA, times = 100)
> for (i in 1:100){
+     ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
+ }
> ice_cream_df <- data.frame(ice_cream_flavor = ice_cream_flavor)
> ggplot(ice_cream_df, aes(x = ice_cream_flavor)) +
+     geom_bar() +
+     coord_flip()
```

![圖 13-19 ggplot2 水平的長條圖](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1319.png)

##### 在直方圖上加上密度曲線

在 `geom_histogram()` 設定中加入 `aes(y = ..density..)` 以及加入 `geom_density()`。

```r
> library(ggplot2)
> 
> set.seed(123)
> norm_nums <- rnorm(1000)
> hist_df <- data.frame(norm_nums = norm_nums)
> ggplot(hist_df, aes(x = norm_nums)) +
    geom_histogram(binwidth = 0.5, aes(y = ..density..), alpha= 0.5) +
    geom_density()
```

![圖 13-20 ggplot2 直方圖加上密度曲線](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1320.png)

##### 調整資料點的形狀與顏色

在 `geom_point()` 中加入 `shape` 與 `colour` 的設定。

```r
> library(ggplot2)

> ggplot(cars, aes(x = speed, y = dist)) +
+     geom_point(shape = 2, colour = "red") # 資料點改成紅色的空心三角形
```

![圖 13-21 ggplot2 調整資料點](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1321.png)

應用不同的**類別**區分資料點的形狀與顏色在 `ggplot2` 是很容易的：

```r
> library(ggplot2)

> ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
+     geom_point(aes(shape = Species, colour = Species))
```

![圖 13-22 ggplot2 調整資料點](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1322.png)

##### 繪畫多個圖形

`ggplot2` 套件本身並沒有針對繪畫多個圖形這部分設計函數，但我們可以利用另外一個套件 `gridExtra` 所提供的 `grid.arrange()` 函數來達到 `par(mfrow = c(m, n))` 的效果：

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

![圖 13-23 ggplot2 多個圖形](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch13/ch1323.png)

### 滄海一粟

如同 **Base Plotting System** 一樣，雖然我們已經介紹了一定程度的技巧，但是這些功能相較 `ggplot2` 豐富的參數與功能實在是太微不足道。請您同樣也要耐著性子，在使用時查詢大量的文件、Google 與 StackOverflow。`ggplot2` 非常好的地方是它的[文件](http://docs.ggplot2.org/current/)除了文字說明以外，還有豐富的示範程式與圖形，對使用者非常友善。

### 小結

好啦！第十三天的內容就是這麼多，今天說明的是受到廣大 R 語言使用者喜愛的 **ggplot2** 基礎應用，希望您還喜歡這個繪圖套件！

### 練習題

###### 將一個畫布切割成為 2X2 個區塊，並使用 **ggplot2** 繪製任意四種圖形。

### 延伸資訊

- [R Graphics Cookbook](http://shop.oreilly.com/product/0636920023135.do)
- [Graphs with ggplot2](http://www.cookbook-r.com/Graphs/)
- [ggplot2.org](http://docs.ggplot2.org/current/)