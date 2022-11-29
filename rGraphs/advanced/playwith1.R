# New Graph System

library(playwith)
library(lattice)
playwith(
  xyplot(mpg~wt|factor(cyl)*factor(am),
         data=mtcars, subscripts=TRUE,
         type=c("r", "p"))
)
