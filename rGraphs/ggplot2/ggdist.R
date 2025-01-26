# ggdist

pacman::p_load(ggplot2, dplyr, ggdist, ggridges)


head(iris)
iris %>% ggplot(., aes(x=Sepal.Length, y=Species, fill=Species)) + geom_dotsinterval(side='bottom', scale=.5, position = position_nudge(y = 0.1)) + stat_slab(scale=.5, position = position_nudge(y = 0.07)) +  labs(title = "Sepal Length by Species", x = "Sepal Length", y = "Species") + scale_fill_manual(values = c("#FF0000", "#00FF00", "#0000FF")) + geom_boxplot(width = 0.1, outlier.shape = NA)


#ggridges----
iris %>% ggplot(., aes(x=Sepal.Length)) +  geom_density_ridges(aes(y=Species, fill=Species), alpha=0.6, scale=0.9, rel_min_height=0.01) +   theme_ridges() +   theme(legend.position = "top") +   labs(title = "Sepal Length by Species", x = "Sepal Length", y = "Species") +   scale_fill_manual(values = c("#FF0000", "#00FF00", "#0000FF"))

??geom_density_ridges
