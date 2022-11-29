#ggplot with mtcars

library(ggplot2)
library(dplyr)

# Convert data types-----
df =  mtcars
#Convert all category type of columns to factors
#df$column = as.factor(df$column)
catcols = c('gear','cyl','am','vs','carb')
df[catcols] = lapply(df[catcols], as.factor)
df$names = rownames(df)
str(df)


plot(mtcars[,c('wt','mpg')])
names(df)
ggplot(data = df, mapping = aes(x = wt, y = mpg)) + geom_point()
ggplot(data = df, mapping = aes(x = qsec, y = hp)) + geom_point()


ggplot(data = df, mapping = aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method='lm') 

#More Aesthetics----
#colour as cyl categories
ggplot(data = df, mapping = aes(x = wt, y = mpg, color = as.factor(cyl), size=as.factor(gear), shape=as.factor(am))) + geom_point()

#continuous variable as size
ggplot(data = df, mapping = aes(x = wt, y = mpg, size = qsec)) + geom_point()

#Combine Asthetics + Layers
ggplot(data = df, mapping = aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method='lm') 
ggplot(data = df, mapping = aes(x = wt, y = mpg, color = as.factor(cyl))) + geom_point() +  stat_smooth(method = 'lm')

#lines----
ggplot(df, aes(x=wt)) + geom_line(aes(y=mpg), colour='green') + geom_line(aes(y=hp), colour='red')

#cutgroups----
ggplot(df, aes(x=wt, y=mpg)) + geom_boxplot(aes(group=cut_number(wt,4)))
ggplot(df, aes(x=wt, y=mpg)) + geom_boxplot(aes(group=cut_width(wt,1)))
ggplot(df, aes(x=wt, y=mpg)) + geom_boxplot(aes(group=cut_interval(wt,3)))

#Faceting----
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point()
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg, color=as.factor(am))) + geom_point(size=4) + facet_wrap(~ cyl)

#scale of x free
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +  stat_smooth(method = 'lm') + facet_wrap(~ cyl)
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +  stat_smooth(method = 'lm') + facet_wrap(~ cyl, scales = 'free')

#two variable
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + geom_point() +   stat_smooth(method = 'lm') + facet_grid(am ~ cyl, scales='free')


#Histogram----
hist(mtcars$mpg)
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=3)

g <- ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=5)
g
g + xlab('Miles per Gallon')+ylab('Number of Cars')

g1 <- ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=5, color='red', fill='green')
g1 + xlab('Miles per Gallon')+ylab('Number of Cars')

g2= ggplot(df, aes(x=mpg))
g2 + geom_histogram(binwidth = 5)
g2 + stat_bin(binwidth = 5)
g2 + stat_bin(breaks = c(5,10,12,20,30), na.rm=T, fill='lightblue', colour='red')
g2 + stat_bin(breaks = c(5,10,12,20,30), na.rm=T, fill='lightblue', colour='red') + stat_bin(breaks = c(5,10,12,20,30), geom='text', aes(label=..count..), vjust=1.5)#seperate stat_bin for fill and label


#BarPlot----
#cyl is factor : summarise directly from data
ggplot(df, aes(x=cyl)) + geom_bar()
ggplot(df, aes(x=cyl)) + geom_bar(fill='blue')
ggplot(df, aes(x=cyl)) + geom_bar(fill='blue') + geom_text(stat='count', aes(label=..count..), vjust=-1)


#summarise and then plot----
df %>% group_by(cyl) %>% summarise(n=n())
df %>% group_by(cyl) %>% summarise(n=n()) %>% ggplot(., aes(x=cyl, y=n)) + geom_bar(stat='identity', fill='blue')

df %>% group_by(cyl) %>% summarise(n=n()) %>% ggplot(., aes(x=cyl, y=n)) + geom_bar(stat='identity', fill='blue') + geom_text(aes(label=n), vjust=-1)


