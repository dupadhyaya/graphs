#EDM

#TS object
(AUUP_L = trunc(rnorm(365,50,3)))
(AUH_M = trunc(rnorm(365,48,3.5)))
(AUMP_G = trunc(rnorm(365,42,4)))
(dates = as.Date('2017-10-01') + seq(0,364))
library(xts)
attend = data.frame(AUUP_L, AUH_M, AUMP_G)
attendTS = xts(attend,order.by=dates )
head(attendTS)

format(Sys.Date(),format="%w")
attendTS$day = format(as.Date(index(attendTS)),format="%w")
head(attendTS,10)
attendTS$date = index(attendTS)
(wd = weekdays(as.Date('2018-11-11')+0:6))

(attendTS$day = factor(attendTS$day, levels=0:6, labels=wd, ordered=T))
head(attendTS, n=10)
summary(attendTS$day)
str(attendTS)

plot.xts(attendTS[,1:3])
attendTS[,'AUUP_L']
plot(attendTS[,"AUUP_L"], subset="2017-12-01/2018-06-30")

boxplot(attend)
boxplot(as.data.frame(attendTS[,1:3]))
?melt


attend_long = reshape::melt(as.data.frame(attendTS), id.vars='day', variable_name='campus')
head(attend_long)
dim(attend_long)
boxplot(value ~ factor(day), data=attend_long)
boxplot(value ~ factor(campus), data=attend_long)

ggplot(data=attend_long, aes(y=value, group=day)) + geom_boxplot() + facet_wrap(. ~ day)

ggplot(data=attend_long, aes(y=value, group=campus)) + geom_boxplot() + facet_wrap(. ~ campus)

ggplot(data=attend_long, aes(x=value, group=campus)) + geom_density() + facet_wrap(. ~ campus)

ggplot(data=attend_long, aes(x=value, group=day)) + geom_density() + facet_wrap(. ~ day)

attend_long
p <- ggplot(df, aes(x=, Values)) + geom_line(aes(color=Samples)) + facet_wrap(~Samples, ncol=1)
print(p)






library(dplyr)
meanattnd <- attend_long %>% group_by(variable) %>% summarise(means = mean(value))
meanattnd
#convert tibble column to vector
meanv = pull(meanattnd, means)
meanattnd  %>% select(means) %>% collect %>% .[["means"]]

g= ggplot(data=attend_long, aes(x=value,fill=variable)) + geom_density(alpha=.3) 
g1 = g+geom_vline(xintercept=meanv,linetype=2,size=1) + geom_hline(yintercept = .05, linetype="dashed", color = "red", size=2)
g1
g1 + geom_segment(aes(x=40,y=.03,xend=50,yend=.09), size=4)

library(grid)
g1 + geom_segment(aes(x=20,y=.02,xend=40, yend=.04), arrow = arrow(length = unit(.5, "cm"))) + ggtitle("Hello")