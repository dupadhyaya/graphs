#Panel Data
#https://cran.r-project.org/web/packages/plm/vignettes/plmPackage.html
#https://www.princeton.edu/~otorres/Panel101R.pdf

library(plm)
head(Grunfeld)

data("EmplUK", package="plm")
data("Produc", package="plm")
data("Grunfeld", package="plm")
data("Wages", package="plm")

head(Grunfeld)

E <- pdata.frame(EmplUK, index=c("firm","year"), drop.index=TRUE, row.names=TRUE)
head(E)
head(attr(E, "index"))
summary(E$emp)
#----------
head(mtcars)

mtPLM = pdata.frame(mtcars, index=c('am','gear'), drop.index=T, row.names = T)
mtPLM
