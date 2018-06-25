#Ggplot - mtcars

data(mtcars)
names(mtcars)
hist(mtcars$mpg)

library(ggplot2)
ggplot(mtcars, aes(x = mtcars$mpg)) # nothing
ggplot(mtcars, aes(x = mtcars$mpg)) + geom_histogram()

#Eg1a
ggplot(mtcars, aes(x=wt, y=mpg, size=disp)) +
  geom_point(shape=21, color='black', fill='cornsilk') +
  labs(x='Weight', y='Miles per Gallon' , title='Bubble Chart', size='Engine \n Displacement')


#Eg1
ggplot(data=mtcars, aes(x=mpg)) + geom_histogram()
ggsave(file="mygraph.pdf")

#Eg2
ggplot(mtcars, aes(y = mpg, x = wt)) +  geom_point()

#Eg2 : R in Action @19.2
library(ggplot2)
ggplot(data = mtcars, aes(x=wt, y=mpg)) +
  #  geom_point() +
  #geom_point(pch=17, col='blue', size=2)
  geom_smooth(method='lm', color='red', linetype=2) +
  labs(title = "Automobile Data", x="Weight", y="Miles per Gallon")


#Eg3: RinA : Grouping
mydata=mtcars
mydata$am = factor(mydata$am, levels=c(0,1), labels=c('Automatic', 'Manual'))
mydata$vs = factor(mydata$vs, levels=c(0,1), labels=c('V-Engine', 'Straight Engine'))
levels(mydata$cyl)
mydata$cyl = factor(mydata$cyl)

str(mydata)
ggplot(data=mtcars, aes(x=hp, y=mpg, shape=cyl, col=cyl)) + 
  scale_shape_identity() +
  geom_point(size=1) +
  facet_grid(am~vs) +
  labs(title=' Automobile Data by Engine Type', x ='Horsepower', y='Miles per Gallon')