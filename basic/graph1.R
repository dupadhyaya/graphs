x <- c(1:10); y <- x; z <- 10/x
par(mar=c(5, 4, 4, 8) + 0.1)
plot(x, y,type="b", pch=21, col="red", yaxt="n", lty=3, xlab="", ylab="")
lines(x, z, type="b", pch=22, col="blue", lty=2)
axis(2, at=x,labels=x, col.axis="red", las=2)
axis(4, at=z,labels=round(z,digits=2),col.axis="blue", las=2, cex.axis=0.7, tck=-.01)
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")
title("An Example of Creative Axes", xlab="X values", ylab="Y=X")

points(5,  5, col="red") ;
points(5, 7, col="orange", pch=3, cex=2) ;
points(c(0, 0, 1), c(2, 4, 6), col="green", pch=4) ;
x = seq(0,2*pi,0.1)
y = sin(x)

plot (x,y,main='Main Title',sub='Sub-Title',xlab='X Axis Lable',ylab='Y Axis Label')
plot(1,1,main=expression("Title"^2))
plot(1,1,main=expression("title"[2]))
plot(x,y,xlab=expression(paste("Greek Letter ",phi)))
plot(x,y,xlab=expression(paste("Greek Letter ",mu)))

plot (x,y,main=expression('Main Title'^2),sub=expression('Sub-Title'[2]),xlab='X Axis Label',ylab='Y Axis Label',col.lab="blue",cex.lab=0.75)


plot(x,y,xaxt='n',yaxt='n',ann=F)

plot(x,y,axes=F)
box()
axis(2,las=2)
axis(1,las=0)

plot(x,y,axes=F,ann=F)
axis(3)
axis(4)
box()
