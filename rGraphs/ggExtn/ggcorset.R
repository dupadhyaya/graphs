#-----
library(ggcorset)

data("drinkdays")
drinkdays$change <- drinkdays$time2-drinkdays$time1
drinkdays
plot <- gg_corset(drinkdays, y_var1 = "time1", y_var2 = "time2",  group = "id", c_var = "change", eyelets = F) +  theme_ggcorset()     # A ggcorset theme for polished corset plots!

plot # see the initial visualization


library(ggplot2)
library(MetBrewer) # For the colour palette)
plot +  scale_colour_gradientn("Direction of Change",  colours = MetBrewer::met.brewer("Troy")) +     # Changes legend title, and selects a colour-palette
  ggtitle("Change in Drinking Days") +                                  # Changes the plot title
  ylab("Number of Drinking Days per Week") +                            # Changes the y-axis title
  xlab("") +                                                            # Changes the x-axis title (removes in favour of the 2 time point labels below)
  scale_x_discrete(labels = c("Pre","Post")) +                          # Changes the labels of the 2 time points (on the x-axis)
  guides(colour = guide_legend(override.aes = list(linewidth = 3)))     # Makes the legend lines thicker
