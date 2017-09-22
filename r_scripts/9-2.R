# 程式碼 9-2
flip_results <- c() # 建立一個空的向量來放置每一次投擲的結果
coin <- c(TRUE, FALSE) # TRUE 代表正面，FALSE 代表反面
n_flips <- 1 # 從第一次投擲開始記錄

while (sum(flip_results) < 3){
    flip_results[n_flips] <- sample(coin, size = 1) # 將每次投擲結果記錄起來
    n_flips <- n_flips + 1 # 準備記錄下一次的投擲結果
}
flip_results # 印出每次投擲的紀錄 length(flip_results) # 總共投擲了幾次