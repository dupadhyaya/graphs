#tsbox

library(tsbox)

ts_plot(AirPassengers, ts_df(lynx), ts_xts(fdeaths))

ts_plot(
  `Airline Passengers` = AirPassengers,
  `Lynx trappings` = ts_df(lynx),
  `Deaths from Lung Diseases` = ts_xts(fdeaths),
  title = "Airlines, trappings, and deaths",
  subtitle = "Monthly passengers, annual trappings, monthly deaths"
)


ts_ggplot(ts_scale(ts_c(mdeaths, austres, AirPassengers, DAX = EuStockMarkets[ ,'DAX'])))


library(dplyr)
library(nycflights13)
weather
dta <- weather %>%  select(origin, time = time_hour, temp, humid, precip) %>%  ts_long()

dta %>%  filter(id == "temp") %>%  ts_trend() %>%  ts_plot()
