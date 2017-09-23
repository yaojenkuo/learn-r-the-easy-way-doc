---

# 資料處理技巧（2）
## 輕鬆學習 R 語言

---

# `tidyverse` 套件

套件 `tidyverse` 包含了我們要使用的這些套件

|套件|主要開發者|目的|
|---|--------|----|
|`magrittr`|Stefan Milton Bache|能夠使用 `%>%` 運算子|
|`tidyr`|Hadley Wickham|能夠進行長寬表格的轉換|
|`dplyr`|Hadley Wickham|更有效率地作資料處理|

---

# `tidyverse` 套件（2）

```r
install.packages("tidyverse")
library(tidyverse)
```

---

# 第一次使用 `%>%`

`%>%` 運算子稱作 **Pipeline**

```r
library(tidyverse)
cars %>% summary() # 使用 %>%
```

---

# `%>%` 的使用時機

什麼時候我們可以考慮不使用傳統呼叫函數的寫法改用 `%>%` 呢？

---

# `%>%` 的使用時機（2）

假設現在有一個需求是把系統日期的年份擷取出來，並且轉換為數字

```r
sys_date <- Sys.Date()
sys_date_yr <- format(sys_date, format = "%Y")
sys_date_num <- as.numeric(sys_date_yr)
sys_date_num
```

# `%>%` 的使用時機（3）

把上面這段程式改寫得精簡一點

```r
sys_date_num <- as.numeric(format(Sys.Date(), format = "%Y"))
sys_date_num
```

# `%>%` 的使用時機（4）

這樣子的寫法就兼顧了可讀性高與精簡的兩個優點！

```r
library(tidyverse)

sys_date_num <- Sys.Date() %>%
    format(format = "%Y") %>%
    as.numeric()
sys_date_num
```

# 寬轉長表格

透過 `tidyr` 套件中的 `gather()` 函數能夠將多個數值變數堆積在同一個數值變數（value）中，並且再使用一個類別變數（key）來記錄每一個數值變數的來源

---

# 寬轉長表格（2）

這樣外觀的資料框我們稱之為寬表格

```r
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)

great_nba_teams <- data.frame(team_name, wins, losses)
great_nba_teams
```

---

# 寬轉長表格（3）

`tidyr` 套件中的 `gather()` 函數可以將這樣外觀的寬表格轉換為長表格

```r
library(tidyverse)

team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)

great_nba_teams <- data.frame(team_name, wins, losses)
gather(great_nba_teams, key = variable_names, value = values, wins, losses)
```

---

# 長轉寬表格

透過 `tidyr` 套件中的 `spread()` 函數能夠將前述的長表格再轉換為原本的寬表格

```r
library(tidyverse)

team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)

great_nba_teams <- data.frame(team_name, wins, losses)
long_format <- gather(great_nba_teams, key = variable_names, value = values, wins, losses)
spread(long_format, key = variable_names, value = values)
```

---

# `dplyr` 套件

- `dplyr()` 套件中融入很多概念與**結構化查詢語言（Structured Query Language，SQL）**相仿的函數
- 搭配 `%>%` 運算子一起使用，能夠讓我們整理資料的能力獲得一個檔次的提升

|函數|用途|
|:----|:----|
|`filter()`|篩選符合條件的觀測值|
|`select()`|選擇變數|
|`mutate()`|新增變數|
|`arrange()`|依照變數排序觀測值|
|`summarise()`|聚合變數|
|`group_by()`|依照類別變數分組，搭配|

---

# 使用 `filter()` 函數

在 `filter()` 函數中我們輸入要篩選的資料框，以及依據什麼條件進行篩選

```r
library(tidyverse)
name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
filter(straw_hat_df, gender == "女")
```

---

# 使用 `select()` 函數

在 `select()` 函數中我們輸入資料框的名稱，以及想要選取的變數名稱

```r
library(tidyverse)

name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
select(straw_hat_df, name)
```

---

# 使用 `select()` 函數（2）

`select()` 函數也可以在選擇變數的同時對變數重新進行命名：

```r
library(tidyverse)

name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
select(straw_hat_df, crew_name = name, crew_age = age)
```

---

# 使用 `mutate()` 函數

利用 `mutate()` 函數新增衍生變數或者非衍生變數相當簡潔

```r
library(tidyverse)

team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
season <- c("1995-96", "2015-16")
great_nba_teams <- data.frame(team_name, wins, losses, stringsAsFactors = FALSE)
mutate(great_nba_teams,
       winning_percentage = wins / (wins + losses),
       season = season
)
```

---

# 使用 `arrange()` 函數

利用指定的變數來排序觀測值

```r
library(tidyverse)
name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
arrange(straw_hat_df, age)
```

---

# 使用 `arrange()` 函數（2）

如果想改為遞減排序，就在變數外面增加 `desc()` 函數

```r
library(tidyverse)

name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
arrange(straw_hat_df, desc(age))
```

---

# 使用 `summarise()` 函數

在 `summarise()` 函數中我們輸入資料框的名稱，以及想要聚合的運算，像是**總和**、**平均數**或**標準差**

```r
library(tidyverse)

name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
summarise(straw_hat_df, mean(age))
```

---

# 使用 `group_by()` 函數

聚合函數的運算常常會搭配 `group_by()` 函數一起使用，這時我們就可以整合 `%>%` 運算子

```r
library(tidyverse)

name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
straw_hat_df %>%
    group_by(gender) %>%
    summarise(mean(age)) %>%
    as.data.frame()
```