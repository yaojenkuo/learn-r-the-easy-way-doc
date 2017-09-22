# 程式碼 17-4
set.seed(123)
ice_cream <- matrix(round(runif(15) * 100), nrow = 5)
colnames(ice_cream) <- c("Vanilla", "Chocolate", "Strawberry")
rownames(ice_cream) <- c("Mon", "Tue", "Wed", "Thu", "Fri")
ice_cream <- cbind(ice_cream, Totals = rowSums(ice_cream))
ice_cream <- rbind(ice_cream, Totals = colSums(ice_cream))
ice_cream