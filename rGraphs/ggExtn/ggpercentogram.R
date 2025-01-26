#ggpercentogram
#https://github.com/eliocamp/ggpercentogram
#remotes::install_github("eliocamp/ggpercentogram")

library(ggplot2)
library(ggpercentogram) 

ggplot(diamonds, aes(carat)) +   geom_percentogram()
