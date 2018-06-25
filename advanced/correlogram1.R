# Library(Correlogram)- Correlogram

#Correlogram

# Correlogram is used to test the level of co-relation among the variable available  in the data set the cells of the matrix can be shaded or colored to show the # co-relation values from our dataset, 
#let's check co-relation between Item cost, weight, visibility along with Outlet establishment year and Outlet sales from below plot

library(corrgram)
corrgram(data1, order=NULL, panel=panel.shade, text.panel=panel.txt,  main="Correlogram") 
