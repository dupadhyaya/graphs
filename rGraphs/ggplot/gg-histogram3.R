# GG Plot2 - Histogram
# Histogram

library(ggplot2)
theme_set(theme_classic())

# Histogram on a Continuous (Numeric) Variable
g <- ggplot(mpg, aes(displ)) + scale_fill_brewer(palette = "Spectral")
g
g + geom_histogram(aes(fill=class),   binwidth = .1,   col="black",    size=.1) +  # change binwidth labs(title="Histogram with Auto Binning",  subtitle="Engine Displacement across Vehicle Classes")  
# change number of bins
g + geom_histogram(aes(fill=class),    bins=3,   col="black",  size=.1) +    labs(title="Histogram with Fixed Bins", subtitle="Engine Displacement across Vehicle Classes") 

#categoricalValue
library(ggplot2)
theme_set(theme_classic())

# Histogram on a Categorical variable
g <- ggplot(mpg, aes(manufacturer))
g
g + geom_bar(aes(fill=class), width = 0.5) +  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +   labs(title="Histogram on Categorical Variable",  subtitle="Manufacturer across Vehicle Classes") 