#two category variables - cyl and gear----
#dodge, stacked, fill bar
df %>% group_by(cyl, gear) %>% summarise(n=n())
#stacked - default
df %>% group_by(cyl, gear) %>% summarise(n=n()) %>% ggplot(., (aes(x = cyl, y=n, fill=gear))) + geom_bar(stat='identity')
#labels require cumulative total groupwise
df %>% group_by(cyl, gear) %>% summarise(n=n())  %>% plyr::ddply('cyl', transform, label_ypos=cumsum(n)) %>% arrange(cyl, gear) %>% ggplot(., (aes(x = cyl, y=n, fill=gear))) + geom_bar(stat='identity') + geom_text(aes(y=label_ypos, label=n), vjust=-1, size=3)
#cyl 8 lables incorrect
df %>% group_by(cyl, gear) %>% summarise(n=n())  %>% plyr::ddply('cyl', transform, label_ypos=cumsum(n) - .5 * n) %>% arrange(cyl, gear) %>% ggplot(., (aes(x = cyl, y=n, fill=gear))) + geom_bar(stat='identity') + geom_text(aes(y=label_ypos, label=n), vjust=1, size=3)
#label in the middle of the bar



#dodge - side----
df %>% group_by(cyl, gear) %>% summarise(n=n()) %>% ggplot(., (aes(x = cyl, y=n, fill=gear))) + geom_bar(stat='identity', position=position_dodge2())
#with labels
df %>% group_by(cyl, gear) %>% summarise(n=n()) %>% ggplot(., (aes(x = cyl, y=n, fill=gear))) + geom_bar(stat='identity', position=position_dodge2()) + geom_text(aes(label=n), position= position_dodge2(width=.9))
#(width=.9 is important

#stacked - full-----


#data distribution-----
ggplot(df, aes(x=mpg)) + geom_histogram()
ggplot(df, aes(x=mpg, fill=vs)) + geom_histogram()
ggplot(df, aes(x=cyl)) + geom_bar()
ggplot(df, aes(x=mpg)) + geom_histogram(binwidth = 5, fill='green', colour='black')
ggplot(df, aes(x=mpg)) + geom_histogram() + facet_wrap(~ cyl)
ggplot(df, aes(x=mpg)) + geom_histogram() + facet_grid(. ~ cyl)
ggplot(df, aes(x=mpg)) + geom_histogram() + facet_grid(cyl ~ .)
ggplot(df, aes(x=mpg)) + geom_histogram() + facet_grid(cyl ~ gear)
ggplot(df, aes(x=mpg, fill=am)) + geom_histogram() + facet_grid(cyl ~ gear)
ggplot(df, aes(x=mpg, fill=am)) + geom_histogram() + facet_grid(cyl ~ gear, scales='free')
#free_x, free_y


#density curve----
ggplot(df, aes(x=mpg)) + geom_density()
ggplot(df, aes(x=mpg)) + geom_histogram() + geom_density()
ggplot(df, aes(x=mpg, y=..density..)) + geom_histogram() + geom_density()

#bandwidth - precision

ggplot(df, aes(x=mpg)) + geom_line(stat='density', adjust=.25, colour='red') + geom_line(stat='density', adjust=2, colour='blue')

#multiple density curve
ggplot(df, aes(x=mpg, fill=cyl)) + geom_density()
ggplot(df, aes(x=mpg, fill=cyl)) + geom_density(alpha=.5)
ggplot(df, aes(x=mpg, fill=cyl)) + geom_density(alpha=.5) + facet_grid(am ~ ., scales='free')

#freq polygon -----
ggplot(df, aes(x=mpg)) + geom_freqpoly(binwidth=4)
ggplot(df, aes(x=mpg)) + geom_freqpoly(binwidth=diff(range(df$mpg)/15))

