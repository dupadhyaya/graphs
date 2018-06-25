# histogram 

density(x)
density(x)$x
density(x)$y
head(cbind(density(x)$x, density(x)$y))
plot(density(x))
abline(v=45)
abline(h=0.038)

hist(x)
breaks = seq(0,100,10)
breaks
c = cut(x, breaks)
c
table(c)
abline(h=c(2,12,38,29,17,2))

hist(mtcars$mpg,12, freq=FALSE)
lines(density(mtcars$mpg))
rug(jitter(mtcars$mpg))
head(sort(mtcars$mpg))
