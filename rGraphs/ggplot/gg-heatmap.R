#gg heatmap


data <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", row.names = 1)

data
# Make the heatmap
heatmap( as.matrix(data) )

# Make the heatmap
heatmap( as.matrix(data), scale = "column")

#devtools::install_github("rstudio/d3heatmap")
# Load library
library(d3heatmap)

d3heatmap(mtcars, scale = "column", colors = "Spectral")
d3heatmap(mtcars, scale = "column", colors = "Spectral", dendrogram = 'none')
d3heatmap(mtcars, scale = "column", dendrogram = "none",
color = scales::col_quantile("Blues", NULL, 5))

d3heatmap(mtcars, scale = "col", colors = "Blues", dendrogram = 'row', k_row=3)
# Build heatmap
d3heatmap(data, scale = "column")
