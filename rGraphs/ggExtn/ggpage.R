#ggpage

#https://emilhvitfeldt.github.io/ggpage/
#install.packages("ggpage")
#devtools::install_github("EmilHvitfeldt/ggpage")  

library(tidyverse)
library(ggpage)

head(tinderbox, 10)

#The basic workflow with ggpage is using either
#ggpage_quick for a quick one function call plot or,
#combining ggpage_build and ggpage_plot to do analysis (NLP for example) before the final plot is produced.
ggpage_quick(tinderbox)

tinderbox %>%    ggpage_build() %>%   ggpage_plot()

tinderbox %>% slice(1:10) %>% ggpage_build() %>% mutate(long_word = stringr::str_length(word) > 8) %>%  ggpage_plot(aes(fill = long_word)) + labs(title = "Longer words throughout The Tinder-box") + scale_fill_manual(values = c("grey70", "blue"),  labels = c("8 or less", "9 or more"), name = "Word length")

#notworking------
library(ggpage)
library(purrr)
library(gganimate)
library(tidytext)
library(zoo)

prebuild <- tinderbox %>%   ggpage_build() %>%   left_join(get_sentiments("afinn"), by = "word") 

midbuild <- map_df(.x = 0:50 * 10 + 1,
                   ~ prebuild %>% 
                     mutate(score = ifelse(is.na(score), 0, score), 
                            score_smooth = zoo::rollmean(score, .x, 0),
                            score_smooth = score_smooth / max(score_smooth),
                            rolls = .x))

midbuild %>%
  ggpage_plot(aes(fill = score_smooth)) +
  scale_fill_gradient2(low = "red", high = "blue", mid = "grey", midpoint = 0) +
  guides(fill = "none") +
  labs(title = "Smoothed sentiment of The Tinder-box, rolling average of {round(frame_time)}") +
  transition_time(rolls)


#------
library(paletteer)
sentiment_types <- sentiments %>%
  filter(lexicon == "nrc") %>%
  pull(sentiment) %>%
  unique()

prebuild <- imap_dfr(sentiment_types,
                     ~ ggpage_build(tinderbox) %>%
                       left_join(filter(get_sentiments("nrc"), sentiment == .x), by = "word") %>%
                       mutate(sentiment_state = .x,
                              score = as.numeric(!is.na(sentiment)),
                              score_smooth = zoo::rollmean(score, 5, 0)))

prebuild %>% 
  ggpage_plot(aes(fill = score_smooth), page.number = "top-left") +
  paletteer::scale_fill_paletteer_c(viridis, cividis, direction = -1) +
  guides(fill = "none") +
  transition_states(
    sentiment_state,
    transition_length = 10,
    state_length = 3
  ) +
  labs(title = "Sections with a sentiment of {closest_state}\nIn H.C. Andersen's Tinderbox")

