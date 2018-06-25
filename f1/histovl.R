# Overlaid Histogram
#http://www.r-graph-gallery.com/113-overlaid-interactive-histogram-plotly/
  
# Library
library(plotly)

# Overlaid histogram of 2 vectors:
graph=plot_ly(x = rnorm(500), opacity = 0.6, type = "histogram") %>%
  add_trace(x = rnorm(500)+1) %>%
  layout(barmode="overlay")
graph
