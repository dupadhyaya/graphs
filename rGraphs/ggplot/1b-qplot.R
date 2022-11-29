#qplot : par and theme
#continue from 1a-qplot.R

library(ggplot2)
df = mtcars
df$gear = factor(df$gear)
df$am = factor(df$am)
df$cyl = factor(df$cyl)
p = qplot(hp, mpg, data=df, shape=am, color=am, facets = gear ~ cyl)
p

# White background and black grid lines
p + theme_bw()

# Large brown bold italics labels# and legend placed at top of plot
p + theme(axis.title=element_text(face="bold.italic", size="12", color="brown"), legend.position="top")
