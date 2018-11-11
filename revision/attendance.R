

#TS object
(AUUP_L = trunc(rnorm(365,50,3)))
(AUH_M = trunc(rnorm(365,48,3.5)))
(AUMP_G = trunc(rnorm(365,42,4)))
(dates = as.Date('2017-10-01') + seq(0,364))
df1 = data.frame(AUUP_L, AUH_M, AUMP_G, dates)

df2 = reshape2::melt(attend, id.vars=c("dates"), variable.name = "campus", value.name="strength")
head(df2)

ggplot(data=df2, aes(x=dates, y=strength)) + geom_line(aes(colour=campus)) + geom_smooth() + facet_wrap(campus ~ ., ncol=1)


ggplot(df2, aes(x=campus, y=strength)) + 
  geom_jitter(alpha = I(1 / 2), aes(color=campus))

#boxplot
ggplot(df2, aes(x=campus, y=strength, fill=campus)) + geom_boxplot()
ggplot(df2, aes(x="", y=strength, fill=campus)) + geom_boxplot() + facet_wrap(campus ~ .)

ggplot(df2, aes(x="", y=strength, fill=campus)) + geom_violin() + facet_wrap(campus ~ .)


#density
ggplot(df2, aes(x=strength, fill=campus)) + geom_density(alpha=.3) 

ggplot(df2, aes(x=strength)) + geom_density(aes(color=campus), alpha=.3) 

ggplot(df2, aes(x=strength, fill=campus)) + geom_density() + facet_wrap(campus ~ .)

ggplot(df2, aes(x=strength)) + geom_density(aes(fill=campus)) + facet_wrap( . ~ campus )

#Histogram
ggplot(df2, aes(x=strength)) + geom_histogram(aes(fill = ..count..), binwidth=0.2)  

ggplot(df2, aes(x=strength)) +  geom_density(aes(y=..density..))

#overlay : see the max(y) for density = 0.08 : legend for count values
ggplot(df2, aes(x=strength)) + geom_histogram(aes(y = ..density..,fill = ..count..), binwidth=0.5) + geom_density() + geom_hline(yintercept = c(0.085) )

#pie
#http://www.sthda.com/english/wiki/print.php?id=192
#it comes to creating pie charts in R and ggplot2 you need to start with a bar graph from geom_bar() 
library(dplyr)
means = df2 %>% group_by(campus) %>% summarise(means = mean(strength)) %>% pull(means)
means
g=ggplot(df2, aes(x = factor(1), y = strength, fill = campus)) +  geom_bar(stat="summary", fun.y='mean', width = 1.2) +   coord_polar(theta="y", start=0) + ggtitle("Pie Chart") 
g
g + geom_text(aes(x=1.2, y=c(0,means)), label = means, size=10)
#labels not working in pie ?????
means
       
#windrose pie chart
ggplot(df2, aes(x = campus, y = strength, fill = campus)) +   geom_bar(width = 1, stat="identity") + coord_polar("y", start=pi / 3) +   ggtitle("Pie Chart") 



#Grid
library(grid)
(a <- ggplot(df2, aes(x=campus, y=strength)) + geom_jitter(size=4, alpha = I(1 / 1.5), aes(color=campus)))
(b <- ggplot(df2, aes(x=campus, y=strength, color=campus)) + geom_boxplot())
(c <- ggplot(df2, aes(x=campus,y=strength, fill=campus)) + geom_boxplot() + theme(legend.position = "none"))
(d = ggplot(df2, aes(x = factor(1), y = strength, fill = campus)) +  geom_bar(stat="summary", fun.y='mean', width = 1.2) +   coord_polar(theta="y", start=0) + ggtitle("Pie Chart") )

grid.newpage() # Open a new page on grid device
pushViewport(viewport(layout = grid.layout(2, 2))) # Assign to device viewport with 2 by 2 grid layout 
print(a, vp = viewport(layout.pos.row = 1, layout.pos.col = 1:2))
print(b, vp = viewport(layout.pos.row = 2, layout.pos.col = 1))
print(c, vp = viewport(layout.pos.row = 2, layout.pos.col = 2, width=0.3, height=0.3, x=0.8, y=0.8))

library(gridExtra)
grid.arrange(a, b, c,d, nrow = 2, ncol=2)                                                                                                               
#insert graph into plots
library(grid)
print(a)
print(b, vp=viewport(width=0.3, height=0.3, x=0.2, y=0.3))


#venndiagram
library(systemPipeR)
setlist5 <- list(A=sample(letters, 18), B=sample(letters, 16), C=sample(letters, 20), D=sample(letters, 22), E=sample(letters, 18))
OLlist5 <- overLapper(setlist=setlist5, sep="_", type="vennsets")
vennPlot(OLlist5, mymain="", mysub="", colmode=2, ccol=c("blue", "red"))