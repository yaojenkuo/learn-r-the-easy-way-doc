# 程式碼 10-8
# 自訂函數
my_sum <- function(x){
    summation <- 0
    for (i in x){
        summation <- summation + i
    }
    return(summation)
}
# 呼叫內建與自訂函數
sum(1:10)
my_sum(1:10)