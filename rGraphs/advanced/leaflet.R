
library(leaflet)
africa_data_points = data.frame(
  lat = rnorm(26, mean = 6.9, sd = 20),
  lng = rnorm(26, mean = 17.7, sd = 20),
  size = runif(26, 5, 10),
  label = letters
)
leaflet(data = africa_data_points) %>%
  addTiles() %>%
  addCircleMarkers(popup = ~label, radius = ~size)
