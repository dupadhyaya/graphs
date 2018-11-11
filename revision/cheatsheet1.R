#cheat sheet

mtc = mtcars

g = ggplot(data=mtc, aes(x=wt, y=mpg))
g + geom_blank()

g+ geom_point(stat='identity')
summary(lm(mpg ~ wt, data=mtc))
g + geom_abline(aes(intercept = 0, slope=1))
(g1 = g + geom_point(stat='identity') +  geom_abline(aes(intercept = 37, slope=-5)))

g1 + geom_hline(aes(yintercept=25)) + geom_hline(aes(yintercept=20))

g1 + geom_vline(aes(xintercept=3),colour='red') + geom_vline(aes(xintercept=4), colour='blue')

g1 + geom_segment(aes(xend=1, yend=1))
g1 + geom_spoke(aes(angle=1:32, radius=1))


#one var
g2 = ggplot(data=mtc, aes(x=mpg))
g2 + geom_area(stat='bin', bins=10)
g2 + geom_density()
g2 + geom_dotplot(binwidth=1.5)
g2 + geom_dotplot(binwidth=1.5,stackdir = "center", stackratio = .9) + scale_y_continuous(NULL, breaks = NULL)

g3 = ggplot(data=mtc, aes(x=factor(gear)))
g3 + geom_dotplot(binwidth=1.5)
g3 + geom_dotplot(binwidth=1.5, stackratio = 1.1, dotsize = .1) + scale_y_discrete(name="counts", breaks = c(0,2,5,7))

#freqpoly
g4 = ggplot(data=mtc, aes(x=mpg))
g4 + geom_polygon()  #error
