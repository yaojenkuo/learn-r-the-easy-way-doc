# 程式碼 10-9
# 自訂函數
clean_data <- function(df, impute_value){
    n_rows <- nrow(df)
    na_sum <- rep(NA, times = n_rows)
    for (i in 1:n_rows){
        na_sum[i] <- sum(is.na(df[i, ])) # 計算每個觀測值有幾個 NA
        df[i, ][is.na(df[i, ])] <- impute_value # 把 NA 用某個數值取代
    }
    complete_cases <- df[as.logical(!na_sum), ] # 把沒有出現 NA 的觀測值 保留下來
    imputed_data <- df
    df_list <- list(complete_cases = complete_cases, imputed_data = imputed_data)
    return(df_list)
}
# 雜亂無章的資料
messy_data <- data.frame(c(1, 2, 3, 4, NA), c(1, 2, 3, NA, 5), c(1, 2, NA, 4, 5))
names(messy_data) <- c("a", "b", "c")
# 呼叫函數
cleaned_data <- clean_data(messy_data, impute_value = 999)
cleaned_data$complete_cases
cleaned_data$imputed_data