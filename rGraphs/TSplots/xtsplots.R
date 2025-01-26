

ts1 = ts(100)
data = rnorm(100, 60, 10)
tsdata = ts(data)
plot(tsdata)

#multiple Series

library(xts)
data1 = mtcars[c('mpg','hp','wt')]
dates1 = as.Date('2019-06-01') + 0:31
length(dates1)

?as.xts
xtsdata1 <- xts(x = data1, order.by = dates1)
xtsdata1
coredata(xtsdata1)

# POSIXct : with date and time
xtsdata2 <- xts(x = data1, order.by = as.POSIXct(dates1))
xtsdata2

#http://rstudio-pubs-static.s3.amazonaws.com/288218_117e183e74964557a5da4fc5902fc671.html

plot(xtsdata1)


# Create lastweek using the last 1 week of temps
last(xtsdata1, "5 days")
last(xtsdata1, "1 week")
last(xtsdata1, "2 month")
last(xtsdata1, "1 year")

# Last 3 days of first week
last(first(xtsdata1, '1 week'), '3 days') 

to.period(xtsdata1,period="quarters")
to.period(xtsdata1,period="month")
periodicity(xtsdata1)
nmonths(xtsdata1)
nyears(xtsdata1)
make.index.unique(xtsdata1,drop=TRUE)
align.time(xtsdata1, n=3600)
.indexwday(xtsdata1)
start(xtsdata1)
str(xtsdata1)

ep1=endpoints(xtsdata1,on="weeks",k=2)
period.apply(xtsdata1,INDEX=ep1,FUN=mean)
split(xtsdata1,f="weeks")
lapply(xtsdata1,FUN=mean) 

do.call(rbind,  lapply(split(xtsdata1,"months"), function(w) last(w,n="1 month")))

do.call(rbind,  lapply(split(xtsdata1,"years"),  cumsum)) 

#https://www.datacamp.com/community/blog/r-xts-cheat-sheet

library(xts)
library(ggplot2)
autoplot(xtsdata1, geom = "point",)
fortify(xtsdata1)
zoodata1 = fortify.zoo(xtsdata1) 


require(scales)
ggplot(zoodata1, aes(x = Index , y = mpg)) + geom_line() + scale_x_date(labels = date_format("%Y-%m-%d"), breaks = date_breaks("1 week")) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + geom_line(aes(y=wt), color='red') + geom_line(aes(y=hp), color='blue')

