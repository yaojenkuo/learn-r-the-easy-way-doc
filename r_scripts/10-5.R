# 程式碼 10-5
# 自訂函數
circle_calculator <- function(r, is_area = TRUE){
    area <- pi * r^2
    circum <- 2 * pi * r
    if (is_area == TRUE){
        return(area)
    } else {
        return(circum)
    }
}
# 呼叫函數
circle_calculator(3)