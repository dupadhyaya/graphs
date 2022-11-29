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

ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area(color=NA,alpha=.4) + scale_fill_brewer(palette='Blues') + geom_line(position='stack', size=.2)


#confidence Region
months = factor(month.abb[1:12], levels=month.abb[1:12], ordered=T)
(sturegd = c(60,60,58,58,57,57,57,55,55,55,55,55))
(stuabsent = ceiling(runif(12,2,5)))
sturegd-stuabsent
attend1 = data.frame(months, sturegd, stuabsent)
attend1
g = ggplot(attend1, aes(x=months, y=sturegd, group=1))
g + geom_ribbon(aes(ymin = sturegd - stuabsent, ymax=sturegd + stuabsent), alpha=0.2) + geom_line()

months = factor(month.abb[1:12], levels=month.abb[1:12], ordered=T)
(AUH_M = trunc(rnorm(12,50,5)))
(AUUP_L = trunc(rnorm(12,50,5)))
(AUMP_G = trunc(rnorm(12,50,5)))
attend2 = data.frame(months, AUH_M, AUUP_L, AUMP_G)
attend2a = ddply(attend2, 'months', transform, minattend = min(AUH_M, AUUP_L, AUMP_G), maxattend = max(AUH_M, AUUP_L, AUMP_G), avgattend= mean(AUH_M, AUUP_L, AUMP_G))
attend2a
g = ggplot(attend2a, aes(x=months, y=avgattend, group=1))
g1 = g + geom_ribbon(aes(ymin = minattend, ymax=maxattend), alpha=0.2, fill='blue') + geom_line(colour='red') + geom_smooth(colour='darkgreen', fill='green', method='loess') 
g1 + geom_text(aes(label=avgattend), vjust=0,size=4) + geom_text(aes(label=minattend), vjust=1.5,size=3) + geom_text(aes(label=maxattend), vjust=-1.5, size=5)

