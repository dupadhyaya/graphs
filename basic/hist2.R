# Histogram
#http://homepage.divms.uiowa.edu/~luke/classes/STAT4580/histdens.html

library(MASS)
library(ggplot2)
hist(geyser$duration)
#histogram(~ duration, data = geyser)

ggplot(geyser) + geom_histogram(aes(x = duration))
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(geyser) +
  geom_histogram(aes(x = duration), binwidth = 0.5, fill = "grey", color = "black")

# Reduce binwidth
ggplot(geyser) +
  geom_histogram(aes(x = duration), binwidth = 0.05, fill = "grey", color = "black")



#-------------------

library(UsingR)
## Loading required package: HistData
## Loading required package: Hmisc
## Loading required package: survival
## Loading required package: Formula
## 
## Attaching package: 'Hmisc'
## The following objects are masked from 'package:base':
## 
##     format.pval, round.POSIXt, trunc.POSIXt, units
## 
## Attaching package: 'UsingR'
## The following object is masked from 'package:survival':
## 
##     cancer
hist(Galton$parent, freq = FALSE)
x <- seq(64, 74, length.out=100)
y <- with(Galton, dnorm(x, mean(parent), sd(parent)))
lines(x, y, col = "red")



#-------
p <- ggplot(Galton) +
  geom_histogram(aes(x = parent, y = ..density..),
                 binwidth = 1, fill = "grey", color = "black")
p


#-----
x <- seq(64, 74, length.out=100)
df <- with(Galton, data.frame(x = x, y = dnorm(x, mean(parent), sd(parent))))
p + geom_line(data = df, aes(x = x, y = y), color = "red")


#-----
histogram(~ parent, data = Galton, type = "density", panel = function(x, ...) {
  panel.histogram(x, ...)
  xn <- seq(min(x), max(x), length.out = 100)
  yn <- dnorm(xn, mean(x), sd(x))
  panel.lines(xn, yn, col = "red")
})



#Scalability
hist(diamonds$price)
plot(density(geyser$duration))

plot(density(geyser$duration, bw = 0.05))


#For a moderate number of observations a useful addition is a jittered rug plot:
  
plot(density(geyser$duration, bw = 0.05))
rug(jitter(geyser$duration))

#The lattice densityplot function by default adds a jittered strip plot of the data to the bottom:

densityplot(~ duration, data = geyser)

#To produce a density plot with a jittered rug in ggplot:

ggplot(geyser) +
  geom_density(aes(x = duration)) +
  geom_rug(aes(x = duration, y = 0), position = position_jitter(height = 0))

plot(density(diamonds$price))

#Both ggplot and lattice make it easy to show multiple densities for different subgroups in a single plot.  lattice uses the group argument:

densityplot(~ yield, group = site, data = barley, auto.key = TRUE)

#In ggplot you can map the group variable to an aesthetic, such as color:

ggplot(barley) + geom_density(aes(x = yield, color = site))

#Using fill and alpha can also be useful:

ggplot(barley) + geom_density(aes(x = yield, fill = site), alpha = 0.2)

#Lattice uses the term lattice plots or trellis plots. These plots are specified using the | operator in a formula:

densityplot(~ yield | site, data = barley)

#Comparison is facilitated by using common axes.

#These ideas can be combined:
  
densityplot(~ yield | site, group = year, data = barley, auto.key = TRUE)


#ggplot uses the notion of faceting:
  
ggplot(barley) + geom_density(aes(x = yield)) + facet_wrap(~site)

#Again this can be combined with the color aesthetic:

ggplot(barley) + geom_density(aes(x = yield, color = year)) + facet_wrap(~site)


#Interactive
source("http://homepage.divms.uiowa.edu/~luke/classes/STAT7400/examples/tkdens.R")
tkdens(geyser$duration)
tkdens(geyser$duration, tkrplot=TRUE)
tkdens(Galton$parent, tkrplot=TRUE)
