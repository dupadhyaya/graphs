# Box Plot
# http://www.r-graph-gallery.com/70-boxplot-with-categories-on-multiple-lines
# 
# Create 2 vectors
a=sample(2:24, 20 , replace=T)
b=sample(4:14, 8 , replace=T)

# Make a list of these 2 vectors
C=list(a,b)

# Change the names of the elements of the list :
names(C)=c(paste("Category 1\n n=" , length(a) , sep=""), paste("Category 2\n n=" , length(b) , sep=""))

#I change the mgp argument to avoid the text overlays the x axis
par(mgp=c(3,2,0))

# Final Boxplot !
boxplot(C , col=rgb(0.3,0.2,0.5,0.6) , ylab="value" )
