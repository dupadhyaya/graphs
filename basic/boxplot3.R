#Box Plot -- label names
#http://www.r-graph-gallery.com/26-add-text-over-a-boxplot/


#Create data 
names=c(rep("A", 20) , rep("B", 8) , rep("C", 30), rep("D", 80))
value=c( sample(2:5, 20 , replace=T) , sample(4:9, 8 , replace=T), sample(1:7, 30 , replace=T), sample(3:8, 80 , replace=T) )
data=data.frame(names,value)


#Draw the boxplot, with the number of individuals per group
a=boxplot(data$value ~ data$names , col=rgb(0.1,0.9,0.3,0.4) , ylim=c(1,10))
plot(a)
text(c(1:nlevels(data$names)) , a$stats[nrow(a$stats) , ]+0.5 , paste("n = ",table(data$names),sep="")
     
      