#scattermore
#https://github.com/exaexa/scattermore


library(scattermore)
scattermoreplot(rnorm(1e7), rnorm(1e7),   col=heat.colors(1e7, alpha=.1),  main='Scattermore demo')

library(ggplot2)
library(scattermore)

# data
d <- cbind(rnorm(1e6),runif(1e6))
ggplot(data.frame(x=d[,1],y=d[,2])) +   geom_point(shape='.', alpha=.05, aes(x,y,color=y)) + scale_color_viridis_c(guide='none') +   ggtitle("geom_point")
# first plot (geom_point)
ggsave('point.png', units='in', width=3, height=3,
       ggplot(data.frame(x=d[,1],y=d[,2])) +
         geom_point(shape='.', alpha=.05, aes(x,y,color=y)) +
         scale_color_viridis_c(guide='none') +
         ggtitle("geom_point"))
