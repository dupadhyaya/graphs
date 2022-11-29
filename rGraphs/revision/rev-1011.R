# 10 Nov 18

library(ggplot2)
df= mtcars
qplot(y=df$mpg, x=df$wt, data= df)
qplot(y=df$mpg, x=df$wt, data= df, color=factor(gear), shape=factor(cyl))

ggplot(df, aes(x=wt, y=mpg))
ggplot(df, aes(x=wt, y=mpg)) + geom_point()
ggplot(df, aes(x=wt, y=mpg, shape=factor(gear), color=factor(cyl))) + geom_point()

ggplot(df, aes(x=wt, y=mpg, shape=factor(gear), color=factor(cyl))) + geom_point(size=2)

#line
qplot(wt, mpg,data=df, geom='line')
df %>% arrange(wt) %>% qplot(wt, mpg, geom='line')

ggplot(df, aes(x=wt, y=mpg)) + geom_line()
ggplot(df, aes(x=wt, y=mpg)) + geom_line() + geom_point()

ggplot(df, aes(x=wt, y=mpg)) + geom_line() + geom_point() + facet_grid( ~ factor(gear))


#bar
#error with qplot
qplot(factor(gear), y=factor(cyl), data=df, geom='bar', stat='identity')
qplot(factor(cyl), data=df)
ggplot(data=df, aes(x=factor(cyl))) + geom_bar()

ggplot(data=df, aes(x=factor(cyl),fill=factor(cyl))) + geom_bar() + facet_grid(~ gear)


#hist
hist(df$mpg)
qplot(data=df, x=mpg)
qplot(data=df, x=mpg, binwidth=5)
?qplot

ggplot(data=df, aes(x=mpg)) + geom_histogram(bins=10,  fill= 1:10) + scale_y_discrete(limits=0:10)

#increase the width, will reduce no of bins
ggplot(data=df, aes(x=mpg)) + geom_histogram(binwidth=6) + scale_y_discrete(limits=0:16)

#box plot
boxplot(mpg ~ factor(gear), data=df)
qplot(data=df, geom='boxplot', x=factor(gear), y=mpg, fill=factor(gear))

ggplot(data=df, aes(x=factor(gear), y=mpg, fill=factor(gear))) + geom_boxplot()

ggplot(data=df, aes(x=factor(gear), y=mpg, fill=factor(gear))) + geom_boxplot()

qplot(data=df, geom='boxplot', x=interaction(factor(gear), factor(cyl)), y=mpg, fill=factor(gear))

u1 = ggplot(data=df, aes(x=interaction(factor(gear),factor(cyl)), y=mpg, fill=factor(gear))) + geom_boxplot() + labs(x="Gear & Cyl", y="MPG", fill='Gear', title="Box Plot", subtitle='MPG Vs (Gear & Cyl)', caption = "(based on data from R built in dataset)", tag="MTCARS")
u1
u1 + labs(title=NULL, tag=NULL, caption=NULL)


#curve
curve(x^3 - 5*x, from = -4, to=4)
myfun <- function(x) { 1/ (1 + exp(-x + 10))}
myfun(5)

#qplot(x=c(0,20), fun=myfun, geom='line')

ggplot(data.frame(x=c(0,20)), aes(x=x)) + stat_function(fun=myfun, geom='line')


#-------------------------
library(gcookbook)
head(pg_mean)
pg_mean
ggplot(data =pg_mean, aes(x=group, y=weight)) + geom_bar(stat='identity')
table(pg_mean$group)
head(BOD,n=2)

ggplot(data=BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat='identity')

ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat='identity', fill='lightblue', colour='black')

ggplot(pg_mean, aes(x=group, y=weight, fill=group)) + geom_bar(stat='identity', color='black')
#colour and color are same.. British & US english mapped together

#grouping Bars together
head(cabbage_exp)

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(position='dodge', stat="sum") #besides
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(stat="sum")  #stacked bar

ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(position='dodge', colour="black", stat="sum") + scale_fill_brewer(palette="Pastel1") #besides

(ce <- cabbage_exp[1:5, ])

