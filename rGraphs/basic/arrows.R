# Adding Arrows to an Existing Graph

arrows(x0,y0,x1,y1, length = 0.25, angle=30, code=2)
# length of arrow head, start and end points, angle of head
# code - end of arrow 1,2,3 (both)

(bp= barplot(bf.m, ylim=c(0,ylim) )
  
barplot(bf.m, ylim=c(0,ylim))
#segments(x_start, y_start, x_end, y_end)
segments(bp,bf.m+bf.se, bp,bf.m-bf.se)
# Cross Bars
#segments(bp-0.1,bf.m+bf.se, bp+0.1,bf.m+bf.se)
#segments(bp-0.1,bf.m-bf.se, bp+0.1,bf.m-bf.se)
#instead of above 2 lines,
arrows(bp, bf.m+bf.se, bp, bf.m - bf.se, length=0.1, angle=90, code=3)

fw  # beginning R
plot(count ~ speed, data=fw, pch=15, col=palette())
s = seq(length(fw$speed) - 1)
s
arrows(fw$speed[s], fw$count[s], fw$speed[s+1], fw$count[s+1],
       length=0.15, angle=20, lwd=2, col='green')
fws= fw[order(fw$speed, decreasing=F),]
fws
plot(count ~ speed, data=fws, pch=15, col=palette())
arrows(fws$speed[s], fws$count[s], fws$speed[s+1], fws$count[s+1],
       length=0.15, angle=20, lwd=2, col='green')
