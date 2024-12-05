#ggpointless
#https://flrd.github.io/ggpointless/
#install.packages("ggpointless")
#devtools::install_github("flrd/ggpointless")

library(ggpointless)

#geom_pointless() let’s you highlight the first, or last observations, sample minimum and sample maximum to provide additional context. Or just some visual sugar. geom_pointless() behaves similar to geom_point() except that it has a location argument. You can set it to "first", "last" (default), "minimum", "maximum", and "all", where "all" is just shorthand to select "first", "last", "minimum" and "maximum".

cols <- c("#f4ae1b", "#d77e7b", "#a84dbd", "#311dfc")
theme_set(theme_minimal())

x <- seq(-pi, pi, length.out = 500)
y <- outer(x, 1:5, function(x, y) sin(x * y))

df1 <- data.frame( var1 = x,  var2 = rowSums(y) )
df1

ggplot(df1, aes(x = var1, y = var2)) + geom_line() + geom_pointless(aes(color = after_stat(location)), location = "all",  size = 3  ) + scale_color_manual(values = cols)

ggplot(df1, aes(x = var1, y = var2)) + geom_line() + geom_pointless(aes(color = after_stat(location)), location = c("last","first"),  size = 4  ) + scale_color_manual(values = cols)


#geom_lexis
df2 <- data.frame (  key = c("A", "B", "B", "C", "D"),   x = c(0, 1, 6, 5, 6),   xend = c(5, 4, 10, 8, 10) )
df2

ggplot(df2, aes(x = x, xend = xend, color = key)) + geom_lexis(aes(linetype = after_stat(type)), size = 2) +   coord_equal() +   scale_x_continuous(breaks = c(df2$x, df2$xend)) +  scale_color_manual(values = cols) +   scale_linetype_identity() +   theme(panel.grid.minor = element_blank())
