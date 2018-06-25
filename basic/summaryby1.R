# summaryby

library(doBy)

summaryBy(mpg + hp + wt ~ am, data = mtcars, FUN=mean)
