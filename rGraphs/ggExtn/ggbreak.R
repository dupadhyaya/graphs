# ggbreak
#https://github.com/rivasiker/ggHoriPlot
pacman::p_load(tidyverse, ggplot2, ggbreak)

p <- ggplot(economics, aes(x=date, y = unemploy, colour = uempmed)) +   geom_line()

p + scale_wrap(n=4)

ggplot(mpg, aes(class, hwy)) +   geom_boxplot() + scale_wrap(n = 2)

set.seed(2019-01-19)
d <- data.frame(  x = 1:20,   y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22))
d
summary(d)
p <- ggplot(d, aes(x, y)) + geom_col()

p + scale_y_cut(breaks=c(7, 18), which=c(1, 3), scales=c(3, 0.5))

#------
set.seed(2019-01-19)
d <- data.frame(x = 1:20, y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22))
d
p1 <- ggplot(d, aes(y, x)) + geom_col(orientation="y")
p1

d2 <- data.frame(x = c(2, 18), y = c(7, 26), label = c("hello", "world"))
d2
p2 <- p1 + scale_x_break(c(7, 17)) +  geom_text(aes(y, x, label=label), data=d2, hjust=1, colour = 'firebrick')  +  xlab(NULL) + ylab(NULL) + theme_minimal()
p2
p1 + p2

#Feature 2: Multiple break-points are supported
p2 + scale_x_break(c(18, 21))
p2 + scale_x_break(c(20,25))

#Feature 3: Zoom in or zoom out of subplots
p1 + scale_x_break(c(7, 17), scales = 1.5) + scale_x_break(c(18, 21), scales=5)

#Feature 4: Support reverse scale
g <- ggplot(d, aes(x, y)) + geom_col()
g
g2 <- g + scale_y_break(c(7, 17), scales = 1.5) +  scale_y_break(c(18, 21), scale=2) + scale_y_reverse()
g2
g + g2

#Feature 5: Compatible with scale transform functions
#Users can apply scale transform functions, such as scale_x_log10 and scale_x_sqrt, to axis break plot.

p2 <- p1 + scale_x_break(c(7, 17)) 
p2
p3 <- p1 + scale_x_break(c(7, 17)) + scale_x_log10()
p3
p2 + p3

#Feature 6: Compatible with coord_flip
g
g + coord_flip()
g + coord_flip() + scale_y_break(c(7, 18))

#Feature 7: Compatible with facet_grid and facet_wrap
set.seed(2019-01-19)
d <- data.frame( x = 1:20, y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22), group = c(rep("A", 10), rep("B", 10)), face=c(rep("C", 5), rep("D", 5), rep("E", 5), rep("F", 5)))

p <- ggplot(d, aes(x=x, y=y)) + geom_col(orientation="x") + scale_y_reverse() +   facet_wrap(group~.,    scales="free_y", strip.position="right", nrow=2 ) + coord_flip()
p
pg <- p + scale_y_break(c(7, 17), scales="free") + scale_y_break(c(19, 21), scales="free")
print(pg)

#Feature 8: Compatible with legends
pg <- pg + aes(fill=group) + theme(legend.position = "bottom")
print(pg)


#Feature 9: Supports all plot labels
pg + labs(title="test title", subtitle="test subtitle", tag="A tag", caption="A caption") +   theme_bw() +   theme(
    legend.position = "bottom",
    strip.placement = "outside",
    axis.title.x=element_text(size=10),
    plot.title = element_text(size = 22),
    plot.subtitle = element_text(size = 16),
    plot.tag = element_text(size = 10),
    plot.title.position = "plot",
    plot.tag.position = "topright",
    plot.caption = element_text(face="bold.italic"),
    
  )

#Feature 10: Allows setting tick labels for subplots
require(ggplot2)
library(ggbreak)
set.seed(2019-01-19)
d <- data.frame(x = 1:20, y =  c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22), group = c(rep("A", 10), rep("B", 10)))
d
p <- ggplot(d, aes(x=x, y=y)) + scale_y_reverse() + scale_x_reverse() + geom_col(aes(fill=group)) +  scale_fill_manual(values=c("#00AED7", "#009E73")) +  facet_wrap(  group~., scales="free_y", strip.position="right", nrow=2 ) + coord_flip()                                
p + scale_y_break(c(7, 10), scales=0.5, ticklabels=c(10, 11.5, 13)) + scale_y_break(c(13, 17), scales=0.5, ticklabels=c(17, 18, 19)) + scale_y_break(c(19,21), scales=1, ticklabels=c(21, 22, 23))


#Feature 11: Compatible with dual axis
p <- ggplot(mpg, aes(displ, hwy)) + geom_point() + scale_y_continuous( "mpg (US)", sec.axis = sec_axis(~ . * 1.20, name = "mpg (UK)")  ) +   theme(     axis.title.y.left = element_text(color="deepskyblue"),     axis.title.y.right = element_text(color = "orange") )
p1 <- p + scale_y_break(breaks = c(20, 30))
p2 <- p + scale_x_break(breaks = c(3, 4))
p1 + p2


#library(patchwork)

set.seed(2019-01-19)
d <- data.frame(  x = 1:20, y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22) )
d
p <- ggplot(d, aes(x, y)) + geom_col()
p
x <- p+scale_y_break(c(7, 17 ))
x
x + p

#Wrap plot
#The scale_wrap() function wraps a ‘gg’ plot over multiple rows to make plots with long x-axes easier to read.

p <- ggplot(economics, aes(x=date, y = unemploy, colour = uempmed)) +
  geom_line()
p
p + scale_wrap(n=4)

#Both categorical and numerical variables are supported.
ggplot(mpg, aes(class, hwy)) +  geom_boxplot() +  scale_wrap(n = 2)


#Cut plot
#The scale_x_cut or scale_y_cut cuts a ‘gg’ plot to several slices with the ability to specify which subplots to zoom in or zoom out.

library(ggplot2)
library(ggbreak)
set.seed(2019-01-19)
d <- data.frame(   x = 1:20,   y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22) )
p <- ggplot(d, aes(x, y)) + geom_col()
p
p + scale_y_cut(breaks=c(7, 18), which=c(1, 3), scales=c(5, 1))


#Adjust the amount of space between subplots
#The space parameter in scale_x_break(), scale_y_break(), scale_x_cut() and scale_y_cut() allows user to control the space between subplots.

p + scale_y_cut(breaks=c(7, 18), which=c(1, 3), scales=c(3, 0.5), space=.5)
library(ggimage)
#Place legend at any position
## original plot
p1 <- ggplot(mpg, aes(displ, hwy, color=factor(cyl))) + geom_point()

## ggbreak plot without legend
p2 <- p1 + scale_x_break(c(3, 4)) + theme(legend.position="none") 

## extract legend from original plot
leg = cowplot::get_legend(p1)

## redraw the figure
p3 <- ggplotify::as.ggplot(print(p2))

## place the legend 
p3 + ggimage::geom_subview(x=.9, y=.8, subview=leg)


#Note
#The features we introduced for scale_x_break and scale_y_break also work for scale_wrap, scale_x_cut and scale_y_cut.

#FAQ
#Incompatible with functions that arrange multiple plots
#You can use aplot::plot_list() to arrange ggbreak objects with other ggplot objects. For other functions, such as cowplot::plot_grid() and gridExtra::grid.arrange(), you need to explictly call print() to ggbreak object, see also https://github.com/YuLab-SMU/ggbreak/issues/36.

#Using print() is a secret magic to make ggbreak compatible with other packages, including export.