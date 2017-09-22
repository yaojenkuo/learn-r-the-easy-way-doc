# 程式碼 15-2
library(tidyverse)

team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)

great_nba_teams <- data.frame(team_name, wins, losses)
long_format <- gather(great_nba_teams, key = variable_names, value = values, wins, losses)
spread(long_format, key = variable_names, value = values)