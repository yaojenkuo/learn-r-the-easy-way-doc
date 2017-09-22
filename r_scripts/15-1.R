# 程式碼 15-1
library(tidyverse)

team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
great_nba_teams <- data.frame(team_name, wins, losses)
gather(great_nba_teams, key = variable_names, value = values, wins, losses)