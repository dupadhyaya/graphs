# ggstats

#https://larmarange.github.io/ggstats/index.html
pacman::p_load(ggstats)

#ModelCoef----

mod1 <- lm(data= swiss, formula = Fertility ~ Agriculture + Examination + Education + Catholic + Infant.Mortality)
mod1

ggcoef_model(mod1)

ggcoef_table(mod1)

#compareModels-----
mod2 <- step(mod1, direction = "backward", trace=0)
mod3 <- lm(data=swiss, Fertility ~ Agriculture + Education * Catholic)

models <- list('Full Model' = mod1, 'Simplified Model'=mod2, 'With Interaction'=mod3)
ggcoef_compare(models, type='faceted')


#customProportions-----

head(Titanic)
tdf <- as.data.frame(Titanic)
head(tdf)

tdf %>% ggplot(., aes(x=Class, fill=Survived, weight=Freq, by=Class)) + geom_bar(position='fill') +  geom_text(stat='prop', position = position_fill(.5)) +  facet_grid(~Sex)

mtcars %>% ggplot(.) + aes(x=factor(am), y=mpg, fill=factor(gear)) + stat_weighted_mean(geom='bar', position = 'dodge') + ylab('Weight Mean - Gear/ Transission Type')


#likertItems------
#https://larmarange.github.io/ggstats/reference/gglikert.html
likert_levels <- c('Strongly disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly agree')
likert_items <- data.frame(
  item1 = sample(likert_levels, 100, replace = TRUE),
  item2 = sample(likert_levels, 100, replace = TRUE),
  item3 = sample(likert_levels, 100, replace = TRUE)
)
likert_items
gglikert(likert_items)

set.seed(42)
df <-
  tibble(
    q1 = sample(likert_levels, 150, replace = TRUE),
    q2 = sample(likert_levels, 150, replace = TRUE, prob = 5:1),
    q3 = sample(likert_levels, 150, replace = TRUE, prob = 1:5),
    q4 = sample(likert_levels, 150, replace = TRUE, prob = 1:5),
    q5 = sample(c(likert_levels, NA), 150, replace = TRUE),
    q6 = sample(likert_levels, 150, replace = TRUE, prob = c(1, 0, 1, 1, 0))
  ) |>
  mutate(across(everything(), ~ factor(.x, levels = likert_levels)))

gglikert(df)

gglikert(df, include = q1:2) + scale_fill_likert(pal = scales::brewer_pal(palette = "PRGn"))

gglikert(df, sort = "ascending")

gglikert(df, sort = "ascending", sort_prop_include_center = TRUE)

gglikert(df, sort = "ascending", sort_method = "mean")
gglikert(df, reverse_likert = TRUE)

gglikert(df, add_totals = FALSE, add_labels = FALSE)
gglikert(df, add_totals = FALSE, add_labels = T)
gglikert(df, add_totals = T, add_labels = F)
head(df)
gglikert( df,  totals_include_center = TRUE, totals_hjust = 0.25,  totals_size = 4,  totals_fontface = "italic",  totals_accuracy = .01, labels_accuracy = 1,   labels_size = 3, labels_hide_below = .25 )

gglikert(df, exclude_fill_values = "Neither agree nor disagree")
gglikert(df, exclude_fill_values = "Neutral")
#labels
library(labelled)
df %>% set_variable_labels(q1 = "Question 1", q2 = "Question 2", q3 = "Question 3", q4 = "Question 4") %>% gglikert(variable_labels = c(q5 ='Ques 5', q6 = 'Ques 6'), add_labels = TRUE, y_label_wrap = 25)

#facets
# Facets
df_group <- df
df_group$group <- sample(c("A", "B"), 150, replace = TRUE)

gglikert(df_group, q1:q6, facet_rows = vars(group))
gglikert(df_group, q1:q6, facet_cols = vars(group))
gglikert(df_group, q1:q6, y = "group", facet_rows = vars(.question))
f <- function(d) {
  d$.question <- forcats::fct_relevel(d$.question, "q5", "q2")
  d
}
gglikert(df, include = q1:q6, data_fun = f)

# Custom center
gglikert(df, cutoff = 2)
gglikert(df, cutoff = 1)
gglikert(df, cutoff = 1, symmetric = TRUE)
gglikert_stacked(df, q1:q6)
gglikert_stacked(df, q1:q6, add_median_line = TRUE, sort = "asc")
gglikert_stacked(df_group, q1:q6, y = "group", add_median_line = TRUE) +  facet_grid(rows = vars(.question))
#BarConnection------

mtcars %>% ggplot(.) + aes(x=factor(cyl),  fill=factor(gear)) + geom_bar(width=.5) + geom_bar_connector(width=.5) 

#cascadePlot-----
diamonds
diamonds %>% ggcascade(all =T, big = carat > .5)

mtcars %>% ggcascade(all =T, big = hp > 100, small = hp < 100, 'small&Gear3' = hp < 100 & gear == 3)

ggplot2::mpg |> ggcascade(all = TRUE, recent = year > 2000, "recent & economic" = year > 2000 & displ < 3, .by = pick(cyl, drv), .add_n = FALSE, .text_size = 2)
