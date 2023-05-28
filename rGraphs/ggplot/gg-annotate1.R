#gg facet 

pacman::p_load(tidyverse, ggh4x, directlabels, egg)


#annotate facet areas----

df1 <- mtcars %>% group_by(gear, am)  %>% tally()
df1

df1$labels = sprintf('%s, %s gears', ifelse(df1$am == 0 ,'Auto', 'Manual'), df1$gear)
df1
head(df1)

g1 <- mtcars %>% ggplot(., aes(x=wt, y=mpg)) + geom_point() + facet_grid(am ~gear, scales='free')
g1
g1 + geom_text(size=5, data=df1, mapping = aes(x=Inf, y=Inf, label=labels), hjust=1.05, vjust=1)

df1A <- df1 %>% mutate(x=3, y=15)

g1 + geom_text(size=3, data=df1A, mapping = aes(x=x, y=y, label=labels), hjust=.5, vjust=.5)

tag_facet(g1)
g1B <- g1 + geom_text(size=3, data=df1A, mapping = aes(x=x, y=y, label=labels), hjust=.5, vjust=.5) 
tag_facet(g1B)
?tag_facet
tag_facet(g1B, y=-Inf, vjust=-1, tag_pool = LETTERS)

tagPool1 = paste0('G',1:5)
tag_facet(g1B, y=-Inf, vjust=-1, tag_pool = tagPool1)

tag_facet_outside(g1B)

#devtools::install_github("rensa/stickylabeller")
library(stickylabeller)

ggplot(mtcars, aes(qsec, mpg)) +    geom_point() +   facet_wrap(gear ~ am,    labeller = label_glue('({.l}) am = {am}')) +  theme_bw(base_size = 12)

?label_glue
p2 <- ggplot(mtcars, aes(x = disp, y = mpg)) + geom_point()
p2 + facet_grid(   gear ~ cyl,   labeller = label_glue(
    rows = '{gear} gears',     cols = '{cyl} cylinders'))

p2 + facet_grid(   gear ~ am,   labeller = label_glue(
  rows = '{gear} Gears',     cols = '{am} AM'))

