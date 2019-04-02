#Colors in Plots
#https://socviz.co/refineplots.html

library(ggplot2)

ggplot(mtcars, aes(x=cyl, y=gear)) + geom_bar(stat='bin') 


library(RColorBrewer)
head(brewer.pal.info, 10)


p <- ggplot(data = df,mapping = aes(x = wt, y = mpg, color = gear))
p
p + geom_point(size = 2) + scale_color_brewer(palette = "Set2") +  theme(legend.position = "top")

p + geom_point(size = 2) + scale_color_brewer(palette = "Pastel2") +  theme(legend.position = "top")

p + geom_point(size = 2) + scale_color_brewer(palette = "Dark2") +  theme(legend.position = "top")

cb_palette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

p + scale_color_manual(values = cb_palette) 

demo('colors')


theme_set(theme_bw())
p + geom_point() + theme(legend.position="top")

theme_set(theme_dark())
p + geom_point() +  theme(legend.position="top")

library(ggthemes)

theme_set(theme_economist())
p + geom_point() + theme(legend.position="top")

p + geom_point() + theme_set(theme_wsj())


df %>% group_by(cyl, gear) %>% summarise(n=n()) -> sum1
ggplot(sum1, aes(x=gear, y=n)) + geom_bar(stat='identity',fill='red')
ggplot(sum1, aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity')
ggplot(sum1, aes(x=gear, y=n)) + geom_bar(stat='identity', aes(fill=gear))

p2 = ggplot(sum1, aes(x=cyl, y=n, fill=gear)) + geom_bar(stat='identity')
p2
p2 + scale_fill_brewer(type = "qual", palette = "light1")
ggplot(sum1, aes(x=cyl, y=n, fill=gear)) + geom_bar(stat='identity',fill='red')

p2 + scale_fill_manual("legend", values = c("3" = "black", "4" = "orange", "5" = "green"))


#-----
library(RColorBrewer)
myColors <- brewer.pal(3, "Set2")
# assign a different color to each factor

# now we can use the colors assigned to the six sprays to color the plot
ggplot(sum1, aes(x=cyl, y=n, fill=gear)) + geom_bar(stat="identity") + scale_colour_manual(values=myColors)

#axis labels

df %>% group_by(cyl) %>% summarise(n=n()) -> sum2
sum2 %>% ggplot(., aes(x=cyl, y=n, fill=cyl)) + geom_bar(stat='identity') + scale_x_discrete(labels = paste('Cyl',c(4,6,8)))

df %>% group_by(cyl) %>% summarise(n=n()) -> sum3
sum2 %>% ggplot(., aes(x=cyl, y=n, fill=cyl)) + geom_bar(stat='identity') + scale_x_discrete(labels = paste('Cyl',c(4,6,8)))

m1= ggplot(df, aes(x=mpg)) + geom_histogram(breaks=c(5,10,15,20,25,30), fill=c('red'))
m1
m1 + scale_x_continuous(breaks=c(5,10,15,20,25,30),labels=LETTERS[1:6])


