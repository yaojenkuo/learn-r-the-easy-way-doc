# 程式碼 17-5
# 自訂函數
coin_flips <- function(n){
    coin_sides <- c("Head", "Tail")
    flip_results <- rep(NA, times = n)
    for (i in 1:n){
        flip_results[i] <- sample(coin_sides, size = 1)
    }
    return(flip_results)
}
coin_flips(n = 5) # 投擲五次硬幣的結果
coin_flips(n = 10) # 投擲十次硬幣的結果