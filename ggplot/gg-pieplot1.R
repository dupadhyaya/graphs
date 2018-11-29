#pie Plot in ggplot
#http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization

library(ggplot2)
library(dplyr)

mtcars %>% group_by(gear) %>% ggplot(., aes(x=factor(gear))) + geom_bar(stat='count') 

mtcars %>% group_by(gear) %>% ggplot(., aes(x=factor(gear))) + geom_bar(stat='count') + coord_polar('x')

mtcars %>% group_by(gear) %>% tally

mtcars %>% group_by(gear) %>% tally %>% ggplot(., aes(x='', y=n, fill=factor(gear))) + geom_bar(stat='identity') + coord_polar('y', start=0)

(pie1 <- mtcars %>% group_by(gear) %>% tally %>% ggplot(., aes(x='', y=n, fill=factor(gear))) + geom_bar(stat='identity', width=1.5) + coord_polar(theta='y', start=0) ) 
pie1 + xlab('') +  ylab('') +   labs(fill='Gears')  


#first draw barplot
bar <- ggplot(data=mtcars, aes(x = factor(1), fill = factor(gear))) + geom_bar(width = 1)
bar
bar + geom_bar(position='dodge')
