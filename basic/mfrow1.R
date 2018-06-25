# Multiple Plots in 1 Window


par(mfrow=c(2,2))
for (i in 1:4) {
hist(mtcars$cyl, main=i)
}

par(mfcol=c(2,2))
for (i in 1:4) {
  hist(mtcars$cyl, main=i)
}
