# 程式碼 17-2
set.seed(123)
ice_cream <- matrix(round(runif(15) * 100), nrow = 5)
colnames(ice_cream) <- c("Vanilla", "Chocolate", "Strawberry")
rownames(ice_cream) <- c("Mon", "Tue", "Wed", "Thu", "Fri")
rowSums(ice_cream)
colSums(ice_cream)