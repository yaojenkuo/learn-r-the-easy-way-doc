# 程式碼 6-6
team_name <- c("Chicago Bulls", "Golden State Warriors") > wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season, stringsAsFactors = FALSE)
filter <- great_nba_teams$is_champion == TRUE
great_nba_teams[filter, ] # 注意這個逗號