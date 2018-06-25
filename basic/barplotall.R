# bar plot - ALL
#http://www.r-graph-gallery.com/portfolio/barplot/


# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# The most basic barplot you can do:
# see # for explanation
barplot(my_vector)

# Uniform color:
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6) )

# Color specific for each category:
barplot(my_vector, col=c(1,2,3,4,5) )

# Custom the border color of the bar:
barplot(my_vector, col=rgb(0.1,0.1,0.1,0.1), border="blue" )

# Change the classic attribute of plots:
png("#209_layout_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.5,0.1,0.6,0.6), xlab="categories", ylab="values", main="My title" , ylim=c(0,60) )
dev.off()

# You can put some texture for each bar
# see corresponding graph for density and angle attributes.
# 

# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# The most basic barplot you can do:
# see # for explanation
barplot(my_vector)

# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# The most basic barplot you can do:
# see # for explanation
barplot(my_vector)

# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# The most basic barplot you can do:
# see # for explanation
barplot(my_vector)

# Change the classic attribute of plots:
png("#209_layout_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.5,0.1,0.6,0.6), xlab="categories", ylab="values", main="My title" , ylim=c(0,60) )
dev.off()

# You can put some texture for each bar
# see corresponding graph for density and angle attributes.

# Control space:
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), space=c(0.1,0.2,3,1.5,0.3) )

# Control width:
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), width=c(0.1,0.2,3,1.5,0.3) )

# Horizontal Barplot:
barplot(my_vector, col=rgb(0.2,0.4,0.6,0.6), horiz=T , las=1)

# Change the classic attribute of plots:
png("#209_layout_barplot.png" , width = 480, height = 480 )
barplot(my_vector, col=rgb(0.5,0.1,0.6,0.6), xlab="categories", ylab="values", main="My title" , ylim=c(0,60) )
dev.off()

# You can put some texture for each bar
# see corresponding graph for density and angle attributes.
# 





# Let's create a vector of data:
my_vector=c(3,12,5,18,45)
names(my_vector)=c("A","B","C","D","E")

# The most basic barplot you can do:
# see # for explanation
barplot(my_vector)


#http://www.r-graph-gallery.com/193-change-texture-of-barplot-with-density/
# plot
barplot( c(2,5,4,6) , density=c(5,10,20,30) , angle=c(0,45,90,11) , col="brown" , names.arg=c("A","B","C","D")  )
