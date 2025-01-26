#geomtextpath
#https://allancameron.github.io/geomtextpath/
# install.packages("remotes")
#remotes::install_github("AllanCameron/geomtextpath")
pacman::p_load(tidyverse, ggplot2, geomtextpath)


# Set a consistent theme for the plots here
theme_set(theme_minimal() +   theme(axis.line = element_line(size = 0.25, colour = "gray75")))

t <- seq(5, -1, length.out = 1000) * pi

spiral <- data.frame(x    = sin(t) * 1:1000,   y    = cos(t) * 1:1000, text = paste("Like a circle in a spiral,", "like a wheel within a wheel,", "never ending or beginning,", "on an ever spinning reel"))
spiral

ggplot(spiral, aes(x, y, label = text)) + geom_textpath(size = 7, vjust = 2, text_only = TRUE) + coord_equal(xlim = c(-1500, 1500), ylim = c(-1500, 1500))

#If we want our text in a box, even when the text is curved, we can use geom_labelpath instead:


set.seed(5)
x
df <- data.frame(x = spline(1:5, runif(5), xout = seq(1, 5, 1/100))$y, y = spline(1:5, runif(5), xout = seq(1, 5, 1/100))$y,  z = "A curved textbox on an arbitrary path")
df
ggplot(df, aes(x, y, label = z)) + geom_labelpath(size = 5, fill = "#F6F6FF")

ggplot(pressure, aes(temperature, pressure)) +   geom_textline(label = "Mercury vapor pressure", size = 6, vjust = -0.5, linewidth = 1, linecolor = "red4", linetype = 2,  color = "deepskyblue4")

ggplot(pressure, aes(temperature, pressure)) +   geom_labelline(label = "Mercury vapor pressure", size = 6, vjust = -0.5, linewidth = 1, linecolor = "red4", linetype = 2,  color = "deepskyblue4")

#geom_textdensity and geom_labeldensity
#These are the analogues of geom_density that allows for smoothly curved labels on density plots

ggplot(iris, aes(x = Sepal.Length, colour = Species, label = Species)) + geom_textdensity(size = 6, fontface = 2, hjust = 0.2, vjust = 0.3) + theme(legend.position = "none")


#geom_textsmooth and geom_labelsmooth
#We can use these geoms to get labelled trend lines through scatterplots:
  
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) + geom_point(alpha = 0.3) + geom_labelsmooth(aes(label = Species), text_smoothing = 30, fill = "#F6F6FF", method = "loess", formula = y ~ x, size = 4, linewidth = 1, boxlinewidth = 0.3) +   scale_colour_manual(values = c("forestgreen", "deepskyblue4", "tomato4")) +   theme(legend.position = "none")


#ReferenceLine------
ggplot(mtcars, aes(mpg, disp)) +   geom_point() +  geom_texthline(yintercept = 200, label = "displacement threshold",   hjust = 0.8, color = "red4") + geom_textvline(xintercept = 20, label = "consumption threshold", hjust = 0.8, linetype = 2, vjust = 1.3, color = "blue4") + geom_textabline(slope = 15, intercept = -100, label = "partition line",   color = "green4", hjust = 0.6, vjust = -0.2)
