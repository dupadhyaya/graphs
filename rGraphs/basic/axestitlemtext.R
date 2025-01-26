# Axes Mtext Text
#Text can be added to graphs using the text( ) and mtext( ) functions. 
#text( ) places text within the graph while
#mtext( ) places text in one of the four margins.

#location	location can be an x,y coordinate. 
#Alternatively, the text can be placed interactively via mouse by specifying location as locator(1).
#pos	position relative to location. 1=below, 2=left, 3=above, 4=right. 
#If you specify pos, you can specify offset= in percent of character width.
#side	which margin to place text. 1=bottom, 2=left, 3=top, 4=right. 
#you can specify line= to indicate the line in the margin starting with 0 and moving out. you can also specify adj=0 for left/bottom alignment or 
#adj=1 for top/right alignment.
#Other common options are cex, col, and font (for size, color, and font style respectively).


#Text ---------
attach(mtcars)
plot(wt, mpg, main="Milage vs. Car Weight", 
     xlab="Weight", ylab="Mileage", pch=18, col="blue")
text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="red")
#You can add mathematically formulas to a graph using TEX-like rules. See help(plotmath) for details and examples.


#Axes -----------
axis(side, at=, labels=, pos=, lty=, col=, las=, tck=, ...)

#side	an integer indicating the side of the graph to draw the axis (1=bottom, 2=left, 3=top, 4=right)
#at	a numeric vector indicating where tic marks should be drawn
#labels	a character vector of labels to be placed at the tickmarks 
#(if NULL, the at values will be used)
#pos	the coordinate at which the axis line is to be drawn. 
#(i.e., the value on the other axis where it crosses)
#lty	line type
#col	the line and tick mark color
#las	labels are parallel (=0) or perpendicular(=2) to axis
#tck	length of tick mark as fraction of plotting region (negative number is outside graph, positive number is inside, 0 suppresses ticks, 1 creates gridlines) default is -0.01
#The option axes=FALSE suppresses both x and y axes. xaxt="n" and yaxt="n" suppress the x and y axis respectively
# A Silly Axis Example

# specify the data 
x <- c(1:10); y <- x; z <- 10/x

# create extra margin room on the right for an axis 
par(mar=c(5, 4, 4, 8) + 0.1)

# plot x vs. y 
plot(x, y,type="b", pch=21, col="red", 
     yaxt="n", lty=3, xlab="", ylab="")

# add x vs. 1/x 
lines(x, z, type="b", pch=22, col="blue", lty=2)

# draw an axis on the left 
axis(2, at=x,labels=x, col.axis="red", las=2)

# draw an axis on the right, with smaller text and ticks 
axis(4, at=z,labels=round(z,digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.01)

# add a title for the right axis 
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")

# add a main title and bottom and left axis labels 
title("An Example of Creative Axes", xlab="X values",
      ylab="Y=X")

# Minor Ticks -------------
library(Hmisc)
minor.tick(nx=n, ny=n, tick.ratio=n)
#nx is the number of minor tick marks to place between x-axis major tick marks.
#ny does the same for the y-axis. 
#tick.ratio is the size of the minor tick mark relative to the major tick mark. The length of the major tick mark is retrieved from par("tck").
