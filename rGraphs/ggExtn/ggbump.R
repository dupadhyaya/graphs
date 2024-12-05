#ggbump
#https://github.com/davidsjoberg/ggbump

#devtools::install_github("davidsjoberg/ggbump")
pacman::p_load(tidyverse, ggplot2, ggbump)
library(ggbump)
pacman::p_load(padr, hablar, jsonlite, ggbump,  httr, xml2, lubridate, tidyverse)

#https://github.com/davidsjoberg/ggbump/wiki/My-year-on-Spotify

df <- bind_rows(  as_tibble(fromJSON("StreamingHistory0.json")),  as_tibble(fromJSON("StreamingHistory1.json")) ) %>%    mutate(month = ymd_hm(endTime) %>% as.Date() %>% floor_date("month"))

knitr::kable(head(df), "markdown")

#------
if(!require(ggbump)) devtools::install_github("davidsjoberg/ggbump")
if(!require(ggflags)) devtools::install_github("rensa/ggflags")
if(!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse, countrycode, janitor, padr, hablar, ggflags, ggbump, lubridate)

#https://github.com/davidsjoberg/ggbump/wiki/geom_bump-with-flags
