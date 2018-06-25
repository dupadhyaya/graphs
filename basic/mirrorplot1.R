# Mirror Plot
# http://www.r-graph-gallery.com/90-mirror-plot/
#Create Data
x1 = rnorm(100)
x2 = rnorm(100, mean=2)
plot.new()
par(mfrow=c(2,1))

#Make the plot
par(mar=c(0,5,3,3))
plot(density(x1) , main="" , xlab="", ylim=c(0,1) , xaxt="n", las=1 , col="slateblue1" , lwd=4 )
par(mar=c(5,5,0,3))
plot(density(x2) , main="" , xlab="Value of my variable", ylim=c(1,0) , las=1 , col="tomato3" , lwd=4)
