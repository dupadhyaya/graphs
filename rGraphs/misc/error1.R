# Errors during plots

#Error in plot.new() : figure margins too large
#check for 
par("mar") #output. You should be getting:[1] 5.1 4.1 4.1 2.1

#change that write:
  
par(mar=c(1,1,1,1))

#if you get this message in RStudio, clicking the 'broomstick' figure "Clear All Plots" in Plots tab and try plot() again.

#Moreover Execute the command
graphics.off()  
par("mar")
par(mar=c(1,1,1,1))

