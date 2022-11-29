#TS Plot

library(astsa) 

head(gtemp_land)
str(gtemp_land)
plot(gtemp_land)    # it can't get simpler than that (not shown)
plot(gtemp_land, type='o', col=4)

plot(gtemp_land, ylab='Temperature Deviations', type='n')   # set up the plot
grid(lty=1, col=gray(.9))                                   # add a grid
lines(gtemp_land, type='o', col=4)

head(soi)
tsplot(soi, main='Southern Oscillation Index', col=4, nxm=5)


gtemp.df = data.frame(Time=c(time(gtemp_land)), gtemp=c(gtemp_land))
# strip the ts attributes
gtemp.df
str(gtemp.df)
ptemp = ggplot(data = gtemp.df,  aes(x=Time, y=gtemp) )  +  ylab('Temperature Deviations') +  geom_line(col="blue") +  geom_point(col="magenta", pch=1)
ptemp                                                        
