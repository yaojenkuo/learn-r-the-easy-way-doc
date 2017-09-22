# 程式碼 18-5
# 自訂函數
train_test_split <- function(x, train_percentage) {
    n <- nrow(x) # 計算輸入有幾列資料
    data_shuffled <- x[sample(n), ]
    train_test_cut <- round(train_percentage * n)
    train_data <- data_shuffled[1:train_test_cut, ]
    test_data <- data_shuffled[(train_test_cut + 1):n, ]
    outputs <- list(train = train_data, test = test_data)
    return(outputs)
}
# 呼叫函數
iris_train_test <- train_test_split(iris, train_percentage = 0.8)
iris_train <- iris_train_test$train
iris_test <- iris_train_test$test
nrow(iris_train)
nrow(iris_test)