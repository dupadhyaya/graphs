

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
setlist5
OLlist5 <- overLapper(setlist=setlist5, sep="_", type="vennsets")
OLlist5
attributes(OLlist5)
vennPlot(OLlist5, mymain="Venn Diagram", mysub="default", setlabels = 'default', colmode=2, ccol=c("blue", "red"))

#https://rdrr.io/bioc/systemPipeR/man/vennPlot.html
#-----
## Sample data
setlist <- list(A=sample(letters, 18), B=sample(letters, 16),
                C=sample(letters, 20), D=sample(letters, 22),
                E=sample(letters, 18), F=sample(letters, 22))
## 2-way Venn diagram
vennset <- overLapper(setlist[1:2], type="vennsets")
vennPlot(vennset)

## 3-way Venn diagram
vennset <- overLapper(setlist[1:3], type="vennsets")
vennPlot(vennset)

## 4-way Venn diagram
vennset <- overLapper(setlist[1:4], type="vennsets")
vennPlot(list(vennset, vennset))

## Pseudo 4-way Venn diagram with circles
vennPlot(vennset, type="circle")

## 5-way Venn diagram
vennset <- overLapper(setlist[1:5], type="vennsets")
vennPlot(vennset)

## Alternative Venn count input to vennPlot (not recommended!)
counts <- sapply(vennlist(vennset), length)
vennPlot(counts)

## 6-way Venn comparison as bar plot
vennset <- overLapper(setlist[1:6], type="vennsets")
olBarplot(vennset, mincount=1)

## Bar plot of standard intersect counts
interset <- overLapper(setlist, type="intersects")
olBarplot(interset, mincount=1)

## Accessor methods for VENNset/INTERSECTset objects
names(vennset)
names(interset)
setlist(vennset)
intersectmatrix(vennset)
complexitylevels(vennset)
vennlist(vennset)
intersectlist(interset)

## Coerce VENNset/INTERSECTset object to list
as.list(vennset)
as.list(interset)

## Pairwise intersect matrix and heatmap
olMA <- sapply(names(setlist), 
               function(x) sapply(names(setlist), 
                                  function(y) sum(setlist[[x]] %in% setlist[[y]])))
olMA
heatmap(olMA, Rowv=NA, Colv=NA)

## Presence-absence matrices for large numbers of sample sets
interset <- overLapper(setlist=setlist, type="intersects", complexity=2)
(paMA <- intersectmatrix(interset))
heatmap(paMA, Rowv=NA, Colv=NA, col=c("white", "gray")) 

#-----
#https://harrycaufield.net/severalog/2015/5/7/venn-diagrams-in-r-or-how-to-go-around-in-circles
library(gplots)

venn(list("Set A"=1:10,"Set B"=0:5))
venn(list("Set A"=0:10,"Set B"=0:5,"Set C"=5:39,"Set D"=7:80))
library(venneuler)
library(VennDiagram)
venn.plot <- draw.triple.venn(  area1 = 40,  area2 = 33,  area3 = 70,  n12 = 10,  n23 = 10,  n13 = 7,  n123 = 3,  category = c("First", "Second", "Third"),  fill = c("blue", "red", "green"),  lty = "blank",  cex = 2,  cat.cex = 2)
venn.plot

data(StemCell)
VennRaw <- Venn(StemCell)
Venn3 <- VennRaw[, c("OCT4", "SOX2", "NANOG")]
plot(Venn3, doWeights = FALSE)


library(VennDiagram)
draw.triple.venn(65, 75, 85, 35, 15, 25, 5, c("First", "Second", "Third"))
#http://www.stats.bris.ac.uk/R/web/packages/VennDiagram/VennDiagram.pdf