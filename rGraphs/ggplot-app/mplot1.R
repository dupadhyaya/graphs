
library(ggplot2)
library(mosaic)
library(mosaicData)
library(lubridate)
mPlot(mtcars, system = "ggplot")

data(package = "mosaicData")
?mplot
mPlot(Heightweight, system = "ggplot", multiplot=T)
mPlot(Galton, system = "ggplot")
mPlot(Births78, system = "ggplot")
mPlot(mtcars, which=1, ask=F)
