#ggplot - data - landata

#Case-1 : landdata
fullurl2="https://docs.google.com/spreadsheets/d/13tWJP6fcWNE7FObz4Cn_-_R0us7qIFialUy1m9nwBYY/edit#gid=971806452"
library(gsheet)
data2 = as.data.frame(gsheet2tbl(fullurl2))
names(data2)
str(data2)
dim(data2)
housing = data2

#housing = read.csv('./data/landdata-states.csv')

# Complex
head(housing[,c('Home.Value', 'Date')])
plot(Home.Value ~ Date, data=subset(housing, State='MA'))

points(Home.Value ~ Date, data=subset(housing, State='TX'), col='red')
legend(1975, 400000, c('MA', 'TX'), title='State', col=c('black', 'red'), pch=c(1,1))

ggplot(subset(housing, State %in% c('MA', 'TX')), 
 aes(x=Date, y=Home.Value, color=State)) + geom_point()



help.search("geom_", package = "ggplot2")

str(housing)
hp2001Q1 = subset(housing, Date == 2001.25)
dim(hp2001Q1)

ggplot(hp2001Q1, aes(y=Structure.Cost, x=Land.Value)) + geom_point()

#Eg1
hp2001Q1 <- subset(housing, Date == 2001.25)
ggplot(hp2001Q1, aes(y = Structure.Cost, x = Land.Value)) +
  geom_point()

ggplot(hp2001Q1, aes(y =Structure.Cost, x = log(Land.Value))) +   geom_point()



#Eg1
hp2001Q1$pred.SC <- predict(lm(Structure.Cost ~ log(Land.Value), data = hp2001Q1))

p1 <- ggplot(hp2001Q1, aes(x = log(Land.Value), y = Structure.Cost))

p1 + geom_point(aes(color = Home.Value)) +
  geom_line(aes(y = pred.SC))


#Eg1
p1 +  geom_point( aes(color = Home.Value )) + geom_smooth()

#Eg1
p1 +  geom_text(aes( label=State), size=3)

#Eg2 : ggrepel
library(ggrepel)
p1 +  geom_point() + geom_text_repel( aes(label=State), size=3)

p1 +  geom_point (aes (size=2),  color='red')

#Eg
p1 +  geom_point(aes (color = Home.Value, shape=region))






