#ggdaynight
#https://github.com/GabrielSlPires/ggdaynight
#ggdaynight is a package that provides a ggplot2 theme for day-night plots. It is designed to be used with ggplot2 to create plots that show the day-night cycle. The package provides a theme that can be used with ggplot2 to create plots that show the day-night cycle. The theme provides a background that changes color based on the time of day, and it also provides a color palette that is optimized for day-night plots. The package is designed to be easy to use, and it provides a number of options for customizing the appearance of the plots.

library(ggplot2)
library(ggdaynight)

ggplot(daynight_temperature, aes(datetime, temperature)) +   geom_daynight() +   geom_point() +   theme_classic()

ggplot(daynight_temperature, aes(datetime, temperature)) +   geom_daynight() +   geom_point() + facet_wrap(vars(sensor)) +   theme_classic()

ggplot(daynight_temperature, aes(datetime, temperature, color = sensor)) +   geom_daynight() + geom_line(linewidth = 1) +   theme_classic()

ggplot(daynight_temperature, aes(datetime, temperature, group = sensor)) +   geom_daynight(day_fill = "yellow", night_fill = "blue",   sunrise = 5, sunset = 20, alpha = 0.5) + geom_line(linewidth = 1) +   theme_classic()
