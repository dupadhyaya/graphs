# ggplot + forcats


pacman::p_load(tidyverse, forcats)

head(gss_cat)
summary(gss_cat)
str(gss_cat)

gss_cat %>% mutate(race = fct_reorder(race, age, .na_rm=T))

gearG1 <- mtcars %>% group_by(gear)  %>% summarise(mpg = mean(mpg, na.rm=T))
gearG2 <- mtcars %>% group_by(gear)  %>% summarise(wt = mean(wt, na.rm=T))  %>% mutate(gear = factor(gear))
gearG2

gearG2 %>% mutate(gear = fct_reorder(gear, desc(wt)))

mtcars3 <- mtcars %>% mutate(gear = factor(gear))  %>% mutate(gear = fct_reorder(gear, wt, .fun = mean ))
str(mtcars3)
mtcars3 %>% ggplot(., aes(x=gear, y=wt, fill=gear)) + geom_bar(stat='summary', fun='mean', position= position_dodge(.8))
mtcars3 %>% ggplot(., aes(x=reorder(gear,-wt), y=wt, fill=gear)) + geom_bar(stat='summary', fun='max', position= position_dodge(.8)) + geom_text(aes(label=after_stat(round(y,2))), stat='summary', fun='mean')

??ddply

library(plyr)
?dbplyr
ddply(mtcars, .(gear, am), summarise, meanMPG = mean(mpg, na.rm=T))
ddply(mtcars, .(gear), summarise, meanMPG = mean(mpg, na.rm=T), meanHP = mean(hp, na.rm=T))

ddply(mtcars, .(gear), each(nrow, ncol, max))
ddply(mtcars, .(), c('nrow', 'ncol'))
ddply(mtcars, .(gear, am), each(nrow, ncol))


l_ply(1:100, identity, .progress=progress_text(char='.'))
l_ply(1:100, identity, .progress ='text')
