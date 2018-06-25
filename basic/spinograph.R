# Spinograph

library(vcd)
attach(Arthritis)

counts= table(Treatment,Improved)
counts
spine(counts)
spine(Treatment,Improved, 
      gp=gpar(fill= c("red",'blue','violet'),
              col='green',lty=1, lwd=3))
?spine
levels(Improved)
?gpar

library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)
p <- qplot(1,1)
p2 <- xyplot(1~1)
r <- rectGrob(gp=gpar(fill="grey90"))
t <- textGrob("text")
grid.arrange(t, p, p2, r, ncol=2)
