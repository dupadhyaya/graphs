#gganimate

pacman::p_load(ggplot2, gganimate, dplyr)


gga1 <- iris %>% ggplot(., aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point(size=5) + transition_states(Species, transition_length = 1, state_length = 1.5) + labs(title = "Sepal Length by Sepal Width", x = "Sepal Length", y = "Sepal Width") + theme_minimal() + theme(legend.position = "top")

animate(gga1, renderer = gifski_renderer())
