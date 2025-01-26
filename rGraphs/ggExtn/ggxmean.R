#gxmean
#https://github.com/EvaMaeRey/ggxmean

devtools::install_github("EvaMaeRey/ggxmean")

options(gganimate.nframes = 60)
library(tidyverse)
library(ggxmean)


options(gganimate.nframes = 60)
library(tidyverse)
library(ggxmean)
#library(transformr) might help w/ animate

## basic example code
mtcars %>%  ggplot() +   aes(x = wt,   y = mpg) +  geom_point() + 
  ggxmean::geom_x_mean() +  ggxmean::geom_x_mean_label() +
  ggxmean::geom_y_mean() + ggxmean::geom_xy_means(color = "red",  size = 5) +
  ggxmean::geom_lm_fitted(color = "goldenrod3", size = 3) +
  ggxmean::geom_lm_pred_int() + ggxmean::geom_lm() +
  ggxmean::geom_lm_residuals(linetype = "dashed") +  ggxmean::geom_lm_conf_int() +
  ggxmean::geom_lm_formula()

library(ggxmean)
#notworking
palmerpenguins::penguins %>%  ggplot() + aes(x = bill_length_mm) +   geom_rug(alpha = .3) + geom_histogram(alpha = .4) +   geom_x_mean() +  aes(fill = species)  + aes(color = species) +   facet_wrap(facets = vars(species)) +   gganimate::transition_layers()
