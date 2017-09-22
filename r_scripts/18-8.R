# 程式碼 18-8
# 讀入鳶尾花資料
iris_kmeans <- iris[, -5]
# 迴圈
ratio <- rep(NA, times = 10)
for (k in 2:length(ratio)) {
    kmeans_fit <- kmeans(iris_kmeans, centers = k, nstart = 20)
    ratio[k] <- kmeans_fit$tot.withinss / kmeans_fit$betweenss
}
plot(ratio, type = "b", xlab = "k")