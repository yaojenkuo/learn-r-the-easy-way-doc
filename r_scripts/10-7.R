# 程式碼 10-7
# 自訂函數
my_length <- function(x){
    counts <- 0
    for (i in x){
        counts <- counts + 1
    }
    return(counts)
}

# 建立一個向量
my_vec<- seq(from = 15, to = 87, by = 3)
# 呼叫內建與自訂函數
length(my_vec)
my_length(my_vec)