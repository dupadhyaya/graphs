#cookbook : chap4
#Line Graph

library(gcookbook)
BOD

ggplot(data=BOD, aes(x=Time, y=demand)) + geom_line()
BOD1 = BOD
BOD1$Time = factor(BOD1$Time)
BOD
ggplot(BOD1, aes(x=Time, y=demand)) + geom_line() #error
ggplot(BOD1, aes(x=Time, y=demand, group=1)) + geom_line()
#group in 1, keep them together

ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + ylim(c(0, max(BOD$demand)))
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + expand_limits(y=0) #y scale start

#adding points to a line graph

g= ggplot(BOD, aes(x=Time, y=demand)) + geom_line()
g  + geom_point()

worldpop
g =ggplot(worldpop, aes(x=Year, y=Population))
g + geom_line() + geom_point()

g + geom_line() + geom_point() + scale_y_log10()
#rate of increase is faster after 1000 yrs
#multiple lines

library(plyr)
ToothGrowth
tg = ddply(ToothGrowth, c('supp','dose'), summarise, length=mean(len))
tg

g1= ggplot(tg, aes(x=dose, y=length, colour=supp))
g1 + geom_line()

g1= ggplot(tg, aes(x=dose, y=length, linetype=supp))
g1 + geom_line()

ggplot(tg, aes(x=factor(dose), y=length, colour=supp)) + geom_line()

g1= ggplot(tg, aes(x=factor(dose), y=length, colour=supp, group=supp))
g1 + geom_line()

ggplot(tg, aes(x=dose, y=length)) + geom_line()
#multiple y with 1 x - use group
ggplot(tg, aes(x=dose, y=length, group=supp)) + geom_line()
ggplot(tg, aes(x=dose, y=length, shape=supp)) + geom_line() + geom_point(size=4)
ggplot(tg, aes(x=dose, y=length, fill=supp)) + geom_line() + geom_point(size=4, shape=21)
#overlapping points
ggplot(tg, aes(x=dose, y=length, shape=supp)) + geom_line(position=position_dodge(0.2)) + geom_point(position=position_dodge(0.2),size=4)

#appearance of lines
tg
ggplot(tg, aes(x=dose, y=length, colour=supp)) + geom_line() + scale_colour_brewer(palette='Set1')

ggplot(tg, aes(x=dose, y=length, group=supp)) + geom_line(colour='darkgreen', size=1.5)

ggplot(tg, aes(x=dose, y=length, colour=supp)) + geom_line(linetype='dashed') + geom_point(shape=22, size=3, fill='white')

#appearance of points
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + geom_point(size=4, shape=22, colour='darkred', fill='pink')

#graph with shaded area

sunspot.year
sunsspotyear = data.frame(Year = as.numeric(time(sunspot.year)), 
                          Sunspots = as.numeric(sunspot.year))
head(sunsspotyear)
ggplot(data=sunsspotyear, aes(x=Year, y=Sunspots))+ geom_area()

ggplot(data=sunsspotyear, aes(x=Year, y=Sunspots))+ geom_area(fill='blue', color='black', alpha=.2)

ggplot(data=sunsspotyear, aes(x=Year, y=Sunspots))+ geom_area(fill='blue', alpha=.2)

#stacked area graph

head(uspopage)
uspopage
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area()
#order of Thousands

ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area(color='black', size=.2, alpha=.4) + scale_fill_brewer(palette='Blues', breaks=rev(levels(uspopage$AgeGroup)))
