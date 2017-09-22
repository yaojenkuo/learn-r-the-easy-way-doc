# 程式碼 18-4
install.packages("rvest")
library(rvest)

IMDb_crawler <- function(url) {
    html_doc <- url %>%
        read_html()
    # 不同資料的 CSS 選擇器路徑
    title_css <- "h1"
    rating_css <- "strong span"
    time_css <- "#title-overview-widget time" type_css <- ".subtext .itemprop" in_theater_date_css <- ".subtext a~ .ghost+ a" cast_css <- ".itemprop .itemprop"
    # 準備一個空的清單存放資料 movie_info <- list()
    infos <- c(title_css, time_css, type_css, in_theater_date_css, cast_css)
    for (i in 1:length(infos)) {
        info <- html_doc %>%
            html_nodes(css = infos[i]) %>%
            html_text()
        movie_info[[i]] <- info
    }
    names(movie_info) <- c("title", "time", "type", "in_theater_date", "cast")
    rating <- html_doc %>%
        html_nodes(css = "strong span") %>%
        html_text() %>%
        as.numeric()
    movie_info$rating <- rating
    # 清理電影片名
    title_end_index <- regexpr(pattern = ")", movie_info$title[2])
    movie_info$title <- movie_info$title[2] %>%
        substr(start = 1, stop = title_end_index)
    # 清理電影片長
    movie_info$time <- gsub(pattern = "\n\\s+", movie_info$time, replacement = "")
    # 清理上映日期
    movie_info$in_theater_date <- gsub(pattern movie_info$in_theater_date, replacement = "")
    # 回傳清理好的清單
    return(movie_info)
}
# 呼叫函數
wonder_woman <- IMDb_crawler(url = "http://www.imdb.com/title/tt0451279/")
wonder_woman