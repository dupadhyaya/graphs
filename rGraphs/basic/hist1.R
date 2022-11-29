#hist1 histogram
#There are many ways to plot histograms in R:
#the hist function in the base graphics package;
#truehist in package MASS;
#histogram in package lattice;
#geom_histogram in package ggplot2.




#Eg1
duration = faithful$eruptions 
duration
hist(duration,    # apply the hist function 
         right=FALSE)    # intervals closed on the left
hist(duration, right=T)
hist(duration, breaks=c(1,2,3,max(duration)))
?hist

colors = c("red", "yellow", "green", "violet", "orange", 
           +   "blue", "pink", "cyan") 
hist(duration,    # apply the hist function 
        right=FALSE,    # intervals closed on the left 
         col=colors,     # set the color palette 
         main="Old Faithful Eruptions", # the main title 
          xlab="Duration minutes")       # x-axis label

