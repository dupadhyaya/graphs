#visdata

#https://docs.ropensci.org/visdat/


#install.packages("visdat")
#Initially inspired by csv-fingerprint, vis_dat helps you visualise a dataframe and “get a look at the data” by displaying the variable classes in a dataframe as a plot with vis_dat, and getting a brief look into missing data patterns using vis_miss


library(visdat)

vis_dat(airquality)
vis_dat(airquality, warn_large_data = FALSE)
vis_dat(airquality, facet = Month)


vis_miss(airquality)

vis_miss(airquality,    cluster = TRUE)

vis_miss(airquality,    sort_miss = TRUE)


test_miss_df <- data.frame(x1 = 1:10000,   x2 = rep("A", 10000), x3 = c(rep(1L, 9999), NA))

vis_miss(test_miss_df)

vis_miss(mtcars)

set.seed(2019-04-03-1105)
chickwts_diff <- chickwts
chickwts_diff[sample(1:nrow(chickwts), 30),sample(1:ncol(chickwts), 2)] <- NA

vis_compare(chickwts_diff, chickwts)


vis_expect(airquality, ~.x >= 25)


vis_cor(airquality)
vis_value(airquality)


library(ggplot2)
vis_value(iris)
library(dplyr)
iris %>%   select_if(is.numeric) %>%   vis_value()

vis_binary(dat_bin)
