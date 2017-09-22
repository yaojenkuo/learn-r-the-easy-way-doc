# 程式碼 14-8
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

# 既有資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)

# 重新編碼
great_nba_teams$is_champion[great_nba_teams$is_champion == TRUE] <- "Y"
great_nba_teams$is_champion[great_nba_teams$is_champion == FALSE] <- "N"
great_nba_teams