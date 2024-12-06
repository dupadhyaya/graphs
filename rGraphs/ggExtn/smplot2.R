#dataviz -smplot2
#https://smin95.github.io/dataviz/
#https://smin95.github.io/dataviz/basics-of-ggplot2-and-correlation-plot.html#improve-data-visualization-using-smplot2
#install.packages('smplot2')


#devtools::install_github('smin95/smplot2',force = T)
library(tidyverse) # it has ggplot2 package
library(cowplot) # it allows you to save figures in .png file
library(smplot2)

mpg

ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +   geom_point(mapping = aes( x = displ, y = hwy, color = class, shape = class   ))


ggplot(data = mpg) +   geom_point(mapping = aes( x = displ, y = hwy,     color = class ) , shape = 17)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class), shape = 21)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

#3.3---------
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +  geom_point()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +  geom_point() + sm_hvgrid()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +  geom_point() + sm_hvgrid(borders = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +  geom_point() + sm_hvgrid(borders = T)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +  geom_point() + sm_hvgrid(legends = F)


ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) +  geom_point(shape = 21, fill = "#0f993d", color = "white", size = 3) +  sm_hvgrid()

ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) + geom_point(shape = 21, fill = "#0f993d", color = "white", size = 3) + sm_statCorr()


ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) + geom_point(shape = 21, fill = "#0f993d", color = "white", size = 3) +   sm_statCorr(  color = "#0f993d", corr_method = "spearman",     linetype = "dashed"  )

ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) +  geom_point(shape = 21, fill = "#0f993d", color = "white", size = 3) + sm_statCorr(  color = "#0f993d", corr_method = "spearman",  linetype = "dashed", R2 = TRUE )

ggplot(data = mtcars, aes(x = drat, y = mpg)) +  geom_point(shape = 21, fill = "#0f993d", color = "white", size = 3) +   sm_statCorr(color = "#0f993d", corr_method = "pearson")

ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) +   geom_point(shape = 21, fill = "green", color = "white", size = 3) +   sm_statCorr(color = "green")

ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) +   geom_point(shape = 21, fill = "#0f993d", color = "white", size = 3) + sm_statCorr(  corr_method = "spearman", fit.params = list( color = "#0f993d",  linetype = "dashed" )  )

ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) + geom_point(shape = 21, fill = "#0f993d", color = "white", size = 3) +  sm_corr_avgErr(data = mtcars, x = drat, y = mpg)


#
#-------
set.seed(211) # generate random data
group1 <- abs(rnorm(20, 2.5, 1))
group2 <- abs(rnorm(20, 5, 1))
Subject <- rep(paste0("S", seq(1:20)), 2)
Data <- data.frame(Value = matrix(c(group1, group2), ncol = 1))
Group <- rep(c("Group 1", "Group 2"), each = length(group1))
df <- cbind(Subject, Data, Group)
ggplot(data = df, mapping = aes(x = Group, y = Value, color = Group)) +  sm_bar(borders = FALSE) + scale_color_manual(values = sm_color("blue", "orange")) + ggtitle("A bar graph")
