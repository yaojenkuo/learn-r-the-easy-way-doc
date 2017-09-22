team_name <- c("Chicago Bulls", "Golden State Warriors") > wins <- c(72, 73)
# 程式碼 6-4
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")

great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)
great_nba_teams[, 1] <- as.character(great_nba_teams[, 1])
great_nba_teams[, 5] <- as.character(great_nba_teams[, 5])
great_nba_teams[, 1] # 選出第一個變數
great_nba_teams[, 5] # 選出第五個變數