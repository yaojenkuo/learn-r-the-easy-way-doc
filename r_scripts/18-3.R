# 程式碼 18-3
install.packages("rvest") # 安裝 rvest 套件
library(rvest) # 載入 rvest 套件

url <- "http://www.imdb.com/title/tt3783958/"
lalaland <- url %>%
    read_html()

# 不同資料的 CSS 選擇器路徑
title_css <- "h1"
rating_css <- "strong span"
time_css <- "#title-overview-widget time"
type_css <- ".subtext .itemprop"
in_theater_date_css <- ".subtext a~ .ghost+ a"
cast_css <- ".itemprop .itemprop"
# 準備一個空的清單存放資料
lalaland_info <- list()

infos <- c(title_css, time_css, type_css, in_theater_date_css, cast_css)
for (i in 1:length(infos)) {
    info <- lalaland %>%
        html_nodes(css = infos[i]) %>%
        html_text()
    lalaland_info[[i]] <- info
}
names(lalaland_info) <- c("title", "time", "type", "in_theater_date", "cast")

rating <- lalaland %>%
    html_nodes(css = "strong span") %>%
    html_text() %>%
    as.numeric()
lalaland_info$rating <- rating
# 清理電影片名
title_end_index <- regexpr(pattern = ")", lalaland_info$title[2])
lalaland_info$title <- lalaland_info$title[2] %>%
    substr(start = 1, stop = title_end_index)
# 清理電影片長
lalaland_info$time <- gsub(pattern = "\n\\s+", lalaland_info$time, replacement = "")
# 清理上映日期
lalaland_info$in_theater_date <- gsub(pattern = "\n", lalaland_info$in_theater_date, replacement = "")
# 檢視清理過後的清單
lalaland_info