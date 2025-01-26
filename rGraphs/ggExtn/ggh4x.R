#ggh4x
#https://teunbrand.github.io/ggh4x/
# devtools::install_github("teunbrand/ggh4x")
pacman::p_load(tidyverse, ggplot2, ggh4x)


library(ggh4x)
#> Loading required package: ggplot2
library(scales)

df <- transform(iris, Nester = ifelse(Species == "setosa", "Short Leaves", "Long Leaves"))
df
# Basic plot
g <- ggplot(df, aes(Sepal.Width, Sepal.Length)) + theme_classic() + theme(strip.background = element_blank())
g
# For making a plot with multiple colour scales, we'd first need to make layers # with alternative aesthetics. We'll choose a colour scale for every species. # This will produce a few warnings, as ggplot2 doesn't know how to deal with # the alternative aesthetics.
g <- g +   geom_point(aes(SW = Sepal.Width),  data = ~ subset(., Species == "setosa")) + geom_point(aes(PL = Petal.Length),   data = ~ subset(., Species == "versicolor")) + geom_point(aes(PW = Petal.Width),  data = ~ subset(., Species == "virginica"))
g

g <- g + scale_colour_multi( aesthetics = c("SW", "PL", "PW"), name = list("Blue", "Pink", "Orange"), colours = list( brewer_pal(palette = "YlGnBu")(6), brewer_pal(palette = "RdPu")(6), scales::brewer_pal(palette = "YlOrRd")(6) ),  guide = guide_colorbar(barheight = unit(50, "pt")))
g


#nested------
# We can make a facet wherein duplicated strip labels are merged into one strip
g <- g +  facet_nested(~ Nester + Species, scales = "free", nest_line = TRUE)
g
# Like we did for colours, we might also want to set position scales for every
# panel individually. We set these in the same order the facets appear in.
position_scales <- list( scale_x_reverse(guide = "axis_minor"),scale_x_continuous(labels = dollar, guide = "axis_truncated"), scale_x_continuous(breaks = c(3, 4), expand = c(0,0)))

# Adding the list of scales to the plot
g <- g + facetted_pos_scales(x = position_scales)

# Setting the sizes of panels individually
size <- 2 / (1 + sqrt(5))
g <- g + force_panelsizes(cols = c(1, size, size ^ 2), respect = TRUE)
g
