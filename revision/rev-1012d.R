#mtcars scatter plot
#http://rforpublichealth.blogspot.com/2013/11/ggplot2-cheatsheet-for-scatterplots.html

library(gridExtra)
mtc = mtcars
p1 <- ggplot(mtc, aes(x = hp, y = mpg))
p1 + geom_point()

p2 <- p1 + geom_point(color="red")#set one color for all points
p2
p3 <- p1 + geom_point(aes(color = wt, size=wt)) #set color scale by a continuous variable
p3

p4 <- p1 + geom_point(aes(color=factor(am)))  #set color scale by a factor variable
p4
grid.arrange(p2, p3, p4, nrow=1)

ggplot(mtc, aes(x = wt, y = qsec)) + geom_line(size=2, aes(color=factor(vs)))

#axis
p2 <- ggplot(mtc, aes(x = hp, y = mpg)) + geom_point()
p2
p3 <- p2+labs(x="Horsepower",y="Miles per Gallon")   #label all axes at once
p3

p4 <- p2+theme(axis.title.x = element_text(face="bold", size=20)) + labs(x="Horsepower") #label and change font size
p4

p5 <- p2 + scale_x_continuous("Horsepower", limits=c(0,400),breaks=seq(0, 400, 50))                    #adjust axis limits and breaks

grid.arrange(p3, p4, p5, nrow=1)
