#waterfalls

#https://github.com/hughparsonage/waterfalls

library(waterfalls)

group <- LETTERS[1:6]
value <- c(2000, 4000, 2000, -1500, -1000, -2500)
df <- data.frame(x = group, y = value) 

df
waterfall(df)

# Equivalent to:
waterfall(values = value, labels = group)

waterfall(df, calc_total = TRUE)

waterfall(df, rect_width = 0.4)

waterfall(df, draw_lines = FALSE)

waterfall(df, linetype = 1)

waterfall(df,    fill_by_sign = FALSE,  fill_colours = 2:7)


waterfall(df, calc_total = TRUE,  total_rect_color = "orange",    total_rect_text_color = "white")

waterfall(df, rect_border = NA)

waterfall(df) +   theme_minimal()
