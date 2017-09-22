# 程式碼 13-6
library(ggplot2)
library(gridExtra)

g1 <- ggplot(iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot()
g2 <- ggplot(iris, aes(x = Species, y = Sepal.Width)) +
    geom_boxplot()
g3 <- ggplot(iris, aes(x = Species, y = Petal.Length)) +
    geom_boxplot()
g4 <- ggplot(iris, aes(x = Species, y = Petal.Width)) +
    geom_boxplot()
grid.arrange(g1, g2, g3, g4, nrow = 2, ncol = 2)