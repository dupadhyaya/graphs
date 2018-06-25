#http://www.sthda.com/english/wiki/easyggplot2
#http://www.sthda.com/english/wiki/ggplot2-scatterplot-easy-scatter-plot-using-ggplot2-and-r-statistical-software

library(devtools)
install_github('easyGgplot2', 'kassambara')
library(easyGgplot2)
#NA for 3.4.4

numVector = rnorm(100)
#BoxPlot----
ggplot2.boxplot(data=ToothGrowth, xName='dose', yName='len', groupName = 'dose')

df = ToothGrowth

ggplot2.boxplot(data=numVector)
names(df)
ggplot2.boxplot(data=df, xName='dose', yName='len')
ggplot2.boxplot(data=df, xName='dose', yName='len', orientation='horizontal')
ggplot2.boxplot(data=df, xName='dose', yName='len', notch=T)

#with mean point

ggplot2.boxplot(data=df, xName='dose', yName='len', addMean = T, meanPointShape = 23, meanPointSize=2.5, meanPointColor = 'black', meanPointFill = 'blue')

ggplot2.boxplot(data=df, xName='dose', yName='len', addDot = T, dotSize=1, dotPosition = 'center')

#with jitter

ggplot2.boxplot(data=df, xName='dose', yName='len', addDot = T, dotSize=1, dotPosition = 'jitter', jitter=.2)

#Type and point size
ggplot2.boxplot(data=df, xName='dose', yName='len', colour='red', linetype= 'dotted')
ggplot2.boxplot(data=df, xName='dose', yName='len', outlier.colour='red', outlier.shape=8, outlier.size=4)


