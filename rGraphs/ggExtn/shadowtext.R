#shadowtext
#https://cran.r-project.org/web/packages/shadowtext/vignettes/shadowtext.html
library(shadowtext)

grid.shadowtext("grid is awesome", gp=gpar(cex=3, col="white"), rot=45)
grid.shadowtext("hello world", y=0.85, gp=gpar(cex=5, col="steelblue"), bg.colour="firebrick")
grid.shadowtext("R you ready!!!", y=.1, gp=gpar(cex=4, col="firebrick"))


library(ggplot2)

random_text <- function(n=1, length=10) {
  d <- data.frame(n=1:n, length=length)
  sapply(1:nrow(d), function(i) {
    paste(sample(c(0:9, letters, LETTERS),
                 d$length[i], replace=TRUE),
          collapse="")
  })
}

n <- 10
set.seed(2017-10-27)
d <- data.frame(x = rnorm(n), y=rnorm(n),     label = random_text(n), angle = sample(0:360, 10))
p <- ggplot(d, aes(x, y)) + xlim(-2, 2.2) + ylim(-2, 2.4)

p + geom_shadowtext(aes(label=label, angle=angle), size=5)


p + geom_shadowtext(aes(label=label, angle=angle, color=label),  bg.colour='firebrick', size=5) +  theme(legend.position="none")


x <- c("a","b","c","d","e","f")
y <- c("10", "9","-10","11","-3","-15")
data <- data.frame(x, y)
data$y <- as.numeric(as.character(data$y))

data$category <- ifelse(as.numeric(data$y)<0, 0, 1)
data$category <- as.factor(data$category)

g <- ggplot(data, aes(x = x, y = y)) +   geom_bar(stat = "identity", aes(fill = category))

g + theme(axis.text.x = element_shadowtext(  colour = "white",  size = 12,face = "bold"))
