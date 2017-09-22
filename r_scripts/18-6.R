# 程式碼 18-6
temperatures <- c(29, 28, 34, 31, 25, 29, 32, 31, 24, 33, 25, 31, 26, 30)
iced_tea_sales <- c(77, 62, 93, 84, 59, 64, 80, 75, 58, 91, 51, 73, 65, 84)
lm_fit <- lm(iced_tea_sales ~ temperatures)
# 假設明日的氣溫預測為 30 度
to_be_predicted <- data.frame(temperatures = 30)
predicted_sales <- predict(lm_fit, newdata = to_be_predicted)
plot(iced_tea_sales ~ temperatures, bg = "blue", pch = 16)
points(x = to_be_predicted$temperatures, y = predicted_sales, col = "red", cex = 2, pch = 17)
abline(reg = lm_fit$coefficients, col = "blue", lwd = 4)