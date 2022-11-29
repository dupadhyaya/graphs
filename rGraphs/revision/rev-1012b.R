#ggpredict in ggiraphExtra

#https://cran.r-project.org/web/packages/ggiraphExtra/vignettes/ggPredict.html

library(ggiraph)
library(ggiraphExtra)
?ggPredict
fit2 = lm(weight ~ height, data=women)
ggPredict(fit2,se=TRUE,interactive=TRUE)
ggPredict(fit2, interactive=TRUE)

require(TH.data) # for use data GBSG2
fit5=glm(cens~pnodes*horTh,data=GBSG2,family=binomial)
head(GBSG2)
summary(fit5)
ggPredict(fit5,se=TRUE,interactive=TRUE,digits=3)

fit6=glm(cens~pnodes+horTh,data=GBSG2,family=binomial)
summary(fit6)
ggPredict(fit6,se=TRUE,interactive=TRUE,digits=3)

fit7=glm(cens~pnodes*age,data=GBSG2,family=binomial)
summary(fit7)
ggPredict(fit7,interactive=TRUE)
ggPredict(fit7,interactive=TRUE,colorn=100,jitter=FALSE)

fit8=glm(cens~pnodes*age*horTh,data=GBSG2,family=binomial)
summary(fit8)
ggPredict(fit8,interactive=TRUE,colorn=100,jitter=FALSE)

require(moonBook)

fit=lm(NTAV~age,data=radial)
summary(fit)
require(ggplot2)
ggplot(radial,aes(y=NTAV,x=age))+geom_point()+geom_smooth(method="lm")

require(ggiraph)
require(ggiraphExtra)
require(plyr)
ggPredict(fit,se=TRUE,interactive=TRUE)
#identify the points and see the regression equation with your mouse.

fit1=lm(NTAV~age+sex,data=radial)
summary(fit1)
#For female patient, y=0.64*x+17.87
#For male patient, y=0.64*x+38.42 [ 17.87 + 20.54]
equation1=function(x){coef(fit1)[2]*x+coef(fit1)[1]}
equation2=function(x){coef(fit1)[2]*x+coef(fit1)[1]+coef(fit1)[3]}

ggplot(radial,aes(y=NTAV,x=age,color=sex))+geom_point()+  stat_function(fun=equation1,geom="line",color=scales::hue_pal()(2)[1])+ stat_function(fun=equation2,geom="line",color=scales::hue_pal()(2)[2])
ggPredict(fit1,se=TRUE,interactive=TRUE)

fit2=lm(NTAV~age*DM,data=radial)
summary(fit2)
ggplot(radial,aes(y=NTAV,x=age,color=factor(DM)))+geom_point()+stat_smooth(method="lm",se=FALSE)
ggPredict(fit2,colorAsFactor = TRUE,interactive=TRUE)

fit3=lm(NTAV~age*weight,data=radial)
summary(fit3)
# For bodyweight 40kg, y=0.26*x+33.44
# For bodyweight 50kg, y=0.41*x+32.4
# For bodyweight 90kg, y=0.99*x+28.23
ggplot(radial,aes(y=NTAV,x=age,color=weight))+geom_point()+stat_smooth(method="lm",se=FALSE)
ggPredict(fit3,interactive=TRUE)

fit4=lm(NTAV~age*weight*HBP,data=radial)
summary(fit4)
ggPredict(fit4,interactive = TRUE)