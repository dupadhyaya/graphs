# Plotly
library(plotly)

#Exercise1----------
# Generate separate histograms for the first four columns of iris dataset and save the plots in objects p1, p2, p3 and p4.
# HINT: Use plot_ly() function with x argument and type="histogram". Use name argument to give appropriate name for the trace.
str(iris)
names(iris)
#"Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width" "Species"
p1 = plot_ly(x=iris[,1], type='histogram', name=names(iris)[1])
p2 = plot_ly(x=iris[,2], type='histogram', name=names(iris)[1])
p3 = plot_ly(x=iris[,3], type='histogram', name=names(iris)[1])
p4 = plot_ly(x=iris[,4], type='histogram', name=names(iris)[1])
p1  # draw 1 plot
subplot(p1,p1) # draw 2 plots

# Exercise 2----------------------
# a. Use subplot() function to generate a plot with all the plot objects from previous exercise as the arguments.
# b. Use the nrows argument to arrange 2 plots per row.
subplot(p1,p2,p3,p4,nrows=2)
# Hover the mouse over the graph
 
# Exercise 3-----------
# a. Generate a scatter plot for the iris dataset with first column on the x-axis and second column on the y-axis. Save the plot object.
# b. Generate a 2d histogram using the add_histogram2d() function.Save the plot object.
# HINT: Use the function plot_ly() with the same x and y arguments and pass the plot object to the 2-d histogram function.

p = plot_ly(x = iris[1,], y = iris[,2], mode='markers', type='scatter')
p
q = add_histogram2d(plot_ly(x=iris[,1], y=iris[,2])) 
q

#Generate a subplot with the scatter plot and the 2-d histogram created in the previous exercise.

#Exercise 4 ------

#Notice how the scatter plot can be represented in a more interesting way. Cells in the 2-d histogram are binned and represented with the color on the scale based on the cell population/density.
subplot(p,q)

# Exercise 5---------------
#Set the value of shareX and shareY arguments in the subplot() function to scale the plots to the same range of x and y.

subplot(p,q, shareX = TRUE, shareY = TRUE)

# Exercise 6------------
#Now, let us build a 3-d surface plot. The syntax to build such plot is as below.
plot_ly(z = matrix(1:100, nrow = 10)) %>% add_surface()
#Click, hold and drag the cursor to see the plot surface.
#Build a 3-d surface plot using the volcano dataset available in the base R distribution.

plot_ly(z = volcano) %>% add_surface()



# Exercise 7-------------
#Let’s look at few helpful and commonly used arguments from the layout() function.
#Create and save a scatter plot object with first and second columns of iris dataset as x and y arguments respectively. Colour the markers based on the species

p <- plot_ly(x= iris[,1], y = iris[,2], type="scatter", mode = "markers", color = iris[,5])

# Exercise 8------------
#a. Add an appropriate title to the plot using the layout function and title argument.
#b. Add an appropriate x-axis label using the xaxis argument. xaxis takes a list of attribute values. Refer to the R reference page for more help.
#c. Add an appropriate y-axis label.

p %>% layout(title = "Scatter plot")
p %>% layout(title = "Scatter plot", xaxis = list(title = "First column"))
p %>% layout(title = "Scatter plot", xaxis = list(title = "First column"), yaxis = list(title = "Second column"))

 
# Notice how the tick marks and the axes appear behind the chart.

# Exercise 9------------
#a. Use the range attribute in the list of values given to the xaxis argument to set the x-axis range from 1 to 10.
#b. Similarly, set the y-axis range from 1 to 5.

p %>% layout(title = "Scatter plot", xaxis = list(title = "First column", range = c(1,10)), yaxis = list(title = "Second column"))
p %>% layout(title = "Scatter plot", xaxis = list(title = "First column", range = c(1,10)), yaxis = list(title = "Second column", range = c(1,5)))
 
# Exercise 10--------
# Try different layout options to further customize the font, axes etc… of the plot.
