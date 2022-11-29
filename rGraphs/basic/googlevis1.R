####################
#                  #
#    Exercise 1    #
#                  #
####################

#install.packages("googleVis")
library(googleVis)

####################
#                  #
#    Exercise 2    #
#                  #
####################


df=data.frame(name=c("James", "Curry", "Harden"),
              Pts=c(20,23,34),
              Rbs=c(13,7,9))
df
####################
#                  #
#    Exercise 3    #
#                  #
####################


LineC <- gvisLineChart(df)
LineC
####################
#                  #
#    Exercise 4    #
#                  #
####################

library(googleVis)
df=data.frame(name=c("James", "Curry", "Harden"),
              Pts=c(20,23,34),
              Rbs=c(13,7,9))
LineC <- gvisLineChart(df)
plot(LineC)

####################
#                  #
#    Exercise 5    #
#                  #
####################

library(googleVis)
df=data.frame(name=c("James", "Curry", "Harden"),
              Pts=c(20,23,34),
              Rbs=c(13,7,9))
LineC2 <- gvisLineChart(df, "name", c("Pts","Rbs"), )
plot(LineC2)

####################
#                  #
#    Exercise 6    #
#                  #
####################



LineC2 <- gvisLineChart(df, "name", c("Pts","Rbs"),
                        options=list(
                          series="[{targetAxisIndex: 0},
                          {targetAxisIndex:1}]",
                          vAxes="[{title:'Pts'}, {title:'Rbs'}]"
                        ))
plot(LineC2)

####################
#                  #
#    Exercise 7    #
#                  #
####################

library(googleVis)
df=data.frame(name=c("James", "Curry", "Harden"),
              Pts=c(20,23,34),
              Rbs=c(13,7,9))
BarC <- gvisBarChart(df)
BarC
####################
#                  #
#    Exercise 8    #
#                  #
####################

library(googleVis)
df=data.frame(name=c("James", "Curry", "Harden"),
              Pts=c(20,23,34),
              Rbs=c(13,7,9))
BarC <- gvisBarChart(df)
plot(BarC)

####################
#                  #
#    Exercise 9    #
#                  #
####################

library(googleVis)
df=data.frame(name=c("James", "Curry", "Harden"),
              Pts=c(20,23,34),
              Rbs=c(13,7,9))
ColumnC <- gvisColumnChart(df)

####################
#                  #
#    Exercise 10   #
#                  #
####################

library(googleVis)
df=data.frame(name=c("James", "Curry", "Harden"),
              Pts=c(20,23,34),
              Rbs=c(13,7,9))
ColumnC <- gvisColumnChart(df)
plot(ColumnC)
