#ggplot  - images in bar plots
#NOT WORKING

library(grid)
library(gridSVG)
require(ggplot2)

p <- ggplot(df3, aes(what, units)) + 
  geom_bar(colour="black", stat="identity") +
  coord_flip()

pattern <- pattern(circleGrob(r=.4, gp=gpar(fill="grey")),
                   width=.05, height=.05)
registerPatternFill("circles", pattern)
gridsvg("pattern.svg")
print(p)
grid.force()
grid.patternFill("geom_rect.rect", grep=TRUE, group=FALSE,
                 label=rep("circles", length(levels(df3$what))))
dev.off()
