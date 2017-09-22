# 程式碼 13-1
library(ggplot2)
ice_cream_flavor <- rep(NA, times = 100)
for (i in 1:100){
    ice_cream_flavor[i] <- sample(c("vanilla", "chocolate", "matcha", "other"), size = 1)
}
ice_cream_df <- data.frame(ice_cream_flavor = ice_cream_flavor)
ggplot(ice_cream_df, aes(x = ice_cream_flavor)) + geom_bar()