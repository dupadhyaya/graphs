#gg smooth

library(tidyverse)

mtcars %>% ggplot(., aes(x=wt, y=mpg)) + geom_point()

mtcars %>% ggplot(., aes(x=wt, y=mpg)) + geom_point() + geom_smooth()

mtcars %>% ggplot(., aes(x=wt, y=mpg, color=am, size=hp)) + geom_point() + geom_smooth()


library(ggalt)
midwest
head(midwest)
names(midwest)
options(scipen = 999)
midwest %>% ggplot(., aes(x=area, y=poptotal)) + geom_point(aes(col=state, size=popdensity)) + geom_smooth(method='loess', se=F) + xlim(c(0,0.1)) + ylim(c(0,500000)) + geom_encircle(aes(x=area, y=popdensity), data = midwest %>% filter(between(poptotal, 350000, 500000) & between(area, .01, .1)))
#between  #<= >=


mpg %>% ggplot(., aes(x=cty, y=hwy)) + geom_point() + geom_smooth(method="lm", se=F)  + geom_jitter(width = .5, size=1)


#when overlap, make bigger circle
mpg %>% ggplot(., aes(x=cty, y= hwy)) + geom_point()
mpg %>% ggplot(., aes(x=cty, y= hwy)) + geom_count(col='tomato', show.legend = F) + geom_text(stat='count', aes(label=after_stat(count)))
