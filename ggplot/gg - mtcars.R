#ggplot with mtcars

library(ggplot2)

plot(mtcars[,c('wt','mpg')])
names(mtcars)
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point()
ggplot(data = mtcars, mapping = aes(x = qsec, y = hp)) + geom_point()


ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method='lm') 

#More Aesthetics
#colour as cyl categories
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = as.factor(cyl), size=as.factor(gear), shape=as.factor(am))) + geom_point()

#continuous variable as size
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, size = qsec)) + geom_point()

#Combine Asthetics + Layers
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method='lm') 
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color = as.factor(cyl))) + geom_point() +  stat_smooth(method = 'lm')


#Faceting
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point()
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color=as.factor(am))) + geom_point(size=4) + facet_wrap(~ cyl)

#scale of x free
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +  stat_smooth(method = 'lm') + facet_wrap(~ cyl)
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +  stat_smooth(method = 'lm') + facet_wrap(~ cyl, scales = 'free')

#two variable
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +   stat_smooth(method = 'lm') + facet_grid(am ~ cyl, scales='free')


#Histogram
hist(mtcars$mpg)
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=3)

g <- ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=5)
g
g + xlab('Miles per Gallon')+ylab('Number of Cars')

g1 <- ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=5, color='red', fill='green')
g1 + xlab('Miles per Gallon')+ylab('Number of Cars')


#BarPlot
