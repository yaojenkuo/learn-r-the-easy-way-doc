# 程式碼 18-1
install.packages("rvest") # 安裝 rvest 套件
library(rvest) # 載入 rvest 套件

url <- "http://www.imdb.com/title/tt3783958/"
lalaland <- url %>%
    read_html()
rating <- lalaland %>%
    html_nodes(css = "strong span") %>%
    html_text() %>%
    as.numeric()
rating