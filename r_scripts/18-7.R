# 程式碼 18-7
install.packages("rpart")
library(rpart)

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

# 切分訓練與測試資料
iris_train_test <- train_test_split(iris, train_percentage = 0.7)
iris_train <- iris_train_test$train
iris_test <- iris_train_test$test

# 建立分類器
iris_clf <- rpart(Species ~ ., data = iris_train, method = "class")
# 預測
predicted <- predict(iris_clf, iris_test, type = "class")
# 績效
conf_mat <- table(iris_test$Species, predicted)
accuracy <- sum(diag(conf_mat)) / sum(conf_mat)
accuracy