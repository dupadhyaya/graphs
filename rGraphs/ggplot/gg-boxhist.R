# ggplot
#https://stackoverflow.com/questions/4551582/combination-boxplot-and-histogram-using-ggplot2
# box and histogram together

require(ggplot2)
require(grid)
library(grid)
g1 <- ggplot(data = mtcars, aes(x = 1, y = mpg)) +  geom_boxplot( ) +   coord_flip() +  scale_y_continuous(expand = c(0,0), limit = c(10, 35))
g2 <- ggplot(data = mtcars, aes(x = mpg)) + geom_histogram(binwidth = 1) +  scale_x_continuous(expand = c(0,0), limit = c(10, 35))
grid.draw(rbind(ggplotGrob(g1),  ggplotGrob(g2), size = "first"))
?grid.draw
g1
g2
?rbind