ggplot(ce, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(position='dodge', colour="black", stat="sum") + scale_fill_brewer(palette="Pastel1") #besides
#last bar more width

#Bar Graph of Counts
str(diamonds)
head(diamonds)
ggplot(diamonds, aes(x=cut)) + geom_bar()
ggplot(diamonds, aes(x=cut)) + geom_histogram(stat='count')

#Colors in Bar Graph
head(uspopchange)
upc = subset(uspopchange, rank(Change) > 40)
head(upc)
ggplot(upc, aes(x=Abb, y=Change, fill=Region)) + geom_bar(stat='identity')
ggplot(upc, aes(x=Abb, y=Change, fill=Region)) + geom_bar(stat='identity') + scale_fill_manual(values=c('blue','green')) + labs(x='State')
head(uspopchange)


#color +ve and -ve Bars differently
csub = subset(climate, Source=='Berkeley' & Year >= 1900)
head(csub)
csub$pos <- csub$Anomaly10y >= 0
csub

ggplot(data=csub, aes(x=Year, y=Anomaly10y, fill=pos)) + geom_bar(stat='identity', position='identity')

ggplot(data=csub, aes(x=Year, y=Anomaly10y, fill=pos)) + geom_bar(stat='identity', position='identity', colour='black', size=.2) + scale_fill_manual(values=c('red','green'),guide=FALSE)

#violin plot
ggplot(data=df, aes(x=factor(gear), y=mpg)) + geom_violin(fill='pink') + facet_wrap(~ cyl) + theme_bw() + labs(x="Gears")


#Bar width & spacing
pg_mean
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat='identity')
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat='identity', width=.5)
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat='identity', width=1)

head(cabbage_exp)
g= ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar))
g + geom_bar(stat='identity', position='dodge', width=.5)

g + geom_bar(stat='identity', position=position_dodge(0.7), width=.5)

g + geom_bar(stat='identity', position=position_dodge(0.9), width=.9)

#stacked bar
g + geom_bar(stat='identity')
g + geom_bar(stat='identity') + guides(fill=guide_legend(reverse=T))  # revers the legend order

#reverse stacking order
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar, order=desc(Cultivar))) + geom_bar(stat='identity') + labs(x="Dates")
names(df)
cabbage_exp
ggplot(df, aes(x=gear, y=cyl, fill=factor(cyl))) + geom_bar(stat='identity') + labs(x="Gears", y="No of Cylinders") + scale_y_discrete()
table(df$gear, df$cyl)
addmargins(table(df$gear, df$cyl))


#Proportional Stacked Bar Graph
library(plyr)
ce <- ddply(cabbage_exp, "Date", transform, percent_weight = Weight/ sum(Weight) * 100)
ce
ggplot(ce, aes(x=Date, y=percent_weight, fill=Cultivar)) + geom_bar(stat='identity')

#labels to Graphs
#geom_text()
cabbage_exp
(g = ggplot(cabbage_exp, aes(x=interaction(Date, Cultivar), y=Weight)) + geom_bar(stat='identity'))
g + geom_text(aes(label=Weight), vjust=1.5, colour='white') 
g + geom_text(aes(label=Weight), vjust=-1.5) 
g + geom_text(aes(label=Weight), vjust=-1) + scale_y_continuous(limits=c(0,4))

g2 = ggplot(df, aes(x=factor(am)))
(g2a= g2 + geom_bar(aes(fill=as.factor(cyl)), position="fill"))

g2 = ggplot(df, aes(x=interaction(gear, am)))
(g2a= g2 + geom_bar(aes(fill=as.factor(cyl)), position="fill"))

library(dplyr)
df= mtcars
mtcars %>% group_by(factor(gear)) %>% summarise(count(factor(am)))

library(ggplot2)
df %>% group_by(am) %>% summarise(meanmpg = mean(mpg))  %>% ggplot(aes(x=factor(am), y=meanmpg))+ geom_bar(stat='identity') + geom_text(aes(label=round(meanmpg,2)), vjust=-.5) + ylim(c(0,30))

df %>% group_by(am,gear) %>% count()

df %>% group_by(am,gear) %>% count()  %>% ggplot(aes(x=interaction(factor(am), factor(gear)), y=n, fill=factor(am)))+ geom_bar(stat='identity') + geom_text(aes(label=n), vjust=-.5) + ylim(limits=c(0,25))

#labels on stacked bar
df %>% group_by(cyl, gear) %>% count()
df %>% group_by(cyl, gear) %>% count() %>% ggplot(aes(x=factor(cyl), y=n, fill=factor(gear))) + geom_bar(stat='identity') + geom_text(aes(y=n, label=n), colour='white')
  
ce                                                            
library(plyr)
#masks package dplyr
ce = ddply(ce, 'Date', transform, label_y=cumsum(Weight))
ce
g = ggplot(data=ce, aes(x=Date, y=Weight, fill=order(Cultivar)))
g + geom_bar(stat='identity') + geom_text(aes(y=label_y, label=Weight), vjust=1, colour="white")  

g + geom_bar(stat='identity', colour='black') + geom_text(aes(y=label_y, label=paste(format(Weight,nsmall=2),"Kg")), size=4, vjust=1)+ guides(fill=guide_legend(reverse=T)) 
#+ scale_fill_brewer(palette="Pastel1")
