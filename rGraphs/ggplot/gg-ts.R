# ggplot TS
#https://cran.r-project.org/web/packages/ggfortify/vignettes/plot_ts.html

AirPassengers

library(ggplot2)
str(AirPassengers)
ggplot(data=AirPassengers, aes(y=AirPassengers)) + geom_point()
library(ggfortify)
autoplot(AirPassengers)

library(ggfortify)
autoplot(stl(AirPassengers, s.window = 'periodic'), ts.colour = 'blue')

library(timeSeries)
autoplot(as.timeSeries(AirPassengers), ts.colour = ('dodgerblue3'))
autoplot(AirPassengers, ts.geom = 'ribbon', fill = 'green')
