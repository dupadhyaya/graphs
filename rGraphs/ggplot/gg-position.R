# ggplot -  geom_text
#https://ggplot2.tidyverse.org/reference/position_nudge.html

pacman::p_load(ggplot2, dplyr)


df <- data.frame(  x = c(1,3,2,5),   y = c("a","c","d","c"))

ggplot(df, aes(x, y)) +  geom_point() + geom_text(aes(label = y))

ggplot(df, aes(x, y)) +   geom_point() +   geom_text(aes(label = y), position = position_nudge(y = -0.1))

# Or, in brief
ggplot(df, aes(x, y)) +   geom_point() +   geom_text(aes(label = y), nudge_y = -0.1)


#geom_point-----
#position_jitterdodge(jitter.width = NULL, jitter.height = 0, dodge.width = 0.75, seed = NA )

set.seed(596)
dsub <- diamonds[sample(nrow(diamonds), 1000), ]
ggplot(dsub, aes(x = cut, y = carat, fill = clarity)) + geom_boxplot(outlier.size = 0) +   geom_point(pch = 21, position = position_jitterdodge())


#stack, fill-----
position_stack(vjust = 1, reverse = FALSE)
position_fill(vjust = 1, reverse = FALSE)
ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) +  geom_bar()

ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) +  geom_bar(position = "fill")

ggplot(diamonds, aes(price, fill = cut)) +   geom_histogram(binwidth = 500)

ggplot(diamonds, aes(price, fill = cut)) +   geom_histogram(binwidth = 500, position = "fill")

# Stacking is also useful for time series
set.seed(1)
series <- data.frame(  time = c(rep(1, 4),rep(2, 4), rep(3, 4), rep(4, 4)),  type = rep(c('a', 'b', 'c', 'd'), 4),   value = rpois(16, 10))
ggplot(series, aes(time, value)) + geom_area(aes(fill = type))


#stack order----
series$type2 <- factor(series$type, levels = c('c', 'b', 'd', 'a'))
ggplot(series, aes(time, value)) +  geom_area(aes(fill = type2))

# You can change the order of the levels in the legend using the scale
ggplot(series, aes(time, value)) +   geom_area(aes(fill = type)) + scale_fill_discrete(breaks = c('a', 'b', 'c', 'd'))

ggplot(series, aes(time, value)) +   geom_area(aes(fill = type2), position = position_stack(reverse = TRUE)) +   coord_flip() +   theme(legend.position = "top")


# Non-area plots ------------------------------------------------------------

# When stacking across multiple layers it's a good idea to always set
# the `group` aesthetic in the ggplot() call. This ensures that all layers
# are stacked in the same way.
ggplot(series, aes(time, value, group = type)) +   geom_line(aes(colour = type), position = "stack") +   geom_point(aes(colour = type), position = "stack")

ggplot(series, aes(time, value, group = type)) +   geom_area(aes(fill = type)) +   geom_line(aes(group = type), position = "stack")

ggplot(series, aes(time, value, group = type)) +   geom_area(aes(fill = type)) +   geom_text(aes(label = type), position = "stack")

ggplot(series, aes(time, value, group = type)) +   geom_area(aes(fill = type)) +   geom_text(aes(label = type), position = position_stack(vjust = 0.5))


# Negative values -----------------------------------------------------------

df <- tibble::tribble(
  ~x, ~y, ~grp,
  "a", 1,  "x",
  "a", 2,  "y",
  "b", 1,  "x",
  "b", 3,  "y",
  "b", -1, "y"
)
df
ggplot(data = df, aes(x, y, group = grp)) + geom_col(aes(fill = grp), position = position_stack(reverse = TRUE)) +   geom_hline(yintercept = 0)


ggplot(data = df, aes(x, y, group = grp)) +   geom_col(aes(fill = grp)) +   geom_hline(yintercept = 0) +   geom_text(aes(label = grp), position = position_stack(vjust = 0.5))
