# 程式碼 10-6
# 自訂函數
circle_calculator <- function(r){
    area <- pi * r^2
    circum <- 2 * pi *r
    ans_list <- list(area = area, circum = circum) # 為清單中的物件命名 方便用 $ 取用
    return(ans_list)
}
# 呼叫函數
circle_with_r_3 <- circle_calculator(3)
circle_with_r_3$area
circle_with_r_3$circum