#TS


forms2 = read.csv('./data/forms1.csv')
head(forms2)

library(dplyr)
library(ggplot2)
library(xts)

str(forms2)
datecols = c('formDate','offerDate','feeDate')
forms2[datecols] = lapply(forms2[datecols], as.Date, format('%d-%b-%Y'))
str(forms2)

forms2 %>% group_by(campus) %>% count(formDate)
forms2 %>% add_tally()
forms2 %>% add_count(campus, formDate) %>% filter(n>1)


forms2 %>%  group_by(campus) %>%  summarise_each(funs(count= sum(is.na(.))))
forms2 %>%  group_by(campus,formDate) %>%  summarise_each(list(count= ~sum(is.na(.))))
forms2 %>%  group_by(campus,formDate) %>%  summarise_each(list(~sum(!is.na(.))))


library(data.table)
setDT(forms2)[, lapply(.SD,  function(x) sum(!is.na(x)))]
campusDt1 = setDT(forms2)[, lapply(.SD,  function(x) sum(!is.na(x))),'campus']
campusDt2 = setDT(forms2)[, lapply(.SD,  function(x) sum(!is.na(x))),c('campus','formDate')]


#resphape
library(reshape2)
forms2
forms2a = melt(forms2, id.vars=c('campus','formNo'), na.rm = T)
forms2a
forms2b <- forms2a %>% group_by(campus,value,variable) %>% summarise(n=n())
forms2b
ggplot(forms2b, aes(x=value, y=n, fill= campus)) + geom_bar(stat='identity') + facet_free( variable ~ campus)

ggplot(forms2b, aes(x=value, y=n, size=n, color=campus)) + geom_point() + facet_grid( variable ~ campus, scales='free') + scale_y_discrete(name=" Numbers", breaks=c(0,1,2,3), labels=c('0','1Forms','2Forms','3Forms'), limits=c(0,3)) +  scale_size_continuous(breaks=c(0,1,2,3,4))

#http://www.sthda.com/english/wiki/ggplot2-axis-ticks-a-guide-to-customize-tick-marks-and-labels

forms1
forms2

forms2a
head(forms2a)
names(forms2a)
daterange = as.Date('2019-06-01') + 0:50
daterange
ggplot(forms2a, aes(x=value, group=campus)) + geom_point() 

forms2b
forms1

#----
campusDt2
head(campusDt2)
Dates2 = campusDt2$formDate
Dates2
xts1 = xts(campusDt2[,-2], order.by=Dates2)
xts1
xts1$offerDate = as.numeric(xts1$offerDate)
xts1    