#boxplot ----
ggplot(df, aes(x='', y=mpg)) + geom_boxplot()
ggplot(df, aes(x=1, y=mpg)) + geom_boxplot()
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot()
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot(width=.5)
ggplot(df, aes(x=gear, y=wt, fill=gear)) + geom_boxplot(outlier.size=1.5, outlier.shape = 21) #outliers
#notches-----
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot(notch=T)

#addmeans----
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot() + stat_summary(fun.y=mean, geom='point', size=3, fill='white') 
#+ geom_hline(y=)

#voilinplot----
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_violin() 
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_violin() + stat_summary(fun.y=median, geom='point', fill='white', shape=21, size=2.5)
#fill depends on shape
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_violin(trim=F) 
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_violin(scale='count') 
#area x no of observerations
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_violin(adjust=2) 
#smoothening


#DotPlot -----
ggplot(df, aes(x=hp)) + geom_dotplot(binwidth = 25) #continuous
ggplot(df, aes(x=cyl)) + geom_dotplot()# cat
ggplot(df, aes(x=hp)) + geom_dotplot(method='histodot', binwidth = 25) + geom_rug() + scale_y_continuous(breaks=NULL)
ggplot(df, aes(x=hp)) + geom_dotplot(method='histodot', binwidth = 25, stackdir = 'center') + geom_rug() + scale_y_continuous(breaks=NULL) 
#dir - whole, centerwhole


#multipledotplot-groupeddata-----
ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot(outlier.colour=NA, width=1) + geom_dotplot(binaxis='y',binwidth = 1, stackdir='center') #continuous

#annotations----
g1 <- ggplot(df, aes(x=wt, y=mpg)) + geom_point()
g1 + annotate(geom='text', x=2,y=25, label='Group1',col='blue', fontface='italic', size=5) + annotate(geom='text', x=5,y=15, label='Group2', col='red', fontface='bold', size=6)
g1 + annotate(geom='text', x=-Inf,y=Inf, label='Upper Left',col='blue', size=5, vjust=2, hjust=-.5) + annotate(geom='text', x=mean(df$wt), y=-Inf, label='Bottom Middle', col='red', fontface='bold', size=6, vjust=-2, hjust=0.5)

#adding formulas-----

#addlines ----
g1 <- ggplot(df, aes(x=wt, y=mpg)) + geom_point()
g1 + geom_hline(yintercept = c(mean(df$mpg), 15), col=2:3)
g1 + geom_vline(xintercept = c(mean(df$wt), 4), col=5:6)
g1 + geom_abline(intercept = 15, slope=1.75, col='green')

ggplot(df, aes(x=wt, y=mpg, colour=gear)) + geom_point() + geom_vline(xintercept=4) + geom_hline(yintercept = df %>% group_by(gear) %>% summarise(meanmpg =mean(mpg)) %>% select(meanmpg) %>% pull(meanmpg), col=1:3)

#addingsegments----
g2 = ggplot(df, aes(x=wt, y=mpg)) + geom_point()
g2
g2 + annotate(geom='segment', x=3, xend=4, y=20, yend=20, col='red', size=4) 
g2 + annotate(geom='segment', x=2, xend=4, y=20, yend=25, col='blue', size=3, arrow=arrow())                
g2 + annotate(geom='segment', x=2, xend=4, y=30, yend=25, col='blue', size=3, arrow=arrow(ends='both', angle=90, length=unit(.2,'cm')))   

#adding shaded rectangle
g2 + annotate(geom='rect', xmin=2, xmax=4, ymin=15, ymax=30, fill='lightblue', alpha=.8)   

#highlight Item----
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot()
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot(fill=c('red','green',NA)) 

#addingerrorbars-----
df %>% group_by(gear) %>% summarise(meanmpg = mean(mpg, na.rm=T)) %>% ggplot(., aes(x=gear, y=meanmpg)) + geom_bar(stat='identity') + ylim(c(0,40)) + geom_errorbar(aes(ymin=mpg - se, ymax=mpg + se))
#not working----

