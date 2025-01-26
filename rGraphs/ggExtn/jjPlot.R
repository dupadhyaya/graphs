#jjPlot

#https://junjunlab.github.io/jjPlot-manual/
# install.packages("devtools")
devtools::install_github("junjunlab/jjPlot")

library(ggplot2)
library(jjPlot)

#load test data
data("ToothGrowth")

colnames(ToothGrowth)

pm <-   ggplot(ToothGrowth,aes(x = factor(dose),y = len)) + geom_jjboxplot(aes(fill = factor(dose)))
pm
pn <- ggplot(ToothGrowth,aes(x = factor(dose),y = len)) + geom_boxplot(aes(fill = factor(dose)))
pn
cowplot::plot_grid(pm, pn, align = 'hv')

ggplot(ToothGrowth,aes(x = factor(dose),y = len)) +  geom_jjboxplot(aes(fill = factor(dose)),    outlier.color = 'black',  outlier.size = 5, outlier.show = T)
?geom_jjboxplot


ggplot(ToothGrowth,aes(x = factor(dose),y = len)) +
  geom_jjboxplot(aes(fill = supp),
                 width = 0.8,
                 position = position_dodge(width = 1))

ggplot(ToothGrowth,aes(x = factor(dose),y = len)) +
  geom_jjboxplot(aes(fill = factor(dose)),
                 type = 'left')
