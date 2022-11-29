# Doughnut

# load GGplot2
library(ggplot2)

# Create test data.
dat = data.frame(count=c(10, 60, 30), category=c("A", "B", "C"))

# Add addition columns, needed for drawing with geom_rect.
dat$fraction = dat$count / sum(dat$count)
dat = dat[order(dat$fraction), ]
dat$ymax = cumsum(dat$fraction)
dat$ymin = c(0, head(dat$ymax, n=-1))

# Make the plot
p1 = ggplot(dat, aes(fill=category, ymax=ymax, ymin=ymin, xmax=4, xmin=3)) +  geom_rect() + coord_polar(theta="y") + xlim(c(0, 4)) + theme(panel.grid=element_blank()) + theme(axis.text=element_blank()) + theme(axis.ticks=element_blank()) +  annotate("text", x = 0, y = 0, label = "My Ring plot !") +  labs(title="")
p1

df = mtcars
catcols = c('gear','cyl','am','vs','carb')
df[catcols] = lapply(df[catcols], as.factor)
df %>% group_by(gear)  %>% tally() -> dat
dat
dat$fraction = dat$n / sum(dat$n)
dat = dat[order(dat$fraction), ]
dat$ymax = cumsum(dat$fraction)
dat$ymin = c(0, head(dat$ymax, n=-1))
dat
ggplot(dat, aes(fill=factor(gear), ymax=ymax, ymin=ymin, xmax=3, xmin=1)) +  geom_rect()
?geom_rect
ggplot(dat, aes(fill=factor(gear), ymax=ymax, ymin=ymin, xmax=4, xmin=3)) +  geom_rect() + coord_polar(theta="y") + xlim(c(0, 4)) + theme(panel.grid=element_blank()) + theme(axis.text=element_blank()) + theme(axis.ticks=element_blank()) +  annotate("text", x = 0, y = 0, label = "Ring plot - Gears!") +  labs(title="")


library(ggpubr)
# Data: Create some data
# +++++++++++++++++++++++++++++++

df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50))

head(df)


# Basic pie charts
# ++++++++++++++++++++++++++++++++
df
ggdonutchart(df, "value", label = "group")
#Change fill color by group
# set line color to white
# Use custom color palette
ggdonutchart(df, "value", label = "group",
             fill = "group", color = "white",
             palette = c("#00AFBB", "#E7B800", "#FC4E07") )