#annotationsFacet----
p1 = ggplot(df, aes(x=wt, y=mpg)) + geom_point() + facet_grid( am ~ vs)
labelsDF = data.frame(am =c(0,0,1,1), vs=c(0,1,0,1) , label=c('am=0,vs=0','am=0,vs=1','am=1,vs=0','am=1,vs=1'))
labelsDF
p1
p1 + annotate(geom='text', x=4,y=15, label='Same Label')

p1 + geom_text( data=labelsDF,mapping = aes(x = -Inf, y = -Inf, label = label),hjust   = -0.1,vjust=-1)

#axes----
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot()
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + coord_flip()

#settingrange----
#continous
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + ylim(c(0,40))
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + ylim(c(min(df$mpg),max(df$mpg)))
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + scale_y_continuous(limits=c(min(df$mpg),max(df$mpg)), breaks=NULL)
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + scale_y_continuous(limits=c(-5,40), breaks=c(5,10,12,15,30,25))
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + coord_cartesian(ylim=c(10,37)) + geom_hline(yintercept=c(10,37))
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot()
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + expand_limits(y=0)
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + expand_limits(y=100)

ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + scale_y_reverse() #reverse scale
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + scale_y_reverse(limits=c(30,10)) 

#discrete-----
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + scale_x_discrete(limits = rev(levels(df$gear)))
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + scale_x_discrete(limits=c('4','3','5'))
ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot() + scale_x_discrete(limits=c('4','5'))

#scalingratio-----
p2= ggplot(df, aes(x=wt, y=mpg)) + geom_point(size=4, colour='red')
p2
p2 + coord_fixed()  #1:1
p2 + coord_fixed(ratio=1/4)  
p2 + coord_fixed(ratio=1/6) + scale_y_continuous(breaks=seq(0,40,5)) + scale_x_continuous(breaks = seq(0,10,2))
#tickmarksalso

#
p3=ggplot(df, aes(x=gear, y=mpg)) + geom_boxplot()
p3 + theme(axis.text.y=element_blank()) #tick removed from y axis
p3 + theme(axis.text=element_blank()) #both axis
p3 + scale_y_continuous(breaks=NULL)  #no ticks, lines, labels

#ticklabels----
p3
p3 + scale_x_discrete(labels=paste('Gear', c(3,4,5)))
p3 + scale_y_continuous(breaks=c(10,20,30), labels=paste('Mileage -', c('Low',"Medium",'High')))

p4 = p3 + scale_x_discrete(labels=paste('Gear', c(3,4,5)))
p4
p4 + theme(axis.text.x = element_text(angle=60, hjust=.3, vjust=.5))
p4 + theme(axis.text.x = element_text(angle=270, hjust=.3, vjust=.5, family='roman', face='bold', color='darkred', size=rel(1.5)))

#axislabels-----
p3
p3 + xlab('Gears of Cars') + ylab('Mileage in miles')
p3 + labs(x='Gears - Cars',y='Mileage - miles')
p3 + labs(x='',y='')
p3 + xlab('')
p3 + theme(axis.title =element_blank())
p3 + theme(axis.title.y =element_blank())

#lines-----
p3
p3 + theme_bw()
p3 + theme(axis.line = element_line(colour='black')) #x & y
p3 + theme(panel.border = element_blank(), axis.line = element_line(colour='red', size=4)) #x & y
p3 + theme(panel.border = element_blank(), axis.line = element_line(colour='red', size=4, lineend='square')) #end

#log scale----

#circulargraph
p5=ggplot(df, aes(x=mpg, fill=cyl)) + geom_histogram(binwidth = 3, boundary=0)
p5 + coord_polar() + scale_x_continuous(limits=c(0,35))



