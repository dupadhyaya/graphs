library(dplyr)
library(ggplot2)
library(ggrepel)

id = mtcars
gd <- id %>% group_by(am) %>%  summarise(hp = mean(hp))
rowname = rownames(id)
ggplot(id, aes(x = am, y = hp, color = am, fill = am)) +  geom_bar(data = gd, stat = "identity", alpha = .3) +  ggrepel::geom_text_repel(aes(label = rowname), color = "black", size = 2.5, segment.color = "grey") + geom_point() +  guides(color = "none", fill = "none") + theme_bw() +  labs(    title = "Car horespower by transmission type", x = "Transmission",    y = "Horsepower")
names(id)
gd <- id %>% group_by(gear) %>%  summarise(hp = mean(hp))
ggplot(id, aes(x = gear, y = hp, color = factor(gear), fill = factor(gear))) +  geom_bar(data = gd, stat = "identity", alpha = .3) +  ggrepel::geom_text_repel(aes(label = rowname), color = "purple", size = 2.5, segment.color = "red") + geom_point() +  theme_bw() +  labs(    title = "Car horespower by transmission type", x = "Transmission",    y = "Horsepower")

       