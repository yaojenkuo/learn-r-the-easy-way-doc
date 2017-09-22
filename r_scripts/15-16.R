# 程式碼 15-16
heights <- ceiling(runif(500000) * 50) + 140
weights <- ceiling(runif(500000) * 50) + 40
h_w_df <- data.frame(heights, weights)
system.time(
    bmi <- h_w_df$weights / (h_w_df$heights / 100)^2
)