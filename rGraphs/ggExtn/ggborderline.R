#ggborderline
#https://wurli.github.io/ggborderline/


library(ggborderline)
library(ggplot2)
library(dplyr, warn.conflicts = FALSE)

p <- txhousing |>
  filter(
    city %in% c("Houston", "Midland", "Beaumont", "Laredo"),
    !is.na(median)
  ) |>
  ggplot(aes(date, median, colour = city)) +
  scale_y_continuous(labels = scales::label_dollar()) +
  scale_colour_brewer(palette = "Paired") +
  theme(legend.position = "bottom")

p + geom_borderline(linewidth = 1) + ggtitle("Using `geom_borderline()`")
p + geom_line(linewidth = 1) + ggtitle("Using `geom_line()`")

library(ggdark)

p + geom_borderline(    aes(bordercolour = after_scale(invert_colour(colour))),   borderwidth = 1, linewidth = 2
  )


ggplot(economics_long, aes(date, value01, colour = variable)) +  geom_borderline()

ggplot(economics_long, aes(date, value01, bordercolour = variable)) + geom_borderline(borderwidth = .4, colour = "white")
