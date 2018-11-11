#Word Cloud using ggplot2

library(janeaustenr)
p_and_p <- paste(prideprejudice, collapse = ' ')
p_and_p

url="https://docs.google.com/spreadsheets/d/1HzGHR3vQgOYmRXJSvLFwwA_wcT0z_2lPzp5Xb2Erf40/edit#gid=1131654309"
library(gsheet)
words = as.data.frame(gsheet2tbl(url))
?ghseet
head(words)
words

library(wordcloud)
wordcloud(words$word, words$freq)

library(wordcloud2)
wordcloud2::wordcloud2(words)
wordcloud2::wordcloud2(demoFreq)
?wordcloud2


library(ggplot2)
library(ggrepel)

words %>% 
  slice(1:50) %>%
  ggplot +
  aes(x = 1, y = 1, size = freq, label = word) +
  geom_text_repel(segment.size = 0, force = 100) +
  scale_size(range = c(1,5), guide = FALSE) +
  scale_y_continuous(breaks = NULL) +
  scale_x_continuous(breaks = NULL) +
  labs(x = '', y = '') +
  theme_classic()
