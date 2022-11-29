#pie chart

(campus = c('AUC-R', 'AUUP-L','AUH-M','AUM-M'))
(str = c(100, 140, 130, 150))
(present = c(60, 40, 100, 145))
(attendance = data.frame(campus, str, present))

library(dplyr)

attendance2 <- attendance %>% mutate(perc = present/str) 
attendance2 
bp <- ggplot(data=attendance2, aes(x=campus, y=perc, fill=campus))+
  geom_bar(width = .5, stat = "identity")
bp + coord_flip()


bp1 <- ggplot(data=attendance2, aes(x="", y=perc, fill=campus))+
  geom_bar(width = 1, stat = "identity")
pie <- bp1 + coord_polar("y", start=0)
pie
pie + scale_fill_manual(values=c("red", "green", "yellow",'blue'))

# use brewer color palettes
pie + scale_fill_brewer(palette="Dark2")

pie + scale_fill_brewer(palette="Blues")+ theme_minimal()
# Use grey scale
pie + scale_fill_grey() + theme_minimal()


library(plotly)
# Plot the result
my_plot <- bp + coord_flip()

ggplotly(my_plot, width = 750, height = 350)
