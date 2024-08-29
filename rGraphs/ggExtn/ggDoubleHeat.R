#ggDoubleHeat
#https://pursuitofdatascience.github.io/ggDoubleHeat/
#https://cran.r-project.org/web/packages/ggDoubleHeat/ggDoubleHeat.pdf

pacman::p_load(tidyr)
library(ggDoubleHeat)

head(pitts_tg)
#30-week period of COVID-related Google & Twitter incidence rate for 9 different categories

ggplot(data = pitts_tg, aes(x = week, y = category)) +  geom_heat_grid(outside = Google, inside = Twitter) + ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")


#circle------
ggplot(data = pitts_tg, aes(x = week, y = category)) +   geom_heat_circle(outside = Google, inside = Twitter) +   ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")


#tri------
ggplot(data = pitts_tg, aes(x = week, y = category)) +   geom_heat_tri(lower = Google, upper = Twitter) + ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")


library(ggtext)
ggplot(data = pitts_tg, aes(x = week, y = category)) + geom_heat_grid(outside = Google, inside = Twitter) + annotate("richtext", x = rep(c(1:30), 9), y = rep(1:9, each = 30),  label = pitts_emojis, label.color = NA, fill = NA, size = 0.3) +   ggtitle("Pittsburgh Google & Twitter Incidence Rate (%) Comparison")

?a