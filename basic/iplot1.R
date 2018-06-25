# Install iplots
#install.packages("iplots",dep=TRUE)


# Create some linked plots 
library(iplots)
cyl.f <- factor(mtcars$cyl)
gear.f <- factor(mtcars$factor) 
attach(mtcars) 
ihist(mpg) # histogram 
ibar(carb) # barchart
iplot(mpg, wt) # scatter plot
ibox(mtcars[c("qsec","disp","hp")]) # boxplots 
ipcp(mtcars[c("mpg","wt","hp")]) # parallel coordinates
imosaic(cyl.f,gear.f) # mosaic plot