#overallAppearance-----
m1 = ggplot(df, aes(x=wt, y=mpg)) + geom_point()
m1
m1 + ggtitle("Weight and Mileage of Cars")
m1 + labs(title = "Weight and Mileage of Cars - New")
m1 + ggtitle("Weight and Mileage of Cars \n Foreign Origin")
m1 + ggtitle("Weight and Mileage of Cars") + theme(plot.title = element_text(vjust=-2.5) )
m1 + ggtitle("Weight and Mileage of Cars") + theme(plot.title = element_text(vjust=-2.5, size=rel(2), family='Arial', face='bold.italic', colour='red' ))

#themes----
m1
m1 + theme_grey()                                                   
m1 + theme_bw()
m1 + theme_grey(base_family = 'Arial', base_size=16)
theme_set(theme_bw())# for current session set                        
theme_set(theme_grey())# for current session set                        

#theme elements-P218

#own themes

#hiding grid lines

#LEGENDS----
n1 = ggplot(df, aes(x=wt, y=mpg, color=am)) + geom_point()
n1
n1 + guides(color=FALSE)
n2 = ggplot(df, aes(x=gear, y=mpg, fill=gear)) + geom_boxplot()
n2
n2 + guides(fill=F)
n2
n2 + scale_fill_discrete(guide=F)
n2
n2 + theme(legend.position = 'none')

#legendPosition-----
n2
n2 + theme(legend.position = 'top')
n2 + theme(legend.position = c(1,0))
n2 + theme(legend.position = c(0,1)) # 00, 11, 01, 10
n2 + theme(legend.position = c(1,0), legend.justification = c(1,0))
n2 + theme(legend.position = c(1,1), legend.justification = c(1,1))
n2 + theme(legend.position = c(.2,.8), legend.background = element_rect(fill='white', colour ='black'))
n2 + theme(legend.position = c(.2,.8), legend.background = element_blank(), legend.key=element_blank())

#orderItems----
n2
n2 + scale_fill_discrete(limits=c('3','5','4'))           
n2
n2 + scale_fill_grey(start=.5, end=1, limits=c('3','5','4'))
n2 + scale_fill_brewer(palette='Pastel2', limits=c('3','5','4'))
n2
n2 + guides(fill=guide_legend(reverse=T))
n2 + scale_fill_hue(guide= guide_legend(reverse=T))

#legendTitle-----
n2
n2 + labs(fill='Gears of Car')

#continuousscale
n3 = ggplot(df, aes(x=wt, y=mpg, colour=gear)) + geom_point(aes(size=qsec))
range(df$qsec)
n3 + scale_size_continuous(range=c(1,5))
n3 + scale_size_continuous(range=c(1,5)) + labs(colour='Gears', size='Q Sec')
#size ???
n3b = ggplot(df, aes(x=wt, y=mpg, colour=gear, size=qsec, shape=am)) + geom_point()
n3b
n3b + labs(shape="Transmission")
n3b + labs(shape="Transmission", colour="Gear", size='Q-Sec')

#legendTitle----
n4 = ggplot(df, aes(x=am, y=mpg, fill=am)) + geom_boxplot()
n4
n4 + theme(legend.title = element_text(face='italic', family='Arial', colour='red', size=14))
#can also set through guides, but this is easier

#removelegend-----
n4
n4 + guides(fill='none') #this will remove legend
n4 + guides(fill=guide_legend(title=NULL)) #this will remove title
n4 + scale_fill_hue(guide=guide_legend(title=NULL))

#changinglabels----
n4
n4 + scale_fill_discrete(labels=c("Auto Tx",'Manual Tx'))
#fillscales
n4 + scale_fill_grey(start=.5, end=1,labels=c("Auto Tx",'Manual Tx'))

#oneVar-2scales-----
n5 = ggplot(df, aes(x=wt, y=mpg, shape=gear, colour=gear)) + geom_point()
n5
n5 + scale_shape_discrete(labels=c('Gear3','Gear4','Gear5'))
n5 + scale_shape_discrete(labels=c('Gear3','Gear4','Gear5')) + scale_colour_discrete(labels=c('Gear3','Gear4','Gear5'))

