# 程式碼 15-15
heights <- ceiling(runif(500000) * 50) + 140 > weights <- ceiling(runif(500000) * 50) + 40 > h_w_df <- data.frame(heights, weights)
bmi <- rep(NA, times = nrow(h_w_df))
system.time(
    for (i in 1:nrow(h_w_df)){
        bmi[i] <- h_w_df[i, "weights"] / (h_w_df[i, "heights"]/100)^2
    }
)