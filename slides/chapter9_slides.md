---

# 迴圈與流程控制
## 輕鬆學習 R 語言

---

# 迴圈

假設我們現在想將 R 語言中的一個內建向量 `month.name` 分別輸出在命令列

```r
month.name[1]
month.name[2]
month.name[3]
month.name[4]
month.name[5]
month.name[6]
month.name[7]
month.name[8]
month.name[9]
month.name[10]
month.name[11]
month.name[12]
```

---

# `for` 迴圈

`for` 迴圈的外觀架構長得像這個樣子

```r
for (i in x){
    # 每次迭代要執行的程式
}
```

---

# `for` 迴圈（2）

開始撰寫多行且有縮排的程式，這時候使用左上角的來源（Source）區塊編寫就比在命令列（Console）撰寫來得更適合

![](https://storage.googleapis.com/learn-r-the-easy-way.appspot.com/screenshots_ch9/ch901.png)

---

# `for` 迴圈（3）

將 R 語言中的一個內建向量 `month.name` 分別輸出在命令列

```r
for (month in month.name){
    print(month)
}
```

---

# `while` 迴圈

`while` 迴圈的外觀架構長得像這樣子

```r
while (某種條件){
    # 每次迭代要執行的程式
}
```

---

# `while` 迴圈（2）

將 R 語言中的一個內建向量 `month.name` 分別輸出在命令列

```r
i <- 1
while (i < 13){
    print(month.name[i])
    i <- i + 1
}
```

---

# 兩種迴圈的運用時機

- 假如明確知道程式需要執行幾次（迭代次數），就可以採用 `for` 迴圈或 `while` 迴圈，端看個人偏好
- 在不知道迭代次數的情形下就只能採用 `while` 迴圈

---

# 兩種迴圈的運用時機（2）

假如我們現在投擲一枚公正的銅板，想知道總共需要投擲幾次才會出現三個正面，這就是一個不知道迭代次數的問題

```r
flip_results <- c() # 建立一個空的向量來放置每一次投擲的結果
coin <- c(TRUE, FALSE) # TRUE 代表正面，FALSE 代表反面
n_flips <- 1 # 從第一次投擲開始記錄

while (sum(flip_results) < 3){
    flip_results[n_flips] <- sample(coin, size = 1) # 將每次投擲結果記錄起來
    n_flips <- n_flips + 1 # 準備記錄下一次的投擲結果
}
flip_results # 印出每次投擲的紀錄
length(flip_results) # 總共投擲了幾次
```

---

# 流程控制

在 R 語言中我們使用 `if`、`else if` 與 `else` 建立出不同的分支

```r
if (條件一) {

    # 程式一

} else if (條件二) {

    # 程式二

} else {

    # 程式三

}
```

---

# 流程控制（2）

- 一個喜愛運動的人早上起床會看天氣決定當天的行程
- 有兩種天氣條件時

```r
weather <- sample(c("sunny", "rainy"), size = 1)
weather
if (weather == "sunny"){
    print("Running outdoors!")
} else {
    print("Working out in the gym!")
}
```

---

# 流程控制（3）

- 一個喜愛運動的人早上起床會看天氣決定當天的行程
- 有三種天氣條件時

```r
weather <- sample(c("sunny", "rainy", "cloudy"), size = 1)
weather
if (weather == "sunny"){
    print("Running outdoors!")
} else if (weather == "cloudy"){
    print("Cycling!")
} else {
    print("Working out in the gym!")
}
```

---

# 流程控制（4）

- 一個喜愛運動的人早上起床會看天氣決定當天的行程
- 有四種天氣條件時

```r
weather <- sample(c("sunny", "cloudy", "drizzle", "showers", "storm"), size = 1)
weather
if (weather == "sunny"){
    print("Running outdoors!")
} else if (weather == "cloudy"){
    print("Cycling!")
} else if (weather == "drizzle") {
    print("Working out in the gym!")
} else {
    print("Couch potato.")
}
```

# 結合迴圈與流程控制

- 加入流程控制讓使用迴圈時更有彈性
    - `break` 敘述

```r
for (month in month.name){
    if (month == "April"){
        break
    } else {
        print(month)
    }
}
```

# 結合迴圈與流程控制（2）

- 加入流程控制讓使用迴圈時更有彈性
    - `next` 敘述

```r
for (month in month.name){
    if (month == "April"){
        next
    } else {
        print(month)
    }
}
```