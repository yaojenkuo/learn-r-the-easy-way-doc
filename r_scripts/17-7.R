# 程式碼 17-7
poker_cards <- function(n){
    color <- c("spade", "heart", "diamond", "club")
    number <- c("Ace", 2:10, "Jack", "Queen", "King")
    colors <- rep(color, times = 13)
    numbers <- rep(number, times = 4)
    cards <- paste(numbers, colors)
    return(sample(cards, size = n))
}
poker_cards(n = 4) # 發 4 張牌
poker_cards(n = 12) # 發 12 張牌