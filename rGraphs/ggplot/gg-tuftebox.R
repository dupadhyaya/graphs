# GG Plot2 - Tufte
#
library(ggthemes)
library(ggplot2)
theme_set(theme_tufte())  # from ggthemes

# plot
g <- ggplot(mpg, aes(manufacturer, cty))
g
g + geom_tufteboxplot() +  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +  labs(title="Tufte Styled Boxplot",  subtitle="City Mileage grouped by Class of vehicle", caption="Source: mpg",       x="Class of Vehicle",        y="City Mileage")
