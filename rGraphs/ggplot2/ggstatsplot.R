#ggstatsplot

pacman::p_load(ggplot2, dplyr, ggstatsplot)

head(iris)

iris %>% ggbetweenstats(x = Species, y = Sepal.Length, title = "Sepal Length by Species", xlab = "Species", ylab = "Sepal Length",  type = "np", ggtheme = theme_minimal())

?ggstatsplot

#ggpiestats()
iris %>% ggpiestats(x = Species, y = Sepal.Length, title = "Sepal Length by Species", xlab = "Species", ylab = "Sepal Length",  type = "np", ggtheme = theme_minimal())
