## Dot plot from a single numeric vector 
# dotplot

# Dot plot from a single numeric vector 
ggplot2.dotplot(data=numVector)
# Basic dot plot from the vector "len"
ggplot2.dotplot(data=df, xName='dose',yName='len')
# change dotsize and stack ratio
ggplot2.dotplot(data=df, xName='dose',yName='len', 
                stackratio=1.5, dotsize=1.2)
# Change the orientation: Horizontal dot plot
ggplot2.dotplot(data=df, xName='dose',yName='len',
                orientation="horizontal")
# Dot plot with box plot
ggplot2.dotplot(data=df, xName='dose',yName='len',
                addBoxplot=TRUE)
# dot plot with notched box plot
ggplot2.dotplot(data=df, xName='dose',yName='len',
                addBoxplot=TRUE,notch=TRUE)


# Dot plot with mean point
ggplot2.dotplot(data=df, xName='dose',yName='len',
                addMean=TRUE, meanPointShape=23, meanPointSize=4,
                meanPointColor="black", meanPointFill="blue")
#Change the dot plot border color
ggplot2.dotplot(data=df, xName='dose',yName='len',
                colour="red")


# Change main title and axis titles
ggplot2.dotplot(data=df, xName='dose',yName='len',
                mainTitle="Plot of length \n by dose",
                xtitle="Dose (mg)", ytitle="Length")
# Customize title styles. Possible values for the font style :
# 'plain', 'italic', 'bold', 'bold.italic'.
ggplot2.dotplot(data=df, xName='dose',yName='len',
                xtitle="Dose (mg)", ytitle="Length",
                mainTitle="Plot of length \n by dose",
                mainTitleFont=c(14,"bold.italic", "red"),
                xtitleFont=c(14,"bold", "#993333"),
                ytitleFont=c(14,"bold", "#993333"))
# Hide x an y axis titles
ggplot2.dotplot(data=df, xName='dose',yName='len',
                xShowTitle=FALSE, yShowTitle=FALSE)


# Axis ticks labels and orientaion
ggplot2.dotplot(data=df, xName='dose',yName='len',
                xShowTitle=FALSE, yShowTitle=FALSE,
                xTickLabelFont=c(14,"bold", "#993333"),
                yTickLabelFont=c(14,"bold", "#993333"),
                xtickLabelRotation=45, ytickLabelRotation=45)
# Hide axis tick labels
ggplot2.dotplot(data=df, xName='dose',yName='len',
                xShowTitle=FALSE, yShowTitle=FALSE,
                xShowTickLabel=FALSE, yShowTickLabel=FALSE)
# Hide axis ticks
ggplot2.dotplot(data=df, xName='dose',yName='len',
                xShowTitle=FALSE, yShowTitle=FALSE,
                xShowTickLabel=FALSE,yShowTickLabel=FALSE,
                hideAxisTicks=TRUE)
# AxisLine : a vector of length 3 indicating the size,
#the line type and the color of axis lines
ggplot2.dotplot(data=df, xName='dose',yName='len',
                axisLine=c(1, "solid", "darkblue"))

