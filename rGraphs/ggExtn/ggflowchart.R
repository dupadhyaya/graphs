# ggplot extn - ggpflowchart
#https://nrennie.rbind.io/ggflowchart/articles/decision-tree-example.html

#remotes::install_github("nrennie/ggflowchart")
pacman::p_load(tidyverse, ggplot2, ggflowchart)

data <- tibble::tibble(from = c("A", "A", "A", "B", "C", "F"), to = c("B", "C", "D", "E", "F", "G"))

ggflowchart(data)

ggflowchart(data, fill='cyan', text_colour = 'red', arrow_colour = 'pink', arrow_linewidth = 3)

#eg2-----
goldilocks <- tibble::tibble(
  from = c(
    "Goldilocks",
    "Porridge", "Porridge", "Porridge",
    "Just right",
    "Chairs", "Chairs", "Chairs",
    "Just right2",
    "Beds", "Beds", "Beds",
    "Just right3"
  ),
  to = c(
    "Porridge",
    "Too cold", "Too hot", "Just right",
    "Chairs",
    "Still too big", "Too big", "Just right2",
    "Beds",
    "Too soft", "Too hard", "Just right3",
    "Bears!"
  )
)
node_data <- tibble::tibble(name = c(
  "Goldilocks", "Porridge", "Just right", "Chairs",
  "Just right2", "Beds", "Just right3", "Too cold",
  "Too hot", "Still too big", "Too big", "Too soft",
  "Too hard", "Bears!"
)) %>%
  dplyr::mutate(label = gsub("\\d+$", "", name))

ggflowchart(goldilocks, node_data)

#colors-----
node_data <- node_data %>%
  dplyr::mutate(
    type = c(
      "Character", "Question", "Answer",
      "Question", "Answer", "Question",
      "Answer", "Answer", "Answer",
      "Answer", "Answer", "Answer",
      "Answer", "Character"
    )
  )
node_data

ggflowchart(goldilocks, node_data, fill = type)
