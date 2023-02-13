# ggplot - Tile - raster
#https://ggplot2.tidyverse.org/reference/geom_spoke.html

pacman::p_load(ggplot2, dplyr)

df <- expand.grid(x = 1:10, y=1:10)

set.seed(1)
df$angle <- runif(100, 0, 2*pi)
df$speed <- runif(100, 0, sqrt(0.1 * df$x))

ggplot(df, aes(x, y)) + geom_point() + geom_spoke(aes(angle = angle), radius = 0.5)

ggplot(df, aes(x, y)) +  geom_point() +   geom_spoke(aes(angle = angle, radius = speed))
