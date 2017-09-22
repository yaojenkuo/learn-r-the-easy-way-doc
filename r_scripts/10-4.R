# 程式碼 10-4
# 自訂函數
circle_calculator <- function(r, is_area){
    area <- pi * r^2
    circum <- 2 * pi * r
    if (is_area == TRUE){
        return(area)
    } else {
        return(circum)
    }
}
# 呼叫函數
circle_calculator(3, is_area = TRUE)
circle_calculator(3, is_area = FALSE)