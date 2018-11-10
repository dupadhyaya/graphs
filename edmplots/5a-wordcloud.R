#Word Cloud using ggplot2

library(janeaustenr)
p_and_p <- paste(prideprejudice, collapse = ' ')
p_and_p

library(wordcloud)

wordcloud(word_count$word[1:50], word_count$count[1:50])
