# 程式碼 7-2
title <- "Great NBA Teams"
teams <- c("Chicago Bulls", "Golden State Warriors") > wins <- c(72, 73)
losses <- c(10, 9)
winning_percentage <- wins / (wins + losses)
season <- c("1995-96", "2015-16")
wins_losses <- matrix(c(wins, losses), nrow = 2)
df <- data.frame(Teams = teams, Winning_Percentage = winning_percentage, Season = season)
great_nba_teams <- list(title, teams, wins_losses, df)
great_nba_teams[[1]] # 選出清單中的第一個物件
great_nba_teams[[2]] # 選出清單中的第二個物件
great_nba_teams[[3]] # 選出清單中的第三個物件
great_nba_teams[[4]]