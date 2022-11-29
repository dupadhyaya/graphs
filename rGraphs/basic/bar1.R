#bar1
library(MASS)                 # load the MASS package 
school = painters$School      # the painter schools 
school
school.freq = table(school)   # apply the table function
school.freq
#Then we apply the barplot function to produce its bar graph.

barplot(school.freq)         # apply the barplot function
barplot(school.freq, horiz=T)

colors = c("red", "yellow", "green", "violet",   "orange", "blue", "pink", "cyan") 
barplot(school.freq,         # apply the barplot function 
   col=colors)                # set the color palette

