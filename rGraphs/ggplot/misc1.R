#Misc

library(gplots)
# Plot the mean of teeth length by dose groups
ToothGrowth
plotmeans(len ~ dose, data = ToothGrowth, frame = FALSE)

plotmeans(mpg ~ gear, data=mtcars)

split(mtcars, mtcars$am)
sapply(mtcars, mean)

lapply(split(mtcars, mtcars$am),mean)
?sapply
split(mtcars[1:2],mtcars$am)
sapply(split(mtcars[1:2],mtcars$am), mean)

  
