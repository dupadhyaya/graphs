#ggweekly
#https://github.com/gadenbuie/ggweekly

devtools::install_github("gadenbuie/ggweekly")

library(ggweekly)
ggweek_planner(
  start_day = "2019-04-01", 
  end_day = "2019-06-30", 
)
ggweek_planner(  start_day = "2024-11-01",  end_day = "2024-12-30")


ggweek_planner (  start_day = "2019-04-01", end_day = "2019-06-30", show_month_boundaries = F,  show_month_start_day = F, week_start = "isoweek",   week_start_label = "week" ) +    ggplot2::ggtitle("2019") +   ggplot2::facet_wrap(~ month, scales = 'free')

ggweek_planner (  start_day = "2025-01-01", end_day = "2025-12-31", show_month_boundaries = F,  show_month_start_day = F, week_start = "isoweek",   week_start_label = "week" ) +    ggplot2::ggtitle("2025") +   ggplot2::facet_wrap(~ month, scales = 'free')

ggweek_planner (  start_day = "2025-01-01", end_day = "2025-12-31", show_month_boundaries = F,  show_month_start_day = F, week_start = "epiweek",   week_start_label = "week" , weekend_fill = 'gray') +    ggplot2::ggtitle("2025") +   ggplot2::facet_wrap(~ month, scales = 'free')


#projectPln------
project_days <- dplyr::tribble(
  ~day,             ~label,    ~color,     ~fill,
  "2019-07-02", "Project Kick Off", "#02307a", "#02307a",
  "2019-07-12",          "LOI Due", "#02307a", "#02307a",
  "2019-07-26",      "First Draft", "#02307a", "#02307a",
  "2019-08-05",        "Work week", "#bf006c", "#bf006c",
  "2019-08-06",                 NA,        NA, "#bf006c",
  "2019-08-07",                 NA,        NA, "#bf006c",
  "2019-08-08",                 NA,        NA, "#bf006c",
  "2019-08-09",                 NA,        NA, "#bf006c",
  "2019-08-23", "Final Submission", "#02307a", "#02307a"
)
project_days
ggweek_planner(  start_day = "2019-07-01",   highlight_days = project_days ) +   ggplot2::ggtitle("A Very Important Project")
