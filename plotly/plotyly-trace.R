#Ploty - loop / trace

# plotly library
library(plotly)

# Create data
my_y=rnorm(10)*3
my_x=seq(0,9)

# Let's do a first plot
p<-plot_ly(y=my_y, x=my_x , type="scatter", mode="markers+lines")

# Add 5 trace to this graphic with a loop!
for(i in 1:3){
  my_y=rnorm(10)
  p<-add_trace(p, y=~my_y, x=~my_x , type="scatter", mode="markers+lines" )
  #p=layout(yaxis=list(range=c(-10,9)))
}

p
