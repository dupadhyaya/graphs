#histogram with labels
library(dplyr)
library(ggplot2)
library(reshape2)
#------------
(campus1 = paste('C', 1:6, sep='-'))
(institute1 = paste('Institute', 1:10, sep ='-'))
(program1 = paste('P',100:150, sep='-'))
runif(100)
n=10000
(rollno = 10000 + 0:(10000-1))

#-------------
campus = sample(campus1, size=n, replace=T, prob=c(3/10,2/10,2/10,2/10,1/10,1/10))
institute = sample(institute1, size=n, replace=T)                
program = sample(program1, size=n, replace=T)
(sgpa = round(rnorm(mean=7, sd=.5, n=n),2))
(cgpa = round(rnorm(mean=6.5, sd=.6, n=n),2))
range(cgpa) ; range(sgpa)

result1 = data.frame(campus, institute, program, sgpa, cgpa)
catcols1 =c('campus','institute','program')
result1[,catcols1] = lapply(result1[,catcols1], as.factor)
str(result1)

#------------

hist(result1$sgpa)
hist(result1$sgpa, breaks=c(0,4,5,6,7,8,9,10))

#-------------
ggplot(result1, aes(x=sgpa)) +  geom_histogram(bins=15) 

#------------
ggplot(result1, aes(x=sgpa)) +  stat_bin(bins=15) + stat_bin(bins=15, geom="text", aes(label=..count..), vjust=-1.5) + ylim(c(0,3000))



#-------- area
g1 = ggplot(result1, aes(x = sgpa))
g1 + geom_area(stat = "bin", color = "black", fill = "#00AFBB")
g1 + geom_area(aes(y = ..density..), stat = "bin")
g1 + geom_density()

g1 + geom_density(aes(fill = campus), alpha = 0.4)
mu = result1 %>% group_by(campus) %>% summarise(grp.mean =mean(sgpa, na.rm=T))
mu

g1 + geom_density(aes(fill = campus), alpha = 0.4) + geom_vline(data=mu, aes(xintercept = grp.mean, color = campus), linetype = "dashed")

#manually fill colors
g1a <- g1 + geom_density(aes(color = campus)) + geom_vline(data = mu, aes(xintercept = grp.mean, color = campus), linetype = "dashed") + theme_minimal()
g1a + scale_color_manual(values = 1:6)
#give colors here
#https://rstudio-pubs-static.s3.amazonaws.com/228019_f0c39e05758a4a51b435b19dbd321c23.html


#-------- with lines
g1 + geom_density(color = "black", fill = "gray") + geom_vline(xintercept = c(min(sgpa), mean(sgpa), max(sgpa)), color = 1:3, linetype = 1:3, size = 1) 

#-----
g2 = ggplot(result1, aes(x =sgpa, fill = campus))
g2 + geom_bar(stat = "bin")
g



#-----------------
g3 = ggplot(result1, aes(x = sgpa))
g3 + geom_histogram(aes(y = ..density..), bins = 50)

# Change color by campus
g3 + geom_histogram(aes(color = campus), fill = "white", bins = 50) + theme_minimal()

# Position adjustment "identity"(overlaid)
g3 + geom_histogram(aes(color = campus), fill = "white", bins = 50, alpha = 0.6, position = "identity")

# Position adjustment "dodge" (Interleaved)
# Add mean lines and color by campus
g1 + geom_histogram(aes(color = campus), fill = "white", alpha = 0.6, position = "dodge", bins = 50) + geom_vline(aes(xintercept = mean(sgpa)), linetype = "dashed")


# Change fill, color manually
# Change outline color manually
g1 + geom_histogram(aes(color = campus), fill = "white", alpha = 0.4, position = "identity", bins = 50) + scale_color_manual(values = c("#00AFBB","#E7B800", 1:4))


# Histogram with density plot
g1 + geom_histogram(aes(y = ..density..),color = "black", fill = "white") + geom_density(alpha = 0.2, fill = "#FF6666") + theme_minimal()


# Color by groups
g1 + geom_histogram(aes(y = ..density.., color = campus, fill = campus),  alpha = 0.4, position = "identity") + geom_density(aes(color = campus), size =1)

g3 + geom_dotplot(aes(fill = campus), bins=15)


#----
g3 + stat_ecdf(geom = "point")
g3 + stat_ecdf(geom = "step")
# Basic plot

#---
g4 = ggplot(result1, aes(sample = sgpa)) 
g4 + stat_qq()

# Change point shapes by groups
# Use custom color palettes
g4 + stat_qq(aes(color = campus))

g4 + stat_qq(aes(shape = campus, color = institute))


#----color histogram 
ggplot(result1, aes(x=sgpa, fill = cut(sgpa, 10))) +  geom_histogram()

ggplot(result1, aes(sgpa, fill = cut(sgpa, 10))) +   geom_histogram(show.legend = FALSE)

ggplot(result1, aes(sgpa, fill = cut(sgpa, 10))) +   geom_histogram(show.legend = FALSE, bins=15) +   scale_fill_discrete(h = c(200, 10))

#https://drsimonj.svbtle.com/pretty-histograms-with-ggplot2

ggplot(d, aes(x, fill = cut(x, 100))) +  geom_histogram(show.legend = FALSE) +   scale_fill_discrete(h = c(240, 10), c = 120, l = 70)

gplot(d, aes(x, fill = cut(x, 100))) +   geom_histogram(show.legend = FALSE) +   scale_fill_discrete(h = c(240, 10), c = 120, l = 70) + theme_minimal() +   labs(x = "Variable X", y = "n") +   ggtitle("Histogram of X")

#facet



#https://www.sharpsightlabs.com/blog/ggplot-histogram/
  
g5= ggplot(result1, aes(x=sgpa, fill=campus)) +  stat_bin(bins=7) + stat_bin(bins=7, geom="text", aes(label=..count..), size=2, vjust=-1.5) + ylim(c(0,1500))
g5 + facet_grid(campus ~ .) + scale_color_manual(values = 1:7)

g5b= ggplot(result1, aes(x=sgpa, fill=institute)) +  stat_bin(bins=7) + stat_bin(bins=7, geom="text", aes(label=..count..), size=2, vjust=-1.5) + ylim(c(0,1500))
g5b + facet_wrap( institute ~ .) + scale_color_manual(values = 1:7)
