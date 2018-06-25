#Pictogram - 
#Package not avl for 3.5
#http://www.stats.uwo.ca/faculty/braun/RTricks/RTricksforWindows.php

library(RTricks)
toys <- c(cars = 10, trains = 1, videogames = 3, actionfigures = 5)

RTricks::pictogram(toys)
toys <- c(cars = 10, trains = 1, videogames = 3, actionfigures = 5)
pictogram(x=toys)
?pictogram
