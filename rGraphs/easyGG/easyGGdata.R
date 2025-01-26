#Data for easyGG Plot
library(devtools)
install_github('easyGgplot2', 'kassambara')
library(easyGgplot2)
#NA for 3.4.4

numVector = rnorm(100)

df = ToothGrowth

#BoxPlot----
ggplot2.boxplot(data=ToothGrowth, xName='dose', yName='len', groupName = 'dose')
