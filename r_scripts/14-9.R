# 程式碼 14-9
# 既有的資料框
name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "騙人布", "賓什莫克·香吉 士", "多尼多尼·喬巴", "妮可·羅賓", "佛朗基", "布魯克")
age <- c(19, 21, 20, 19, 21, 17, 30, 36, 90)
straw_hat_df <- data.frame(name, age)

# 將 straw_hat_df$age 重新編碼
straw_hat_df$age_category <- cut(straw_hat_df$age, breaks = c(0, 20, 30, Inf), labels = c("20 歲以下", "超過 20 歲但 30 歲以下", "超過 30 歲"))
straw_hat_df