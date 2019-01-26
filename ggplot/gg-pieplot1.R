#pie Plot in ggplot
#http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization

library(ggplot2)
library(dplyr)

df %>% group_by(gear) %>% ggplot(., aes(x=gear, fill=gear)) + geom_bar(stat='count') 

df %>% group_by(gear) %>% ggplot(., aes(x=gear, fill=gear)) + geom_bar(stat='count') + coord_polar('x')

df %>% group_by(gear) %>% tally %>% ggplot(., aes(x='', y=n, fill=gear)) + geom_bar(stat='identity') + coord_polar('y', start=0)

(pie1 <- df %>% group_by(gear) %>% tally %>% ggplot(., aes(x='', y=n, fill=gear)) + geom_bar(stat='identity', width=1.5) + coord_polar(theta='y', start=45) ) 
pie1 + xlab('') +  ylab('') +   labs(fill='Gears')  


#first draw barplot
df %>% group_by(gear) %>% tally
bar <- ggplot(data=df, aes(x = gear, fill = cyl)) 
bar + geom_bar(width = .6, position='stack')
?geom_bar
bar + geom_bar(position='dodge')
bar + geom_bar(position='fill')
bar + geom_bar(width = 1) + coord_polar(theta = "y") 

ggplot(data=df, aes(x=factor(1), fill = gear)) + geom_bar(width = 1) + coord_polar(theta = "y") 

# 10th, 20th, 30th, total 32 rows

bar + geom_bar(width = 1) + coord_polar(theta = "y") + theme_void() #no labels to area
bar + geom_bar(position='dodge') + theme(axis.text.x = element_text(angle=65, vjust=0.6))

