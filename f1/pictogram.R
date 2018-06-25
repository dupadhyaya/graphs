library(png)
pictogram(icon=man,
          n=c(12,35,52),
          grouplabels=c("dudes","chaps","lads"))
man <- readPNG(file.choose())

red.man <- man
red.man[,,1] <- man[,,4] # fill in red dimension
R <- subset(DF, value == "red")
with(R, rasterImage(red.man, 
                    row-.5, col-.5, row+.5, col+.5, 
                    xlim = c(0, nr), ylim = c(0, nc),
                    xlab = "", ylab = ""))

green.man <- man
green.man[,,2] <- man[,,4] # fill in green dimension
G <- subset(DF, value == "green")
with(G, rasterImage(green.man, 
                    row-.5, col-.5, row+.5, col+.5, 
                    xlim = c(0, nr), ylim = c(0, nc),
                    xlab = "", ylab = ""))

require(ggplot2)

# Generate data
df3 <- data.frame(units = c(1.3, 1.8, 2.7, 4.2, 4.7, 6.7, 20), 
                  what = c('Wikipedia', 'London Olympic Park', 'Aircraft carrier', 
                           'The Great Pyramid', 'Stonehenge', 'Burj Khalifas', 
                           'Empire State Building'))

# make gs an ordered factor
df3$what <- factor(df3$what, levels = df3$what, ordered = TRUE)

#plots
ggplot(df3, aes(what, units)) + geom_bar(fill="white", colour="darkgreen", 
                                         alpha=0.5, stat="identity") + coord_flip() + scale_x_discrete() + 
  scale_y_continuous(breaks=seq(0, 20, 2)) + theme_bw() + 
  theme(axis.title.x  = element_blank(), axis.title.y  = element_blank())



# in case you don't alredy have RCurl
install.packages("RCurl", dependencies = TRUE)
library(RCurl)
source_github <- function(u) {
  # load package
  require(RCurl)
  
  # read script lines from website and evaluate
  script <- getURL(u, ssl.verifypeer = FALSE)
  eval(parse(text = script),envir=.GlobalEnv)
}

source_github("https://raw.githubusercontent.com/robertgrant/pictogram/master/pictogram.R")

# install.packages("png", dependencies = TRUE)
require(png)

img <- readPNG(system.file("img", "Rlogo.png", package="png"))
pictogram(icon = img, n = c( 12, 35, 7),
          grouplabels=c("12 R logos","35 R logos","7 R logos"))
