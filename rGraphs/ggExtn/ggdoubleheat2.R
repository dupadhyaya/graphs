#ggDoubleHeat
#https://pursuitofdatascience.github.io/ggDoubleHeat/
#install.packages("ggDoubleHeat")
library(ggDoubleHeat)
#devtools::install_github("PursuitOfDataScience/ggDoubleHeat")
library(ggDoubleHeat)
library(ggplot2)
pitts_tg

#The ggDoubleHeat package is a ggplot2 extension that provides visualization for data from two different sources on a modified heat map. All functions from the package are named as geom_heat_*(). A regular heat map, which can be made by using geom_tile() from ggplot2, contains three dimensions (variables). geom_heat_*(), however, can express four dimensions of data on a single plot

ggplot(data = pitts_tg, aes(x = week, y = category)) +  geom_heat_grid(outside = Google, inside = Twitter) +  ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")

ggplot(data = pitts_tg, aes(x = week, y = category)) +   geom_heat_circle(outside = Google, inside = Twitter) +   ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")

ggplot(data = pitts_tg, aes(x = week, y = category)) +   geom_heat_tri(lower = Google, upper = Twitter) +   ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")

library(ggtext)
library(png)
#notworking
head(pitts_tg)
ggplot(data = pitts_tg, aes(x = week, y = category)) +   geom_heat_grid(outside = Google, inside = Twitter) +  annotate("richtext", x = rep(c(1:30), 9), y = rep(1:9, each = 30),  label = pitts_emojis, label.color = NA, fill = NA, size = 0.3) +  ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")
pitts_emojis
