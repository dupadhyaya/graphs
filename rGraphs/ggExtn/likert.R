#likert

#https://jbryer.github.io/likert/
#https://jbryer.github.io/likert/reference/index.html

#remotes::install_github('jbryer/likert')

library(likert)
library(xtable)
#demo('likert', package='likert')


#shinyLikert()

xtable(likert)

head(pisaitems)
dim(pisaitems)

summary(l24, center=1.5)
head(l24)
class(l24)
names(l24)

plot(l24)
mass
head(mass)
head(sasr)
plot(mass)

print(mass)
print(mass.gap)
xtable(l24)


#data------
items24 <- pisaitems[,substr(names(pisaitems), 1,5) == 'ST24Q']
items24
head(items24)
dim(items24)
names(items24)

likert1 <- likert(items24)
summary(likert1)

likert1g <- likert(items24, grouping=pisaitems$CNT)
summary(likert1g)

xtable(likert1)
