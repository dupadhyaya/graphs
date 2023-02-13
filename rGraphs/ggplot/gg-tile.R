# ggplot - Tile - raster

pacman::p_load(ggplot2, dplyr)

ggplot(faithfuld, aes(waiting, eruptions)) +   geom_raster(aes(fill = density))

ggplot(faithfuld, aes(waiting, eruptions)) +  geom_raster(aes(fill = density), interpolate = TRUE)


# If you want to draw arbitrary rectangles, use geom_tile() or geom_rect()
df <- data.frame(  x = rep(c(2, 5, 7, 9, 12), 2),
  y = rep(c(1, 2), each = 5),
  z = factor(rep(1:5, each = 2)),
  w = rep(diff(c(0, 4, 6, 8, 10, 14)), 2)
)
df
ggplot(df, aes(x, y)) +  geom_tile(aes(fill = z), colour = "grey50")

ggplot(df, aes(x, y, width = w)) +  geom_tile(aes(fill = z), colour = "grey50") + geom_text(aes(label=z))

ggplot(df, aes(xmin = x - w / 2, xmax = x + w / 2, ymin = y, ymax = y + 1)) +  geom_rect(aes(fill = z), colour = "grey50") + geom_text(aes(x=x-w/2, y=y+1, label=z))

# Justification controls where the cells are anchored
df <- expand.grid(x = 0:5, y = 0:5)
set.seed(1)
df$z <- runif(nrow(df))
# default is compatible with geom_tile()
ggplot(df, aes(x, y, fill = z)) +  geom_raster()

# zero padding
ggplot(df, aes(x, y, fill = z)) +  geom_raster(hjust = 0, vjust = 0)
