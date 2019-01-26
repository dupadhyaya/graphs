
library(ggplot2)
dat<-rnorm(80)
dat<-data.frame(dat)
p<-ggplot(dat, aes(x=dat))+geom_histogram()
p<-p+geom_rug(sides="b", colour="blue")
p
p1 <- ggplot(df, aes(x=mpg)) + geom_histogram(bins=20)
p1 + geom_rug(sides="b", colour="blue") #sides- "trbl"
p1 + geom_rug(sides = "b", aes(y = -1), position = "jitter", colour = "red") 
?geom_rug
#using some more obvious data:
  
dat <- c(rep(1, 50), rep(2, 50))
dat <- data.frame(dat)
