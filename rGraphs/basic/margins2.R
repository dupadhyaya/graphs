# Margins

par(opar)
par(mar = rep(2, 4))
hist(mtcars$mpg)

par(mar = rep(3, 4))
hist(mtcars$mpg)

par(mar = rep(4, 4))
hist(mtcars$mpg)

par(mar = rep(6, 4))
hist(mtcars$mpg)

par(mar = c(1,2,3,4))
hist(mtcars$mpg)

par(mar = c(4,3,2,1))
hist(mtcars$mpg)

plot.new()
windows() 
hist(mtcars$mpg)
