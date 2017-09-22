# 程式碼 13-5
library(ggplot2)

set.seed(123)
norm_nums <- rnorm(1000)
hist_df <- data.frame(norm_nums = norm_nums)
ggplot(hist_df, aes(x = norm_nums)) +
    geom_histogram(binwidth = 0.5, aes(y = ..density..), alpha= 0.5) +
    geom_density()