#ggtext
#https://wilkelab.org/ggtext/
#Improved text rendering support for ggplot2
#install.packages("ggtext")
#remotes::install_github("wilkelab/ggtext")
pacman::p_load(tidyverse, ggplot2, ggtext)

#The ggtext package defines two new theme elements, element_markdown() and element_textbox(). Both behave similarly to element_text() but render the provided text as markdown/html. 
#element_markdown() is meant as a direct replacement for element_text(), and it renders text without word wrapping. To start a new line, use the <br> tag or add two spaces before the end of a line.

library(tidyverse)
library(ggtext)
library(glue)

data <- tibble(   bactname = c("Staphylococcaceae", "Moraxella", "Streptococcus", "Acinetobacter"),   OTUname = c("OTU 1", "OTU 2", "OTU 3", "OTU 4"),   value = c(-0.5, 0.5, 2, 3) )
data
data %>% mutate ( color = c("#009E73", "#D55E00", "#0072B2", "#000000"),  name = glue("<i style='color:{color}'>{bactname}</i> ({OTUname})"), name = fct_reorder(name, value) )  %>%   ggplot(aes(value, name, fill = color)) +    geom_col(alpha = 0.5) +    scale_fill_identity() +   labs(caption = "Example posted on **stackoverflow.com**<br>(using made-up data)") +   theme(axis.text.y = element_markdown(), plot.caption = element_markdown(lineheight = 2)   )

library(jpeg)
labels <- c(   setosa = "<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Iris_setosa.JPG/180px-Iris_setosa.JPG' width='100' /><br>*I. setosa*",   virginica = "<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Iris_virginica_-_NRCS.jpg/320px-Iris_virginica_-_NRCS.jpg' width='100' /><br>*I. virginica*",  versicolor = "<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/20140427Iris_versicolor1.jpg/320px-20140427Iris_versicolor1.jpg'  width='100' /><br>*I. versicolor*")
labels

ggplot(iris, aes(Species, Sepal.Width)) + geom_boxplot() + scale_x_discrete( name = NULL, labels = labels ) + theme( axis.text.x = element_markdown(color = "black", size = 11) )

#----
#----

library(cowplot)

ggplot(mpg, aes(cty, hwy)) +  geom_point() +   facet_wrap ( ~class) + theme_half_open(12) + background_grid() +   theme ( strip.background = element_blank(), strip.text = element_textbox (   size = 12, color = "white", fill = "#5D729D", box.color = "#4A618C", halign = 0.5, linetype = 1, r = unit(5, "pt"), width = unit(1, "npc"), padding = margin(2, 0, 1, 0), margin = margin(3, 3, 3, 3) ) )
