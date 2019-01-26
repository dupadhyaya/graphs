# qplot

library(ggplot2)

df = mtcars

qplot(x=df$mpg)

qplot(x=df$mpg, bins=10)

qplot(x=mpg, data=df, geom="histogram", bins=5)

qplot(x=mpg, data=df, geom="histogram", bins=5, alpha=.8)

qplot(mpg, data=df, geom="density", fill=gear, alpha=I(.5))
#no effect of gear : create gear as factor
df$gear = factor(df$gear)
qplot(mpg, data=df, geom="density", fill=gear, alpha=I(.5), main="Distribution of Gas Milage", xlab="Miles Per Gallon", ylab="Density")


# Scatterplot of mpg vs. hp for each combination of gears and cylinders
plot(y=df$mpg, x=df$hp, col=df$gear) # for each gear type
df$gear = factor(df$gear)
df$am = factor(df$am)
df$cyl = factor(df$cyl)  #error if you do not convert to factors
#Error: A continuous variable can not be mapped to shape

qplot(x=df$hp, y=df$gear, data=df, col=am)
qplot(x=df$hp, y=df$gear, data=df, col=am, facets = gear ~ cyl)
qplot(x=df$hp, y=df$gear, data=df, col=am, facets = gear ~ cyl, shape= am, size=I(3))

# in each facet, transmittion type is represented by shape and color
qplot(hp, mpg, data=df, shape=am, color=am, facets=gear~cyl, size=I(3), xlab="Horsepower", ylab="Miles per Gallon") 


## Separate regressions of mpg on weight for each number of cylinders
qplot(x=wt, y=mpg, data=df)
qplot(wt, mpg, data=mtcars, geom=c("point")) 
qplot(wt, mpg, data=mtcars, geom=c("smooth")) 
#combine both geometry : smooth = confindence interval
qplot(wt, mpg, data=mtcars, geom=c("point", "smooth")) 

qplot(x=wt, y=mpg, data=mtcars, geom=c("point", "smooth"), color=cyl)

qplot(x=wt, y=mpg, data=mtcars, geom=c("point", "smooth"), color=cyl, facets = . ~ gear)

qplot(x=wt, y=mpg, data=mtcars, geom=c("point", "smooth"), color=cyl, facets = cyl ~ .)

qplot(x=wt, y=mpg, data=mtcars, geom=c("point", "smooth"), color=cyl, facets = cyl ~ gear)

qplot(x=wt, y=mpg, data=mtcars, geom=c("point", "smooth"), color=cyl, main="Regression of MPG on Weight", xlab="Weight", ylab="Miles per Gallon")

#method and formula not reqd to be given
#formula used for lm : y ~ x: predict y on x (linear regression)


# Boxplots of mpg by number of gears 
# observations (points) are overlayed and jittered
qplot(gear, mpg, data=df, geom=c("boxplot"))
qplot(gear, mpg, data=df, geom=c("jitter"))
#spread the values which fall into same point
qplot(gear, mpg, data=df, geom=c("boxplot", "jitter"),  fill=gear)

qplot(gear, mpg, data=df, geom=c("boxplot", "jitter"),  fill=gear, main="Mileage by Gear Number",  xlab="Gear", ylab="Miles per Gallon")
