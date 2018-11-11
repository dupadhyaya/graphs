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

#----
g1 <- ggplot(mtc, aes(x = hp, y = mpg)) + geom_point(aes(color=factor(vs)))
g1
g2 <- g1 + theme(legend.position=c(1,1),legend.justification=c(1,1))  #move legend inside                
g2

g3 <- g1 + theme(legend.position = "bottom")#move legend bottom
g3        
g4 <- g1 + scale_color_discrete(name ="Engine", labels=c("V-engine", "Straight engine"))    #change labels
g4
grid.arrange(g2, g3, g4, nrow=1)

#----
g5<-ggplot(mtc, aes(x = hp, y = mpg)) + geom_point(size=2, aes(color = wt))

g5 + scale_color_continuous(name="Weight", #name of legend
 breaks = with(mtc, c(min(wt), mean(wt), max(wt))), #choose breaks of variable
labels = c("Light", "Medium", "Heavy"), #label
low = "pink", #color of lowest value
high = "red") #color of highest value



#background
g2<- ggplot(mtc, aes(x = hp, y = mpg)) + geom_point()

#Completely clear all lines except axis lines and make background white
t1<-theme(                              
  plot.background = element_blank(), 
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(), 
  panel.border = element_blank(), 
  panel.background = element_blank(),
  axis.line = element_line(size=.4)
)
g2 + t1
#Use theme to change axis label style
t2<-theme(                              
  axis.title.x = element_text(face="bold", color="black", size=10),
  axis.title.y = element_text(face="bold", color="black", size=10),
  plot.title = element_text(face="bold", color = "black", size=12)
)
g2 + t2

g3 <- g2 + t1
g3
g4 <- g2 + theme_bw()
g4
g5 <- g2 + theme_bw() + t2 + labs(x="Horsepower", y = "Miles per Gallon", title= "MPG vs Horsepower")
g5

grid.arrange(g2, g3, g4, g5, nrow=1)

#-----

g2<- ggplot(mtc, aes(x = hp, y = mpg)) + 
  geom_point(size=2, aes(color=factor(vs), shape=factor(vs))) +
  geom_smooth(aes(color=factor(vs)),method = "lm", se = TRUE) +
  scale_color_manual(name ="Engine", labels=c("V-engine", "Straight engine"), values=c("red","blue")) +
  scale_shape_manual(name ="Engine", labels=c("V-engine", "Straight engine"),   values=c(0,2)) +
  theme_bw() + 
  theme(                              
    axis.title.x = element_text(face="bold", color="black", size=12),
    axis.title.y = element_text(face="bold", color="black", size=12),
    plot.title = element_text(face="bold", color = "black", size=12),
    legend.position=c(1,1),
    legend.justification=c(1,1)) +
  labs(x="Horsepower", y = "Miles per Gallon", title= "Linear Regression (95% CI) of MPG vs Horsepower by Engine type")

g2



#---
p <- ggplot(mtcars, aes(mpg, wt, shape = factor(cyl)))
(p1 = p + geom_point(aes(colour = factor(cyl)), size = 4) )
(p2 = p1 + geom_point(colour = "grey90", size = 1.5))

p + geom_point(shape = 21, colour = "black", fill = "white", size = 2, stroke = 1)

p + geom_point(colour = "black", size = 4.5) + geom_point(colour = "pink", size = 4) +   geom_point(aes(fill = factor(cyl))) + geom_point(aes(shape = factor(cyl)))

ggplot(mtc, aes(wt, mpg)) + geom_point(na.rm = TRUE)
