# 程式碼 12-2
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
table(ice_cream_flavor)