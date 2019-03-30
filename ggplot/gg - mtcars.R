#ggplot with mtcars

library(ggplot2)

ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point()

ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method='lm') 

#More Aesthetics
#colour as cyl categories
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = as.factor(cyl))) + geom_point()

#continuous variable as size
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, size = qsec)) + geom_point()

#Combine Asthetics + Layers
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = as.factor(cyl))) + geom_point() +  stat_smooth(method = 'lm')


#Faceting
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +   stat_smooth(method = 'lm') + facet_wrap(~ cyl)

#scale of x free
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +  stat_smooth(method = 'lm') + facet_wrap(~ cyl, scales = 'free_x')

#two variable
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +   stat_smooth(method = 'lm') + facet_grid(am ~ cyl)


#Histogram
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=5)
g <- ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=5)
g + xlab('Miles per Gallon')+ylab('Number of Cars')

g1 <- ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=5, color='red', fill='green')
g1 + xlab('Miles per Gallon')+ylab('Number of Cars')


#BarPlot
