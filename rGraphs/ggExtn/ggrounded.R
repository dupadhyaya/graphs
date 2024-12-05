#ggrounded
#https://botan.github.io/ggrounded/
#install.packages("ggrounded")
#install.packages("pak")
pak::pak("botan/ggrounded")

library(ggrounded)
library(ggplot2)

ggplot(mpg, aes(class)) + geom_bar_rounded()
ggplot(mpg, aes(class)) + geom_bar_rounded(fill = "steelblue", color = "black", width = 0.5)
ggplot(mpg, aes(class)) + geom_bar_rounded(fill = "steelblue", color = "black", width = 0.5, position = "dodge")

ggplot(data.frame(x = letters[1:3], y = c(2.3, 1.9, 3.2)), aes(x, y))  + geom_col_rounded()
