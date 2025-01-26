# ggplot factor

pacman::p_load(tidyverse)

head(mtcars)

mtcars %>% mutate(gear =factor(gear)) %>% mutate(gear = fct_reorder(gear, mpg)) 
