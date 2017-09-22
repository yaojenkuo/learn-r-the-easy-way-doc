# 程式碼 6-2
team_name <- c("Chicago Bulls", "Golden State Warriors") > wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)
season <- c("1995-96", "2015-16")
great_nba_teams <- data.frame(team_name, wins, losses, is_champion, season)

great_nba_teams[1, 1] # 選出第一個變數的第一個觀測值 "Chicago Bulls" [1] Chicago Bulls
great_nba_teams[1, ] # 選出第一個觀測值
great_nba_teams[, 1] # 選出第一個變數