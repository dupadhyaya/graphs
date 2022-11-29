#Margins in Graphs

hist(mtcars$mpg)
op <- par(mar = c(5,7,4,2) + 0.1) ## default is c(5,4,4,2) + 0.1

hist(mtcars$mpg, breaks=7, xlim=c(10,40), ylim=c(0,10) ,
     col=rainbow(7), labels=T, 
     main=paste('Histogram of MPG'))
par(op)
hist(mtcars$mpg, breaks=7)

#Try setting the first value of mgp larger. You'll want to make the margins bigger too, with mar
?par
par(mgp=c(5,1,0)) # Margin Line in mex units for axis title, labels, line
# mgp[1] - title, 2,3 - axis, default c(3,1,0)
par(mar=c(5,6,4,2)+0.1)
hist(mtcars$mpg, breaks=7)
par(mar=c(5,4,4,2)+0.1)
par(mgp=c(3,2,0))
hist(mtcars$mpg, breaks=7)



par( mar=c(m1, m2, m3, m4) ) 
For example:
  
  par( mar=c(3.1, 4.7, 2.3, 0)) 
where m1 to m4 are margins for four sides (1=bottom, 2=left, 3=top and 4=right).

Then, when plotting, set main="", xlab="" and ylab="" (otherwise their text will overlap with this new text)

Finally, using mtext(), set the axis titles and diagram title manually:

par(op)
  mtext(side=1, text="X axes title", line=0.5)
mtext(side=2, text="Y axes title", line=3)
mtext(side=3, text="Diagram title", line=1.5)