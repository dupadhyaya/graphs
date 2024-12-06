#superheat
#https://rlbarter.github.io/superheat/
#https://rlbarter.github.io/superheat/basic-usage.html
# install devtools
#install.packages("devtools")
# use devtools to install superheat
#devtools::install_github("rlbarter/superheat")

library(superheat)

superheat(mtcars,    # change the size of the labels
          left.label.size = 0.4,    bottom.label.size = 0.1)

superheat(mtcars,     scale = TRUE)

# # retain original order of rows/cols,  # scale the matrix columns
superheat(mtcars,pretty.order.rows = TRUE, pretty.order.cols = TRUE, scale = TRUE)
# # order the rows by miles per gallon, # scale the matrix columns
superheat(mtcars, order.rows = order(mtcars$mpg), scale = TRUE)

superheat(mtcars, scale = TRUE, heat.col.scheme = "red")

superheat(mtcars, scale = TRUE, heat.pal = c("#b35806", "white", "#542788"))

superheat(mtcars,
          # scale the matrix columns
          scale = TRUE,
          # change the color (#b35806 = brown and #542788 = purple)
          heat.pal = c("#b35806", "white", "#542788"),
          heat.pal.values = c(0, 0.5, 1))

superheat(mtcars,
          # scale the matrix columns
          scale = TRUE,
          heat.lim = c(-1, 2))

superheat(mtcars,
          # scale the matrix columns
          scale = TRUE,
          heat.lim = c(-1, 2),
          extreme.values.na = FALSE)

#missing
mtcars.missing <- mtcars
mtcars.missing[sample(1:nrow(mtcars), 5),   sample(1:ncol(mtcars), 5)] <- NA

superheat(mtcars.missing, scale = T)
superheat(mtcars.missing, scale = T, heat.na.col = "white")

superheat(mtcars,  scale = TRUE, row.dendrogram = TRUE)

set.seed(2016113) 
# generate three column clusters

superheat(mtcars, scale = TRUE, n.clusters.rows = 3)
?superheat

set.seed(2016113)
superheat(mtcars, scale = TRUE,  n.clusters.rows = 3,   left.label = 'variable')

superheatmap <- superheat(mtcars, scale = TRUE,  n.clusters.rows = 3, left.label = 'variable', print.plot = F)

superheatmap$membership.rows

gears <- paste(mtcars$gear, "gears")

set.seed(2016113)
superheat(mtcars,     scale = TRUE,                              # cluster by gears
          membership.rows = gears)

superheat(mtcars,     scale = TRUE,      # plot title
          title = "Superheat for mtcars",
          title.alignment = "center")

superheat(mtcars,  scale = TRUE, #row title
          row.title = "Cars",
          row.title.size = 6,       # col title
          column.title = "Variables",
          column.title.size = 6)

superheat(dplyr::select(mtcars, -mpg),        scale = T,          yr = mtcars$mpg, yr.axis.name = "miles per gallon")


superheat(X = mtcars, # heatmap matrixscale the matrix columns
          scale = TRUE,       # add text matrix
          X.text = round(as.matrix(mtcars), 1),
          X.text.size = 4)

# set the text colors 
# identify all scaled values that fall below -0.3
mtcars.col <- scale(mtcars) < -0.3
# set all values that satisfy the condition to "white"
mtcars.col <- gsub("TRUE", "white", mtcars.col)
# set all values that do not satisfy the condition to "black"
mtcars.col <- gsub("FALSE", "black", mtcars.col)
# convert to matrix
mtcars.col <- matrix(mtcars.col, ncol = ncol(mtcars))

superheat(X = mtcars, # heatmap matrix  # scale the matrix columns
          scale = TRUE,      # add text matrix
          X.text = round(as.matrix(mtcars), 1),
          X.text.col = mtcars.col,
          X.text.size = 4)

mtcars.size <- scale(mtcars) + 2
superheat(X = mtcars, # heatmap matrix scale the matrix columns
          scale = TRUE,       # add text matrix
          X.text = round(as.matrix(mtcars), 1),
          X.text.col = mtcars.col,
          X.text.size = mtcars.size)


superheat(X = mtcars, # heatmap matrix# change the color of the labels
          left.label.col = "white",
          bottom.label.col = c("#b3e2cd","#fdcdac","#e5d8bd"),
          # scale the matrix columns
          scale = TRUE)

superheat(X = mtcars, # heatmap matrix# change the angle of the label text
          bottom.label.text.angle = 90,
          # scale the matrix columns
          scale = TRUE)

superheat(X = mtcars, # heatmap matrix# change the angle of the label text
          bottom.label.text.angle = 90,
          left.label.text.alignment = "left",
          bottom.label.text.alignment = "right",
          # scale the matrix columns
          scale = TRUE)

set.seed(2016113)
superheat(mtcars, scale = TRUE,  # cluster the heatmap
          n.clusters.rows = 5,
          left.label = "variable",
          n.clusters.cols = 2,
          bottom.label = "variable")

superheat(mtcars, scale = TRUE, # specify the number of legend breaks
          legend.num.ticks = 10)

gears <- paste(mtcars$gear, "gears")

set.seed(2016113)
superheat(mtcars,        scale = TRUE, # cluster by gears
          membership.rows = gears,
           # place each variable in its own cluster
          membership.cols = 1:ncol(mtcars),
          bottom.label = "variable",
          # smooth the heatmap within clusters
          smooth.heat = TRUE)
