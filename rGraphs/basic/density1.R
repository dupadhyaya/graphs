# Density Plot

density(x, bw = "nrd0", adjust = 1,
        kernel = c("gaussian", "epanechnikov", "rectangular",
                   "triangular", "biweight",
                   "cosine", "optcosine"),
        weights = NULL, window = kernel, width,
        give.Rkern = FALSE,
        n = 512, from, to, cut = 3, na.rm = FALSE, ...)


set.seed(1234)
(marks = ceiling(rnorm(100,50,20)))
x=marks

hist(x)
density(x)
#bandwidth is a measure of how closely you want the density to match the distribution.

#see bandwith variations
?density
plot(density(x))
plot(density(x,adjust = 100)) #Very smooth
plot(density(x,adjust = 10)) #Very smoth
plot(density(x,adjust = 1)) #smooth
plot(density(x,adjust = .1)) #bumpy


set.seed(201010)
x <- rnorm(1000, 10, 2)
opar = par(no.readonly = T)  # working
par(mfrow = c(2,2))  # 
plot(density(x))  #A bit bumpy
plot(density(x,adjust = 10)) #Very smmoth
plot(density(x,adjust = .1)) #crazy bumpy
par(opar)  # reset frames


# ---------
require(graphics)
str(precip)
head(precip)
?precip  # average rainfall in inces for 70 states 
length(precip)
summary(precip)

plot(density(precip, n = 1000))
plot(density(precip, n = 100))
plot(density(precip, n = 70))
?density

rug(precip)
lines(density(precip, bw = "nrd"), col = 2)
lines(density(precip, bw = "ucv"), col = 3)
lines(density(precip, bw = "bcv"), col = 4)
lines(density(precip, bw = "SJ-ste"), col = 5)
lines(density(precip, bw = "SJ-dpi"), col = 6)
legend(55, 0.035,
       legend = c("nrd0", "nrd", "ucv", "bcv", "SJ-ste", "SJ-dpi"),
       col = 1:6, lty = 1)




# Height can sometimes be > 1
range <- seq(2,6,.01)
n <- 1000
d <- sample(range,n, replace=TRUE)
d <- c(d,rep(0,100))
d <- c(d,rep(1,50))
df <- data.frame(counts=d)
adjust <- 1/20  # change this value to see changes
dens <- density(d,adjust=adjust)
plot(dens)



# Eg
set.seed(1234)
rating  <- rnorm(200)
head(rating)
#> [1] -1.2070657  0.2774292  1.0844412 -2.3456977  0.4291247  0.5060559

rating2 <- rnorm(200, mean=.8)
head(rating2)
#> [1] 1.2852268 1.4967688 0.9855139 1.5007335 1.1116810 1.5604624

# Make a column to indicate which group each value is in
cond <- factor( rep(c("A","B"), each=200) )

data <- data.frame(cond, rating = c(rating,rating2))
head(data)

# Histogram
hist(rating)

# Use 8 bins (this is only approximate - it places boundaries on nice round numbers)
# Make it light blue #CCCCFF
# Instead of showing count, make area sum to 1, (freq=FALSE)
hist(rating, breaks=8, col="#CCCCFF", freq=FALSE)

# Put breaks at every 0.6
boundaries <- seq(-3, 3.6, by=.6)
boundaries
#>  [1] -3.0 -2.4 -1.8 -1.2 -0.6  0.0  0.6  1.2  1.8  2.4  3.0  3.6

hist(rating, breaks=boundaries)


# Kernel density plot
plot(density(rating))

plot.multi.dens <- function(s)
{
  junk.x = NULL
  junk.y = NULL
  for(i in 1:length(s)) {
    junk.x = c(junk.x, density(s[[i]])$x)
    junk.y = c(junk.y, density(s[[i]])$y)
  }
  xr <- range(junk.x)
  yr <- range(junk.y)
  plot(density(s[[1]]), xlim = xr, ylim = yr, main = "")
  for(i in 1:length(s)) {
    lines(density(s[[i]]), xlim = xr, ylim = yr, col = i)
  }
}

# the input of the following function MUST be a numeric list
plot.multi.dens( list(rating, rating2))

library(sm)
sm.density.compare(data$rating, data$cond)
# Add a legend (the color numbers start from 2 and go up)
legend("topright", levels(data$cond), fill=2+(0:nlevels(data$cond)))
