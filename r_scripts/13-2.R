# 程式碼 13-2
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
flavor <- names(table(ice_cream_flavor))
votes <- as.vector(unname(table(ice_cream_flavor)))
ice_cream_df <- data.frame(flavor = flavor, votes = votes)
ice_cream_df