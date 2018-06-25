# Split Screen
#
#http://www.r-graph-gallery.com/75-split-screen-with-layout/
  
a=seq(129,1)+4*runif(129,0.4)
b=seq(1,129)^2+runif(129,0.98)

nf=layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)
boxplot(b , xlab="b" , col=rgb(0.4,0.2,0.3,0.5) , las=2)


# Set the layout
nf<-layout(matrix(c(1,1,2,3),2,2,byrow=TRUE), c(3,1), c(2,2),TRUE) 
layout.show(nf)

#Add the plots
hist(a , breaks=30 , border=F , col=rgb(0.1,0.8,0.3,0.5) , xlab="distribution of a" , main="")
boxplot(a , xlab="a" , col=rgb(0.8,0.8,0.3,0.5) , las=2)
boxplot(b , xlab="b" , col=rgb(0.4,0.2,0.3,0.5) , las=2)
