#plot for LM and GLM
#https://cran.r-project.org/web/packages/ggfortify/vignettes/plot_lm.html
library(ggfortify)

autoplot(lm(Petal.Width ~ Petal.Length, data = iris), label.size = 3)

par(mfrow = c(1, 2))
m <- lm(Petal.Width ~ Petal.Length, data = iris)

autoplot(m, which = 1:6, ncol = 3, label.size = 3)

m <- glm(Murder ~ Assault + UrbanPop + Rape,
         family = gaussian, data = USArrests)
autoplot(m, which = 1:6, label.size = 3)

#Decorating Plots
#Because {ggplot2} itself cannot handle different kinds of plots in a single instance, {ggfortify} handle them using its original class named ggmultiplot. You can use + operator to decorate ggmultiplot.

class(autoplot(m))
autoplot(m, label.size = 3) + theme_bw()

#plotting options
autoplot(m, which = 1:6, colour = 'dodgerblue3',
         smooth.colour = 'black', smooth.linetype = 'dashed',
         ad.colour = 'blue',
         label.size = 3, label.n = 5, label.colour = 'blue',
         ncol = 3)
#names not retained
autoplot(lm(Petal.Width ~ Petal.Length, data = iris), data = iris, colour = 'Species', label.size = 3)

#Plotting {glmnet}
#{ggfortify} supports {glmnet} package which supports Regularized Generalized Linear Models (Ridge, Lasso and Elastic-net).

library(glmnet)
data(QuickStartExample)
fit <- glmnet::glmnet(x, y)
autoplot(fit)

fit <- glmnet::cv.glmnet(x, y)
autoplot(fit, colour = 'blue')
