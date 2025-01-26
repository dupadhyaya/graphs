#ggtrendline
#https://github.com/PhDMeiwp/ggtrendline

install.packages("ggtrendline")
#  install.packages("devtools")
#devtools::install_github("PhDMeiwp/ggtrendline@master", force = TRUE)
library(ggtrendline)

library(ggplot2)
library(ggtrendline)
x <- c(1, 3, 6, 9,  13,   17)
y <- c(5, 8, 11, 13, 13.2, 13.5)

ggtrendline(x, y, model = "line2P")  
ggtrendline(x, y, model = "line3P")

ggtrendline(x, y, model = "line3P") + geom_point(aes(x, y)) + theme_bw()

ggtrendline(x=mtcars$wt, y=mtcars$mpg, model = "line2P") + geom_point(aes(x, y)) + theme_bw() + ggtitle("Title") + xlab("X") + ylab("Y")

ggtrendline(x, y, model = "log2P", CI.fill = NA) +  geom_point(aes(x, y))+ theme_classic() 


ggtrendline(x, y, model = "exp2P", linecolor = "blue", linetype = 1, linewidth = 1) + 
  geom_point(aes(x, y), color = "blue", shape = 1, size = 3)  

ggtrendline(x, y, model = "exp3P", CI.level = 0.99,   CI.fill = "red", CI.alpha = 0.1, CI.color = NA, CI.lty = 2, CI.lwd = 1.5) +   geom_point(aes(x, y)) 


data("iris")
x <- iris$Petal.Width
y <- iris$Petal.Length
group <- iris$Species
ggtrendline(x,y,"exp3P") + geom_point(aes(x,y,color=group))

x <- mtcars$wt
y <- mtcars$mpg
group <- factor(mtcars$gear)
ggtrendline(x,y,"exp3P") + geom_point(aes(x,y,color=group))
