
library(ggplot2)
#feedback

(gender=factor(sample(c('M','F'), size=60, replace=T, prob=c(.7,.3))))
(fdbk = factor(sample(c('Ex','Good','Sat','Poor'),size=60, replace=T)))
feedback = data.frame(gender, fdbk)

p = ggplot(data=feedback[feedback$gender=='M',], aes(x=factor(1), y=fdbk,  fill = factor(fdbk))) 
(p1 = p + geom_bar(width = 1, stat='identity') )
p1 + coord_polar(theta='y') +  xlab('Males') + ylab('') +  labs(fill='Feedback')

p = ggplot(data=feedback, aes(x='', y=fdbk,  fill = fdbk)) 
(p1 = p + geom_bar(width = 1, stat='identity') )
p1 +  xlab('') + ylab('') +  labs(fill='Feedback') + facet_grid(. ~ gender)

df = mtcars
ggplot(data=df, aes(x=factor(am))) + stat_count() + geom_bar()
table(df$am)
table(df$am, df$gear)
ggplot(data=df, aes(x=interaction(factor(am), factor(gear)))) + stat_count() + geom_bar()

ggplot(data=df, aes(x=mpg)) + stat_density(adjust = 1, kernel = "gaussian", alpha=.5)
#melt the data to plot multiple continuous values
ggplot(data=df, aes(x=mpg)) + geom_density(fill='yellow', alpha=.3) + geom_density(x=wt, fill='green')
df2 = reshape2::melt(df[c('mpg','wt','hp')])
df2
ggplot(data=df2, aes(x=value, fill=variable)) + geom_density(alpha=.3) + scale_x_continuous(limits=c(0,100))

#combined plots : different due to different ranges
ggplot(data=df2,aes(x=value, fill=variable)) + geom_density(alpha=0.25)
ggplot(data=df2,aes(x=value, fill=variable)) + geom_histogram(alpha=0.25)
ggplot(data=df2,aes(x=variable, y=value, fill=variable)) + geom_boxplot()

ggplot(df2) + geom_freqpoly(aes(x = value, y=..density.., colour = variable))

ggplot(data=df2, aes(x=value)) + geom_density(aes(group=variable))
                                          
ggplot(df2) + geom_density(aes(x = value,  colour = variable)) + labs(x = NULL) + opts(legend.position = "none") + opts(title = "Densities from a kernel density estimator")

#TS object
(AUUP_L = trunc(rnorm(365,50,3)))
(AUH_M = trunc(rnorm(365,48,3.5)))
(AUMP_G = trunc(rnorm(365,42,4)))
(dates = as.Date('2017-10-01') + seq(0,364))
library(xts)
attend = data.frame(AUUP_L, AUH_M, AUMP_G)
attendTS = xts(attend,order.by=dates )
head(attendTS)
plot(attendTS)
boxplot(attend)
boxplot(as.data.frame(attendTS))

attend_long = reshape::melt(attend)
head(attend_long)
boxplot(value ~ factor(variable), data=attend_long)

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

plot(df$wt, df$mpg)
abline(lm(mpg ~ wt, data= df))
ggplot(df, aes(x=wt, y=mpg)) + geom_smooth()
ggplot(df, aes(x=wt, y=mpg)) + geom_line()
ggplot(df, aes(x=wt, y=mpg)) + geom_point(size=3) + geom_smooth(method='lm', se=F)

ggplot(women, aes(x=height, y=weight)) + geom_point(size=3) + geom_smooth(method='lm', se=T) 

