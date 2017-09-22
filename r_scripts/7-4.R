# 程式碼 7-4
title <- "Great NBA Teams"
teams <- c("Chicago Bulls", "Golden State Warriors") > wins <- c(72, 73)
losses <- c(10, 9)
winning_percentage <- wins / (wins + losses)
season <- c("1995-96", "2015-16")
wins_losses <- matrix(c(wins, losses), nrow = 2)
df <- data.frame(Teams = teams, Winning_Percentage = winning_percentage, Season = season)
great_nba_teams <- list(title, teams, wins_losses, df)
great_nba_teams$teams # 選出 teams 這個向量
great_nba_teams$df # 選出 df 這個資料框