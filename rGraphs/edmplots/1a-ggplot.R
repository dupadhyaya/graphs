#EDM Plots

coursestr = data.frame(course=c('BTech','MTech'), str=c(45, 32))
coursestr$course = factor(coursestr$course)
coursestr

library(ggplot2)

# Very basic bar graph
ggplot(data=coursestr, aes(x=course, y=str))

ggplot(data=coursestr, aes(x=course, y=str)) +  geom_bar(stat="identity")

ggplot(data=coursestr, aes(x=course, y=str, fill=course)) +  geom_bar(stat="identity")

# Add a black outline
g = ggplot(data=coursestr, aes(x=course, y=str, fill=course)) +
  geom_bar(colour="black", stat="identity")
g

# No legend, since the information is redundant
g + guides(fill=FALSE)


#Complete graph
# Add title, narrower bars, fill color, and change axis labels
g1 = ggplot(data=coursestr, aes(x=course, y=str, fill=course))
g2 = geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity")  
g3 = guides(fill=FALSE)
g4 = xlab("Course")
g5 = ylab("Total Strength") 
g6 =  ggtitle("Course Wise Strength of Students")
g1 + g2 + g3 + g4 + g5 + g6

#Bar Graph
library(reshape2)
#campuscourse = expand.grid(c('AUUP-L', 'AUH-M', 'AUM-M'),c('BTech','MTech') )
(campus = c(rep(c('AUC-R', 'AUUP-L','AUH-M','AUM-M'), times=c(1,2,3,4))))
(course = c('BTech','BTech','MTech','BTech','MTech','BCA', 'BTech','MTech','BCA', 'MBA'))
(str = c(30,45,32,60,55,50,35,34,42,38))
campuscourse = data.frame(campus, course, str, stringsAsFactors = T)
campuscourse

# Bar graph of counts
# campuses - courses
ggplot(data=campuscourse, aes(x=campus)) +  geom_bar(stat="count")
#courses being held in all campuses
ggplot(data=campuscourse, aes(x=course)) +  geom_bar(stat="count")

# Bar Plot graph
library(dplyr)

# Bar graph, time on x-axis, color fill grouped by course -- use position_dodge()
ggplot(data=coursestr, aes(x=campus, y=str)) +
  geom_bar(stat="identity", position=position_dodge())
#all should have same times : done later


campusstr <- campuscourse %>% group_by(campus) %>% summarise(totalstr = sum(str))
ggplot(data=campusstr, aes(x=campus, y=totalstr, fill=campus)) + geom_bar(stat="identity")

coursestr <- campuscourse %>% group_by(course) %>% summarise(totalstr = sum(str))
ggplot(data=coursestr, aes(x=course, y=totalstr, fill=course)) + geom_bar(stat="identity")

#add another column
cc2 = campuscourse
(cc2$strNextYear = c(35,35,22,50,55,60,45,44,52,48))
names(cc2) = c('campus','course','2016','2017')
cc2
cc2a
(cc2b = aggregate(cbind(`2016`,`2017`) ~ campus, data=cc2, sum))
(cc2c = aggregate(cbind(`2016`,`2017`) ~ course, data=cc2, sum))

#facets
ggplot(data= cc2b, aes(x=campus, y=`2016`)) + geom_bar(stat="identity")
ggplot(data= cc2, aes(x=course, y=`2016`, group=campus, fill=course)) + geom_bar(stat="sum")

#reshape the DF for facets
#campus - course - year - str : like this from
#campus - course - 2016 - 2017 

library(reshape2)
head(cc2)
?reshape
(long1 = reshape(cc2, direction = "long", varying = list(names(cc2)[3:4]), v.names = "str", idvar = c("campus","course"), timevar = "Year", times = 2016:2017))
(long2 = melt(cc2, id.vars = c("campus", "course")))

head(long1)
m = ggplot(data = long1, aes(x = course, y = str, group=campus, fill=course))
m = m + geom_bar(stat='sum')
m = m + facet_grid(~ Year, scale='free_x')
m
m2 = m + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=.5,colour='gray50'))
m2

head(long2)
p = ggplot(data = long2, aes(x = campus, y = value, group=course, fill=campus))
p = p + geom_bar(stat='sum')
p = p + facet_grid(~ variable, scale='free_x')
p


#Line Graph # Basic line graph
#with times series or over a period of time