#
n5b = n5 + scale_shape_discrete(labels=c('Gear3','Gear4','Gear5')) + scale_colour_discrete(labels=c('Gear3','Gear4','Gear5')) 
n5b + theme(legend.text = element_text(face='italic', family='Arial', colour='red', size=18))
n5b + guides(fill= guide_legend(label.theme = element_text(face='italic',family ='Arial', colour='red', size=16)))

#multilinetext-----
n5c = n5 + scale_shape_discrete(labels=c("Cars with \n 3 gears",'Cars with \n 4 gears','Cars with \n 6 gears')) + scale_colour_discrete(labels=c('Gear3','Gear4','Gear5')) 
n5c
n5c + theme(legend.text = element_text(lineheight = .8), legend.key.height = unit(1, 'cm'))  #spacing the labels


#FACETS----
#facet_grid, facet_wrap
k = ggplot(df, aes(x=wt, y=mpg)) + geom_point()
k
k + facet_grid(gear ~ .) #vertically arranged
k + facet_grid(. ~ gear ) #horiz arranged
k + facet_grid(am ~ gear ) #V & H arranged
#2 boxes empty
#wraparound
k + facet_wrap(am ~ gear)
k + facet_wrap( ~ gear) #nothing before ~
k + facet_wrap(cyl ~ gear, nrow=2)
k + facet_wrap(cyl ~ gear, ncol=2)
#diffranges
k + facet_wrap(cyl ~ gear ) #V & H arranged
k + facet_wrap(cyl ~ gear, scales='free' ) 
k + facet_wrap(cyl ~ gear, scales='free_x' ) 
k + facet_wrap(am ~ gear, scales='free_y' ) 
#textFacetLabels-----
df$am
df$am = factor(df$am, levels=c(0,1) , labels=c('Auto Tx', 'Manual Tx'))
?factor
df$vs = factor(df$vs, levels=c(0,1), labels =c('V-Shaped', 'Straight'))
#Not working-----
?mtcars
k + facet_wrap( ~ am, labeller = label_both)
k + facet_wrap(vs ~ am, labeller = label_both)
k + facet_wrap(vs ~ am, labeller = label_parsed)

# You can assign different labellers to variables:
k + facet_grid( vs ~ am, labeller = labeller(vs = label_both, am = label_value))
?labeller
#facet with 3 columns
k + facet_wrap(vs + am ~ gear)
k + facet_wrap(vs  ~ am + gear)

#appearance-----
k + facet_wrap( ~ am)
k + facet_wrap( ~ am, labeller = label_both) + theme(strip.text=element_text(face='bold', size=rel(1.5)), strip.background = element_rect(fill='lightblue', colour='black', size=1))

#12COLORsplot-----
ggplot(df, aes(x=wt, y=mpg)) + geom_point()
ggplot(df, aes(x=wt, y=mpg)) + geom_point(colour='red')

ggplot(df, aes(x=mpg)) + geom_histogram(fill='red', colour='black')
#fill,colour depends upon shape used
#gear
df %>% group_by(gear) %>% summarise(n=n()) %>% ggplot(., aes(x=gear, y=n)) + geom_bar(stat='identity')
#gear
df %>% group_by(gear) %>% summarise(n=n()) %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity')
#gear +cyl
df %>% group_by(gear, cyl) %>% summarise(n=n()) %>% ggplot(., aes(x=gear, y=n, fill=cyl)) + geom_bar(stat='identity', colour='blue', position='dodge')
#same-position of fill insided geom_bar
df %>% group_by(gear, cyl) %>% summarise(n=n()) %>% ggplot(., aes(x=gear, y=n)) + geom_bar(aes(fill=cyl), stat='identity', colour='blue', position='dodge')

#colourbrewer
