#Ggplot - mtcars

data(mtcars)
names(mtcars)
hist(mtcars$mpg)

library(ggplot2)
ggplot(mtcars, aes(x = mtcars$mpg)) # nothing
ggplot(mtcars, aes(x = mtcars$mpg)) + geom_histogram()

df= mtcars

#Eg1a
ggplot(df, aes(x=wt, y=mpg, size=disp)) +  geom_point(shape=21, color='black', aes(fill=gear)) + labs(x='Weight', y='Miles per Gallon' , title='Bubble Chart', size='Engine \n Displacement')


#Eg1
ggplot(data=mtcars, aes(x=mpg)) + geom_histogram()
ggsave(file="mygraph.pdf")

#Eg2
ggplot(mtcars, aes(y = mpg, x = wt)) +  geom_point()

#Eg2 : R in Action @19.2
library(ggplot2)
ggplot(data = df, aes(x=wt, y=mpg)) +
  #  geom_point() +
  #geom_point(pch=17, col='blue', size=2)
  geom_smooth(method='lm', color='red', linetype=2) +
  labs(title = "Automobile Data", x="Weight", y="Miles per Gallon")


#Eg3: RinA : Grouping
mydata=mtcars
df$am = factor(df$am, levels=c(0,1), labels=c('Automatic', 'Manual'))
df$vs = factor(df$vs, levels=c(0,1), labels=c('V-Engine', 'Straight Engine'))
levels(df$cyl)
df$cyl = factor(df$cyl)

str(mydata)
ggplot(data=df, aes(x=hp, y=mpg, shape=cyl, col=cyl)) + scale_shape_identity() +  geom_point(size=3) +  facet_grid(am~vs) +  labs(title=' Automobile Data by Engine Type', x ='Horsepower', y='Miles per Gallon')
