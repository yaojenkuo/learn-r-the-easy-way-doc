# 程式碼 14-1
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)

# 既有的資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion)
# 新增一個變數
season <- c("1995-96", "2015-16")
great_nba_teams$season <- season
great_nba_teams