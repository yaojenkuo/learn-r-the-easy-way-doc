# 程式碼 15-5
library(tidyverse)

name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉 士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
gender <- c("男", "男", "女", "男", "男", "男", "女", "男", "男")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, gender, age, stringsAsFactors = FALSE)
filter(straw_hat_df, gender == "男" & age > 30)