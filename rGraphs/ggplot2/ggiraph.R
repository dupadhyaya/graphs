# ggiraph

pacman::p_load(ggplot2, dplyr, ggiraph)

head(iris)

my_giraph  <- iris %>% arrange(Sepal.Length) %>% ggplot(., aes(x=Sepal.Length, y = Sepal.Width, color = Species)) + geom_point(size=1.5, color='black') + geom_line_interactive(aes(tooltip = Species, data_id = Species), linewidth =1) + geom_text(aes(label = Sepal.Width), nudge_x = 0.1, nudge_y = 0.1, size=3) 

girafe(ggobj = my_giraph) 
