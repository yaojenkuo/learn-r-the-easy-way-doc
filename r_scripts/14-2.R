# 程式碼 14-2
team_name <- c("Chicago Bulls", "Golden State Warriors")
wins <- c(72, 73)
losses <- c(10, 9)
is_champion <- c(TRUE, FALSE)

# 既有的資料框
great_nba_teams <- data.frame(team_name, wins, losses, is_champion)
# 新增一個衍生變數
great_nba_teams$winning_percentage <- great_nba_teams$wins / (great_nba_teams$wins + great_nba_teams$losses)
great_nba_teams