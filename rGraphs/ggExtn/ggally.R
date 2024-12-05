#ggally/ ggpairs

#https://ggobi.github.io/ggally/
#install_github("ggobi/ggally")
#install.packages("GGally")

library(GGally)

data(tips)
pm <- ggpairs(tips)
pm

pm <- ggpairs(tips, columns = c(1, 6, 2))
pm <- ggpairs(tips, columns = c("total_bill", "time", "tip"), columnLabels = c("Total Bill", "Time of Day", "Tip"))
pm

pm <- ggpairs(tips, mapping = aes(color = sex), columns = c("total_bill", "time", "tip"))
pm

ggpairs(mtcars %>% select(mpg, wt, gear))

#matrixselections------
pm <- ggpairs(   tips,   columns = c("total_bill", "time", "tip"),   lower = list( continuous = "smooth",    combo = "facetdensity",    mapping = aes(color = time)  ))
pm

pm <- ggpairs(   tips,   columns = c("total_bill", "time", "tip"), upper = "blank",diag = NULL
)
pm
my_bin <- function(data, mapping, ..., low = "#132B43", high = "#56B1F7") {
  ggplot(data = data, mapping = mapping) +     geom_bin2d(...) +  scale_fill_gradient(low = low, high = high)}

pm <- ggpairs(   tips, columns = c("total_bill", "time", "tip"),   lower = list(   combo = wrap("facethist", binwidth = 1),  continuous = wrap(my_bin, binwidth = c(5, 0.5), high = "red")   ))
pm

#-------
pm <- ggpairs(  tips,   columns = c("total_bill", "time", "tip"),   lower = list( combo = wrap("facethist", binwidth = 1),     continuous = wrap(my_bin, binwidth = c(5, 0.5), high = "red") ))
pm

