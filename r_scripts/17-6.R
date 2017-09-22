# 程式碼 17-7
# 自訂函數
dice_rolls <- function(n){
    dice_sides <- 1:6
    roll_results <- rep(NA, times = n)
    for (i in 1:n){
        roll_results[i] <- sample(dice_sides, size = 1)
    }
    return(roll_results)
}
dice_rolls(n = 5) # 投擲五次骰子的結果
dice_rolls(n = 10) # 投擲十次骰子的結果