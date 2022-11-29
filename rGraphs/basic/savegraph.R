# Save Graph
# 
Temperature <- airquality$Temp
Temperature
jpeg(file="saving_plot1.jpeg")
hist(Temperature, col="darkgreen")
dev.off()
# jpeg image in the current directory. The resolution of the image by default will be 480x480 pixel.
#png
#specify the resolution we want with arguments width and height
#
png(file="saving_plot2.png",
    width=600, height=350)
hist(Temperature, col="gold")
dev.off()

#bmp
bmp(file="saving_plot3.bmp",
    width=6, height=4, units="in", res=100)
hist(Temperature, col="steelblue")
dev.off()

#tiff
tiff(file="saving_plot3.tiff",
     width=6, height=4, units="in", res=100)
hist(Temperature, col="steelblue")
dev.off()

#vector - vector image is that it is easily resizable. Zooming on the image will not compromise its quality.
#
pdf(file="saving_plot4.pdf")
hist(Temperature, col="violet")
dev.off()

postscript(file="saving_plot4.ps")
hist(Temperature, col="violet")
dev.off()
