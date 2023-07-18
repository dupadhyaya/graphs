#grid lines

pacman::p_load(tidyverse)

mtcars %>% ggplot(., aes(x=mpg)) + geom_histogram()

mtcars %>% ggplot(., aes(x=mpg)) + geom_histogram(binwidth = 5)

mtcars %>% ggplot(., aes(x=mpg)) + geom_histogram(binwidth = 5, fill='#69b3a2', color='brown', alpha=.3) + theme_classic()

mtcars %>% ggplot(., aes(x=mpg)) + geom_histogram(binwidth = 5) + theme(panel.grid.major=element_line(colour='red'))


library(hrbrthemes)
library(viridis)
mtcars %>% ggplot(., aes(x=mpg)) + geom_histogram(binwidth = 5, fill='#69b3a2', color='brown', alpha=.3) + theme_ipsum()

g1 <- mtcars %>% ggplot(., aes(x=mpg)) + geom_histogram(binwidth = 5, color='blue') + theme(panel.grid.major=element_line(colour='red')) + annotate(geom='text', x=20, y=10, label='Histogram')
library(plotly)
ggplotly(g1)
