# rotate DF
pacman::p_load(tidyr, dplyr, tibble)

rMT <- mtcars %>%
  tibble::rownames_to_column() %>%  
  pivot_longer(-rowname) %>% 
  pivot_wider(names_from=rowname, values_from=value) 

names(rMT)


library(sjmisc)
mtcars %>% rotate_df()



library(here)
?here
here('some')
here('below')
here()
here::i_am('gg-.R')


MT = mtcars
MT

MT <- MT %>% mutate_at(vars(gear, cyl, carb,am,vs), as.factor)

str(MT)

s5 <- MT %>% group_by(gear, cyl, carb, am, vs)  %>% summarise(n=n())
s5

relig_income
head(relig_income)
names(relig_income)
relig_income %>% pivot_longer(!religion, names_to = 'income', values_to = 'count')

billboard
names(billboard)
head(billboard)
billboard %>% pivot_longer(cols = starts_with('wk'), names_to = 'week', names_prefix = 'wk', values_to = 'rank', values_drop_na = T)

#pivot_longer------
#https://tidyr.tidyverse.org/reference/pivot_longer.html

#who-----
who
names(who)
head(who)
who %>% pivot_longer(cols = new_sp_m014:newrel_f65, names_to = c('diagnosis', 'gender','age'), names_pattern = 'new_?(.*)_(.)(.*)', values_to = 'count')

whoL2 <- who %>% pivot_longer(cols = new_sp_m014:newrel_f65, names_to = c('category') ,  values_to = 'count')
whoL2 %>% filter(!is.na(count))


#anscombe----
head(anscombe)
names(anscombe)
anscombe  %>% pivot_longer(everything(), cols_vary = 'slowest', names_to = c('.value', 'set'), names_pattern = '(.)(.)')


#pivot_wider -----
pivot_wider(  data,  ...,   id_cols = NULL,  id_expand = FALSE,   names_from = name,
  names_prefix = "",  names_sep = "_",   names_glue = NULL,   names_sort = FALSE,
  names_vary = "fastest",   names_expand = FALSE,   names_repair = "check_unique",
  values_from = value,   values_fill = NULL,   values_fn = NULL,   unused_fn = NULL)

#fish_encounters---
head(fish_encounters)
names(fish_encounters)

fish_encounters  %>% pivot_wider(names_from = station, values_from = seen)
fish_encounters  %>% pivot_wider(names_from = station, values_from = seen, values_fill = 0)

#us_rent_income
head(us_rent_income)
names(us_rent_income)

us_rent_income %>% pivot_wider(names_from = variable, values_from = c(estimate, moe))

us_rent_income %>%  pivot_wider(names_from = variable,  values_from = c(estimate, moe), names_vary = "slowest"  )

us_rent_income %>%  pivot_wider(names_from = variable,  names_sep = ".",  values_from = c(estimate, moe))

us_rent_income
us_rent_income %>%  pivot_wider(names_from = variable, names_glue = "{variable}_{.value}", values_from = c(estimate, moe) )

#value_fn
warpbreaks <- as_tibble(warpbreaks[c("wool", "tension", "breaks")])
warpbreaks

warpbreaks %>%  pivot_wider(  names_from = wool,  values_from = breaks,  values_fn = mean  )
warpbreaks %>%  pivot_wider(  names_from = wool,  values_from = breaks,  values_fn = ~ max(.x, na.rm=T))
warpbreaks$breaks[1] <- NA
warpbreaks %>%  pivot_wider(names_from = wool, values_from = breaks,   values_fn = ~ mean(.x, na.rm = TRUE)  )
