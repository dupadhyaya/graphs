# ggplot -  stat unique
#https://ggplot2.tidyverse.org/reference/stat_unique.html

pacman::p_load(ggplot2, dplyr)

stat_unique(  mapping = NULL,   data = NULL,  geom = "point",  position = "identity",   ...,   na.rm = FALSE,   show.legend = NA,   inherit.aes = TRUE )

ggplot(mtcars, aes(vs, am)) + geom_point(alpha = 0.1)

ggplot(mtcars, aes(vs, am)) + geom_point(alpha = 0.1) + stat_identity()

ggplot(mtcars, aes(vs, am)) +   geom_point(alpha = 0.6, stat = "unique")

ggplot(mtcars, aes(wt, mpg, color=factor(gear))) +   geom_point(alpha = 0.6, stat = "unique")
