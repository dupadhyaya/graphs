#ggplot - dataset - salaries

library(ggplot2)

#RiA : Salaries
data(Salaries, package='carData')
str(Salaries)
head(Salaries)
?Salaries


data(Salaries, package='carData')
ggplot(Salaries, aes(x=rank, y=salary)) +
  geom_boxplot( fill='cornflowerblue', color='black', notch=T) +
  geom_point(position='jitter', color='blue', alpha=.5) +
  geom_rug(sides='l', color='black')

#Interpretations
#1- salaries of 3 ranks differ from each other (No overlap in the box plot notches)
#2 variance in salaries increases with greater rank, with larger range of salaries for full professors
# 3 : salaries of 3 professors is so large to make them outlier's (3 black dots)


#Eg1
library(car);library(ggplot2)
data()
data(Salaries)

ggplot( data=Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +  scale_x_discrete( breaks=c('AsstProf', 'AssocProf', 'Prof'), labels= c('Assistant \n Professor', 'Associate \n Professor', 'Full \n Professor' )) +
  scale_y_continuous(breaks = c(5000, 10000, 15000, 20000), labels =c('Rs 50K', 'Rs 100k', 'Rs 150K', 'Rs 200K')) +
  #  labs(title= 'Faculty Salary by Rank and Sex', x=' Salaries', y=' Ranks')
  
  #Eg1
  labs(title= 'Faculty Salary by Rank and Sex', y=' Salaries', x=' Ranks', fill='Gender') +
  theme(legend.position =c(.1, .8))

ggplot( data=Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
  scale_x_discrete( breaks=c('AsstProf', 'AssocProf', 'Prof'), labels= c('Assistant \n Professor', 'Associate \n Professor', 'Full \n Professor' )) +
  scale_y_continuous(breaks = c(5000, 10000, 15000, 20000), labels =c('Rs 50K', 'Rs 100k', 'Rs 150K', 'Rs 200K')) +
  labs(title= 'Faculty Salary by Rank and Sex', y=' Salaries', x=' Ranks', fill='Gender') +
  theme(legend.position =c(.1, .8))

ggplot(data=Salaries, aes(x=yrs.since.phd, y = salary, color=rank)) +
  #scale_color_manual(values=c('orange', 'olivedrab', 'navy')) +
  scale_color_brewer(palette='Set1') + geom_point(size=2)


mytheme <- theme(plot.title=element_text(face="bold.italic",
 size="14", color="brown"),    axis.title=element_text(face="bold.italic",   size=10, color="brown"), axis.text=element_text(face="bold", size=9,  color="darkblue"), panel.background=element_rect(fill="white",   color="darkblue"),   panel.grid.major.y=element_line(color="grey",   linetype=1),   panel.grid.minor.y=element_line(color="grey",   linetype=2),  panel.grid.minor.x=element_blank(), legend.position="top")

ggplot(Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +  labs(title="Salary by Rank and Sex", 
  x="Rank", y="Salary") +  mytheme

#Eg1

p1 <- ggplot(data=Salaries, aes(x=rank)) +  geom_bar()
p2 <- ggplot(data=Salaries, aes(x=sex)) +  geom_bar()
p3 <- ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) +  geom_point()

library(gridExtra)
grid.arrange(p1, p2, p3, ncol=3)






