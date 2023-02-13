# ggplot - jitter
#https://ggplot2.tidyverse.org/reference/position_jitter.html

pacman::p_load(ggplot2, dplyr)

# Jittering is useful when you have a discrete position, and a relatively# small number of points # take up as much space as a boxplot or a bar
ggplot(mpg, aes(class, hwy)) +  geom_boxplot(colour = "grey50") +
  geom_jitter()

# If the default jittering is too much, as in this plot:
ggplot(mtcars, aes(am, vs)) +  geom_jitter()


# You can adjust it in two ways
ggplot(mtcars, aes(am, vs)) +   geom_jitter(width = 0.1, height = 0.1)

ggplot(mtcars, aes(am, vs)) +  geom_jitter(position = position_jitter(width = 0.1, height = 0.1))

# Create a jitter object for reproducible jitter:
jitter <- position_jitter(width = 0.1, height = 0.1)
ggplot(mtcars, aes(am, vs)) +   geom_point(position = jitter) + geom_point(position = jitter, color = "red", aes(am + 0.2, vs + 0.2))
