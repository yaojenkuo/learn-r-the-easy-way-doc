#  程式碼 15-10
library(tidyverse)

team_name <- c("Chicago Bulls", "Golden State Warriors") > wins <- c(72, 73)
losses <- c(10, 9)
season <- c("1995-96", "2015-16")
great_nba_teams <- data.frame(team_name, wins, losses, stringsAsFactors = FALSE)
mutate(great_nba_teams,
    winning_percentage = wins / (wins + losses),
    season = season
)
