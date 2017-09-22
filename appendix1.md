# 附錄 01：練習題參考解答

## 第 02 天練習題參考解答

###### 1. 將您的身高（公分）指派給 `my_height`；體重（公斤）指派給 `my_weight`

```r
my_height <- 172 # 替換為自己的身高
my_weight <- 70 # 替換為自己的體重
```

###### 2. 分別將 `my_height` 與 `my_weight` 輸出在命令列

```r
my_height
my_weight
```

###### 3. 利用 `my_height` 與 `my_weight` 計算您的**身體質量指數**（Body Mass Index，BMI），BMI 計算公式為：

$$BMI = \frac{體重（公斤）}{身高（公尺）^2}$$

```r
bmi <- my_weight / (my_height / 100)^2
bmi
```

-----

## 第 03 天練習題參考解答

###### 1. 將您的姓名指派給 `my_name` 並且輸出在命令列

```r
my_name <- "Kuo, Yao-Jen"
my_name
```

###### 2. 香港搖滾樂隊 Beyond 於 1983 年成立，我們假設成立日期是 1983-12-31，請將成立日期指派給 `beyond_start` 並轉換成整數輸出在命令列

```r
beyond_start <- as.Date("1983-12-31")
as.integer(beyond_start)
```

###### 3. 請以系統日期計算今年是 Beyond 成立幾週年紀念？

```r
beyond_start <- as.Date("1983-12-31")
days_diff <- Sys.Date() - beyond_start # 計算天數差距
years_diff <- days_diff / 365 # 除以 365 換算成年
```

-----

## 第 04 天練習題參考解答

###### 1. 1999 年 9 月 21 日 1 時 47 分 16 秒發生震央位於南投縣集集鎮，芮氏規模 7.3 的地震，請以文字記錄這個時間，並將它指派給 `major_quake_time`

```r
major_quake_time <- "1999-09-21 01:47:16"
```

###### 2. 1999 年 9 月 21 日 1 時 57 分 15 秒發生第一個芮氏規模超過 6 的餘震，請以文字記錄這個時間，並將它指派給 `first_aftershock_time`

```r
first_aftershock_time <- "1999-09-21 01:57:15"
```

###### 3. 請將前兩題的生成的變數轉換為時間類型，計算間隔多久發生第一個芮氏規模超過 6 的餘震

```r
major_quake_time <- as.POSIXct(major_quake_time)
first_aftershock_time <- as.POSIXct(first_aftershock_time)
first_aftershock_time - major_quake_time
```

-----

## 第 05 天練習題參考解答

###### 1. 我們有一個文字向量 `weekdays` 是一週的星期一到星期五，請您將最喜歡的週五（Happy Friday）從這個向量中用索引值選出來並且指派給 `favorite_day`

```r
weekdays <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
favorite_day <- weekdays[1]
favorite_day
```

###### 2. 同樣的文字向量，請您利用**判斷運算子**將最藍的週一（Blue Monday）從這個向量中剔除後將剩餘的日子指派給 `without_monday`

```r
weekdays <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
not_blue_monday <- weekdays != "Monday"
without_monday <- weekdays[not_blue_monday]
without_monday
```

###### 3. 我們有一個文字向量 `speed_char` 描述速度的快慢，請您使用 `factor()` 函數轉換成因素向量 `speed_factor`，並且讓快慢有排序（慢 < 快）

```r
speed_char <- c("slow", "fast")
speed_factor <- factor(speed_char, ordered = TRUE, levels = c("slow", "fast"))
speed_factor
```

-----

## 第 06 天練習題參考解答

###### 1. 我們有一個矩陣叫做 `my_mat`，它是一個 3x3 的矩陣，裡面有 1 到 9 這些數字，請您利用 `[m, n]` 把 8 選出來

```r
my_mat <- matrix(1:9, nrow = 3)
my_mat[2, 3]
```

###### 2. 同樣的一個矩陣，請您利用判斷運算子來對矩陣進行篩選，選出奇數（1、3、5、7、9）

