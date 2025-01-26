#see
#https://github.com/easystats/see
#Model Visualisation Toolbox for ‘easystats’ and ‘ggplot2’
pacman::p_load(tidyverse, ggplot2, see)

library(parameters)
library(see)

model <- lm(wt ~ am * cyl, data = mtcars)

plot(parameters(model))

model <- lm(wt ~ am * cyl, data = mtcars)
model
plot(parameters(model)) + ggplot2::labs(title = "A Dot-and-Whisker Plot")


library(bayestestR)
library(rstanarm)
library(see)

set.seed(123)
model <- stan_glm(wt ~ mpg, data = mtcars, refresh = 0)
result <- hdi(model, ci = c(0.5, 0.75, 0.89, 0.95))

plot(result)

library(performance)
library(see)
model <- lm(wt ~ mpg, data = mtcars)
check <- check_normality(model)

plot(check, type = "qq")


library(effectsize)
library(see)

model <- aov(wt ~ am * cyl, data = mtcars)

plot(omega_squared(model))


library(modelbased)
library(see)
library(emmeans)
data(mtcars)
mtcars$gear <- as.factor(mtcars$gear)
model <- lm(mpg ~ wt * gear, data = mtcars)

predicted <- estimate_expectation(model, data = "grid")
plot(predicted)

means <- estimate_means(model)
plot(means)

library(correlation)
library(see)

results <- summary(correlation(iris))

plot(results, show_data = "points")


ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, color = Species)) + geom_point2() +  theme_modern()

p <- ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, color = Species)) + geom_point2()

p + theme_lucid()


p + theme_blackboard()

p + theme_abyss()

#Palettes------
p1 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +  geom_boxplot() +   theme_modern(axis.text.angle = 45) + scale_fill_material_d()
p1

p2 <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + geom_violin() + theme_modern(axis.text.angle = 45) +  scale_fill_material_d(palette = "ice")
p2

p3 <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Sepal.Length)) + geom_point2() + theme_modern() + scale_color_material_c(palette = "rainbow")
p3

plots(p1, p2, p3, n_columns = 2)

#The plots() function can also be used to add tags (i.e., labels for subfigures).

plots(p1, p2, p3, n_columns = 2, tags = paste("Fig. ", 1:3))

#Better looking points
#geom_points2() and geom_jitter2() allow points without borders and contour.

normal <- ggplot(iris, aes(x = Petal.Width, y = Sepal.Length)) + geom_point(size = 8, alpha = 0.3) +   theme_modern()
normal

new <- ggplot(iris, aes(x = Petal.Width, y = Sepal.Length)) + geom_point2(size = 8, alpha = 0.3) +   theme_modern()
new
plots(normal, new, n_columns = 2)


#Half-violin Half-dot plot
#Create a half-violin half-dot plot, useful for visualising the distribution and the sample size at the same time.

ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + geom_violindot( fill_dots = "black") + theme_modern() + scale_fill_material_d()



#Radar chart (Spider plot)
library(poorman)
library(datawizard)

# prepare the data in tidy format
data <- iris %>%   group_by(Species) %>%   summarise(across(everything(), mean)) %>%   reshape_longer(c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))
data
data %>% ggplot( aes( x = name, y = value,  color = Species, group = Species,  fill = Species )) +  geom_polygon(linewidth = 1, alpha = 0.1) + coord_radar() +   theme_radar()
