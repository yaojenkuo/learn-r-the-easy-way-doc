# 程式碼 14-12
# 左邊的資料框
name <- c("蒙其·D·魯夫", "羅羅亞·索隆", "娜美", "多尼多尼·喬巴")
age <- c(19, 21, 20, 17)
left_df <- data.frame(name, age)

# 右邊的資料框
name <- c("蒙其·D·魯夫", "多尼多尼·喬巴", "妮可·羅賓")
devil_fruit <- c("橡膠果實", "人人果實", "花花果實")
right_df <- data.frame(name, devil_fruit)

# 合併後的資料框
merged_df <- merge(left_df, right_df, all.y = TRUE)
merged_df