```r
my_mat <- matrix(1:9, nrow = 3)
filter <- my_mat %% 2 == 1
my_mat[filter]
```

###### 3. 我們繼續使用 `great_nba_teams` 這個資料框，請您分別利用 `$變數名稱` 與 `[, "變數名稱"]` 將 `is_champion` 變數挑出來

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season, stringsAsFactors = FALSE)

# 利用 `$變數名稱`
great_nba_teams$is_champion

# 利用`[, "變數名稱"]`
greate_nba_teams[, "is_champion"]
```

-----

## 第 07 天練習題參考解答

###### 1. 我們把 1 到 1000 儲存在 10 個 10x10 的矩陣，並且收納在一個陣列 `my_arr` 之中，請你練習用索引值將 315 這個數字選出來

```r
my_arr <- array(1:1000, dim = c(10, 10, 10))
my_arr[5, 2, 4]
```

###### 2. 我們已經建立好幾個物件，請您幫我們收納進一個清單中叫做 `worst_nba_teams`，並利用 `[[索引值]]` 從清單中選出 `wins` 這個向量

```r
title <- "Worst NBA Teams"
teams <- c("Charlotte Bobcats", "Philadelphia 76ers")
wins <- c(7, 9)
losses <- c(59, 73)
worst_nba_teams <- list(title, teams, wins, losses)
worst_nba_teams[[3]]
```

###### 3. 同樣的幾個物件，請您建立清單 `worst_nba_teams` 的時候為每個物件命名，並且利用 `$物件名稱` 從清單中選出 `teams` 這個向量

```r
title <- "Worst NBA Teams"
teams <- c("Charlotte Bobcats", "Philadelphia 76ers")
wins <- c(7, 9)
losses <- c(59, 73)
worst_nba_teams <- list(title = title, teams = teams, wins = wins, losses = losses)
worst_nba_teams$teams
```

-----

## 第 08 天練習題參考解答

###### 1. R 語言有內建圓周率（$$\pi$$），只要輸入 `pi` 就可以使用它，請練習使用 `ceiling()`、`floor()` 與 `round()` 函數將它轉換為 4、3 與 3.14

```r
pi
ceiling(pi)
floor(pi)
round(pi, digits = 2)
```

###### 2. 請在 R 語言的命令列（console）用一段文字輸出今天的系統日期

```r
today_char <- "Today is:"
sys_date <- Sys.Date()
paste(today_char, sys_date)
```

###### 3. 我們有一個數值向量 `num_vector` ，請使用描述性統計幫我們計算它的總和與中位數

```r
num_vector <- c(11:14, NA)
sum(num_vector, na.rm = TRUE)
median(num_vector, na.rm = TRUE)
```

-----

## 第 09 天練習題參考解答

###### 1. 我們建立了一個 `week` 向量，裡面有一個星期中的七天名稱，請您使用 `for` 迴圈一一輸出每一天

```r
week <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
for (day in week){
    print(day)
}
```

###### 2. 同樣的一個 `week` 向量，請您使用 `while` 迴圈一一輸出每一天

```r
week <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
i <- 1
while (i <= length(week)){
    print(week[i])
    i <- i + 1
}
```

###### 3. 同樣的一個 `week` 向量，請您在使用迴圈一一輸出每一天的時候略過週一到週五，只輸出我們最愛的週末兩天即可

```r
week <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
for (day in week){
    if (day %in% c("Sunday", "Saturday")){
        print(day)
    } else {
        next
    }
}
```

-----

## 第 10 天練習題參考解答

###### 1. 請練習自訂一個函數 `my_factorial()`，只要輸入整數 n，就會計算出 $$n!$$ 回傳

```r
# 自訂函數
my_factorial <- function(n){
    n <- as.integer(n)
    ans <- 1
    for (i in 1:n){
        ans <- ans * i
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
        my_sum <- my_sum + i
        my_length <- my_length + 1
    }
    return(my_sum / my_length)
}

