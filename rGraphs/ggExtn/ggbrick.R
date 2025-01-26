#ggbrick
#https://github.com/doehm/ggbrick
library(dplyr)
library(ggplot2)
library(ggbrick)

# basic usage
mpg |>   count(class, drv) |>   ggplot() +   geom_brick(aes(class, n, fill = drv)) +   coord_brick()
mpg |>   count(class, drv) |>   ggplot() +   geom_brick(aes(class, n, fill = drv), bricks_per_layer = 6) +  coord_brick(6)

mpg |>  count(class, drv) |>   ggplot() +   geom_brick(aes(class, n, fill = drv), gap = 0.04) + coord_brick() + coord_flip()

mpg |> count(class, drv) |>  ggplot() + geom_brick0(aes(class, n, fill = drv)) + coord_brick() 

mpg |> count(class, drv) |> ggplot() + geom_brick(aes(class, n, fill = drv), type ="soft_random") +   coord_brick()
mpg |> count(class, drv) |> ggplot() + geom_brick(aes(class, n, fill = drv), type ="random") +   coord_brick()

mpg |> count(class, drv) |> ggplot() + geom_waffle(aes(class, n, fill = drv), type ="random") +   coord_brick()

mpg |> count(class, drv) |> ggplot() + geom_waffle(aes(class, n, fill = drv), bricks_per_layer = 4) +   coord_brick(4)

mpg |> count(class, drv) |> ggplot() + geom_waffle0(aes(class, n, fill = drv)) +   coord_flip() + theme(aspect.ratio = 1.8)

head(mpg)
summary(mpg)
mtcars %>% count(gear, cyl) %>% summary()
mtcars %>% count(gear, cyl) %>% mutate(cyl = as.character(cyl)) %>% ggplot() + geom_brick(aes(gear, n, fill = cyl), bricks_per_layer = 4) +   coord_brick() + geom_text(aes(label = cyl))

mtcars %>% mutate(gear= factor(gear), cyl = factor(cyl)) %>% count(gear, cyl) %>%   ggplot() +   geom_brick(aes(gear, n, fill = cyl)) +   coord_brick()


library(ggbrickr)
df <- data.frame(x = LETTERS[1:10], y = sample(2:10, 10, replace = TRUE))
df
#For official LEGO colors, use with scale_fill_brick and theme_brick.
ggplot(df, aes(x, y)) +
  geom_brick_col(aes(fill = x), two_knob = FALSE, label = "LEGO", label_scale = 0.9) +
  scale_fill_brick() +
  coord_brick() +
  theme_brick()
