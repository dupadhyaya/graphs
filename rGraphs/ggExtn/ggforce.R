#ggforce
#https://github.com/thomasp85/ggforce

pacman::p_load(tidyverse, ggplot2, ggforce)
library(ggforce)

#> Loading required package: ggplot2
g1 <- ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) + geom_point()
g1 + facet_zoom(x = Species == "versicolor")
g1 + facet_zoom(x = Species == "setosa")
