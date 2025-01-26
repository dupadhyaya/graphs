# Error Bars

#Line Segments-------
#Add Line Segments to a Plot
?segments
segments(x_start, y_start, x_end, y_end)
segments(x0, y0, x1 = x0, y1 = y0,
         col = par("fg"), lty = par("lty"), lwd = par("lwd"),
         ...)
bf
x = unlist(bf[,1])
y = unlist(bf[,2])
z = unlist(bf[,3])
x;y;z
(bf.m = apply(bf,2,mean)) # Columnwise
(bf.m = apply(bf,2,mean, na.rm=T))
(bf.sd = apply(bf,2,sd, na.rm=T))
(bf.sum = apply(bf,2, sum, na.rm=T))
(bf.l = bf.sum/bf.m)  # No of Observation ; length does not work here
# SE = SE/n
(bf.se = bf.sd/bf.l )  # Std Error
boxplot(bf, col=NULL)
bardensity <- t(t(c(10,10,10))) 
barangle <- t(t(c(45,135,100))) 
barplot(bf.m, density = bardensity, angle = barangle)
?barplot
# Heights have +/- values of Std Error a top 
bf.m
bf.se
(bf.m + bf.se)
ylim=round(max(bf.m + bf.se) + 1,0)  # ylim to be max of bars height + extra
ylim

(bp= barplot(bf.m, ylim=c(0,ylim),
  density = bardensity, angle = barangle)
barplot(bf.m, ylim=c(0,ylim),
          density = bardensity, angle = barangle)
bp  # x axis positions (mid points)
#segments(x_start, y_start, x_end, y_end)
segments(bp,bf.m+bf.se, bp,bf.m-bf.se)
# Cross Bars
segments(bp-0.1,bf.m+bf.se, bp+0.1,bf.m+bf.se)
segments(bp-0.1,bf.m-bf.se, bp+0.1,bf.m-bf.se)
#box
box()
title(xlab=' Site - Habitat', ylab=' Butterfly Abundance')
abline(h=0)
