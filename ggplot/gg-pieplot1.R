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
mtcars %>% group_by(gear) %>% tally
bar <- ggplot(data=mtcars, aes(x = factor(gear), fill = factor(gear))) 
bar + geom_bar(width = 1)
bar + geom_bar(position='dodge')
bar + geom_bar(width = 1) + coord_polar(theta = "y") 
ggplot(data=mtcars, aes(x=factor(1), fill = factor(gear))) + geom_bar(width = 1) + coord_polar(theta = "y") 
# 10th, 20th, 30th, total 32 rows

bar + geom_bar(width = 1) + coord_polar(theta = "y") + theme_void() #no labels to area
bar + geom_bar(position='dodge') + theme(axis.text.x = element_text(angle=65, vjust=0.6))
