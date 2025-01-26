# ggplot extn - ggreveal
#https://nrennie.rbind.io/ggflowchart/articles/decision-tree-example.html

pacman::p_load(tidyverse, ggplot2, ggreveal, palmerpenguins)


p <-  ggplot(penguins[!is.na(penguins$sex),],  aes(body_mass_g, bill_length_mm, group=sex, color=sex)) + geom_point() + geom_smooth(method="lm", formula = 'y ~ x', linewidth=1) +   facet_wrap(~species) +   theme_minimal()
p

plot_list <- reveal_groups(p)
plot_list


data("mtcars")
p1 <- ggplot(mtcars,  aes(mpg, wt)) + geom_point() 

p2 <- p1 + geom_smooth(method="lm", formula="y~x") 
p2
