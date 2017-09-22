# 程式碼 14-5
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)

# 刪除觀測值
great_nba_teams <- great_nba_teams[-2, ]
great_nba_teams