#ggtricks

#https://abdoulma.github.io/ggtricks/

#install.packages("ggtricks")


library(tidyverse)
library(ggtricks)

my_theme <- function(...) {
  theme_minimal() +
    theme(
      text = element_text(family = "Atkinson Hyperlegible"),
      axis.text.y = element_text(color = "black", size = rel(1.5))
    )
}
prod_df <- data.frame(
  good = c("Potatoes", "Sugar", "Butter", "Coffee", "Rice", "Eggs", "Flour", "Tea", "Milk"),
  index = c(606, 485, 204, 165, 215, 268, 267, 137, 194)
)

prod_df <- prod_df |>
  mutate(
    index = index / 100,
    good = fct_rev(fct_inorder(good))
  )

prod_df |>
  ggplot() +
  geom_series_circles(aes(index, good), color = "white") +
  coord_equal() +
  my_theme()

prod_df |>
  ggplot() +
  geom_series_circles(aes(index, good, fill = good), color = "black", linewidth = 2.5) +
  coord_equal() +
  my_theme()
