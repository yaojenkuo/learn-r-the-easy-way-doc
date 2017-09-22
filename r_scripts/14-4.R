# 程式碼 14-4
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框，選擇不要將文字變數記錄為因素向量
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season, stringsAsFactors = FALSE)

# 新增觀測值
lakers_7172 <- c("Los Angeles Lakers", 69, 13, TRUE, "1971-72")
great_nba_teams <- rbind(great_nba_teams, lakers_7172)
great_nba_teams