# 呼叫函數
my_mean(1:10)
mean(1:10)
```

-----

## 第 11 天練習題參考解答

###### 1. 練習將加州大學爾灣分校資料儲存庫 <http://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data> 的 `iris` 資料讀入

```r
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data"
iris_df <- read.table(url, header = FALSE, sep = ",")
```

###### 2. 加州大學爾灣分校資料儲存庫的 `iris` 資料第一筆並不是變數名稱，請根據 <http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.names> 這個連結的描述為讀入的資料變數命名（使用 `names()` 函數）

```r
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data"
iris_df <- read.table(url, header = FALSE, sep = ",")
names(iris_df) <- c("sepal_length", "sepal_width", "petal_length", "petal_width", "class")
```

###### 3. 練習將內建資料 `cars` 輸出為 `cars.csv` 至自訂的本機路徑，記住要指定參數 `row.names = FALSE`

```r
file_path <- "/Users/username/cars.csv" # 自訂
write.csv(cars, file = file_path, row.names = FALSE)
```

-----

## 第 12 天練習題參考解答

###### 將一個畫布切割成為 2X2 個區塊，並使用 **Base Plotting System** 繪製任意四種圖形。

```r
par(mfrow = c(2, 2))

# 任意選擇不同圖形練習
plot(cars)
curve(sin, from = -pi, to = pi)
barplot(table(mtcars$cyl))
boxplot(iris$Petal.Length ~ iris$Species)
```

-----

## 第 13 天練習題參考解答

###### 將一個畫布切割成為 2X2 個區塊，並使用 **ggplot2** 繪製任意四種圖形。

```r
library(ggplot2)
library(gridExtra)

g1 <- ggplot(cars, aes(x = speed, y = dist)) + geom_point()
g2 <- ggplot(data.frame(x = c(-pi, pi)), aes(x = x)) + stat_function(fun = sin, geom = "line")
g3 <- ggplot(mtcars, aes(x = cyl)) + geom_bar()
g4 <- ggplot(iris, aes(x = Species, y = Petal.Length)) + geom_boxplot()
grid.arrange(g1, g2, g3, g4, nrow = 2, ncol = 2)
```

-----

## 第 14 天練習題參考解答

###### 在 `favorite_bands_df` 新增一個變數 `formed_years`，這個變數以系統日期計算樂團成立幾週年。

```r
favorite_bands_df <- data.frame(band = c("Beyond", "Beatles"), lead_vocal = c("Wong Ka Kui", "John Lennon"), formed = c(1983, 1960))
sys_date_chr <- format(Sys.Date(), format = "%Y")
sys_date_num <- as.numeric(sys_date_chr)
favorite_bands_df$formed_years <- sys_date_num - favorite_bands_df$formed
favorite_bands_df
```

-----

## 第 15 天練習題參考解答

###### 延續今天所舉的 50 萬筆的身高體重資料，請分別用向量運算、`mapply()` 函數與迴圈來計算 BMI，並且都以 `system.time()` 函數觀察執行時間。

```r
heights <- ceiling(runif(500000) * 50) + 140
weights <- ceiling(runif(500000) * 50) + 40
h_w_df <- data.frame(heights, weights)

# 定義 bmi_calculator
bmi_calculator <- function(height, weight){
    return(weight / (height / 100)^2)
}

# 向量運算
system.time(
    h_w_df$bmi <- h_w_df$weights / (h_w_df$heights / 100)^2
)

# mapply() 函數可以讓我們輸入兩個參數身高與體重
system.time(
    h_w_df$bmi <- mapply(FUN = bmi_calculator, h_w_df$heights, h_w_df$weights)
)

# 迴圈
bmi <- rep(NA, times = nrow(h_w_df))
system.time(
    for (i in 1:nrow(h_w_df)){
        bmi[i] <- bmi_calculator(h_w_df[i, "heights"], h_w_df[i, "weights"])
    }
)
h_w_df$bmi <- bmi
```