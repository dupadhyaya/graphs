# facet

pacman::p_load(dplyr, ggplot2, patchwork, ggrepl)


MT = mtcars
MT

MT <- MT %>% mutate_at(vars(gear, cyl, carb,am,vs), as.factor)

str(MT)

s1 <- MT %>% group_by(gear)  %>% summarise(n=n())

s2 <- MT %>% group_by(gear,cyl)  %>% summarise(n=n())

s3 <- MT %>% group_by(gear,cyl, carb)  %>% summarise(n=n())

s4 <- MT %>% group_by(gear,cyl, carb, am)  %>% summarise(n=n())

gs1 <- s1 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity')

gs2 <- s2 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~.)

gs2B <- s2 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_wrap(cyl ~.)

(gs2C <- s2 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_wrap(. ~ cyl))

(gs2C1 <- s2 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_wrap(. ~ cyl, labeller='label_value'))
(gs2C2 <- s2 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_wrap(. ~ cyl, labeller='label_both'))
(gs2C3 <- s2 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_wrap(. ~ cyl, labeller='label_parsed'))
(gs2C4 <- s2 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_wrap(. ~ cyl, labeller=labeller( .multi_line = T)))



(gs3A <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb))

(gs3B <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb, as.table=F))



gs3A + gs3B

(gs3C <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb, switch='both'))
(gs3C2 <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb, switch='x'))

(gs3D <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb, drop=T)) #unused level

(gs3E <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb, scales='free', margins=T) + geom_text(aes(label=n))) 
(gs3E1 <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb, scales='free', margins='cyl') + geom_text(aes(label=n))) 
(gs3E1 <- s3 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(cyl ~ carb, scales='free', margins='carb') + geom_text(aes(label=n))) 

(gs4F1 <- s4 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(am + carb ~ cyl, labeller=labeller(carb=label_both, cyl = label_value, .multi_line = T)))

(gs4F2 <- s4 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(am + carb ~ cyl, labeller=labeller(.cols=label_both, .rows = label_value)))


(gs4A <- s4 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(am + cyl ~ carb, as.table=T, margins=T))


(gs4F4 <- s4 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(am + carb ~ cyl, labeller=labeller(.cols=label_both, .rows = label_both)))



#rename facets----
newLabels <- function(value) {
  cyl <- paste('Cylinder ', value)
}

newLabels2 <- c( '4' = "Cylinder 1", '6' = "Cyl 6", '8' = "Car Cyl 8")


(gs4F5 <- s4 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(am + carb ~ cyl, labeller=labeller(.cols=newLabels, .rows = label_both)))

(gs4F6 <- s4 %>% ggplot(., aes(x=gear, y=n, fill=gear)) + geom_bar(stat='identity') + facet_grid(am + carb ~ cyl, labeller=labeller(cyl=newLabels2, .rows = label_both)))


?match

#strip background
gs3A +  theme(strip.background = element_rect(fill = "yellow"))

gs3A + theme(strip.text = element_text(color = "red", size=10))

gs3A + theme(strip.background = element_rect(fill = "yellow"),  strip.text = element_text(color = "red", size=20))

gs3A + theme(strip.background=element_rect(colour="black", fill="yellow"))

gs3A + theme(strip.text.x = element_text(margin=margin(2,0,2,0, 'cm'), size=25), strip.text.y = element_text(margin=margin(2,4,2,4, 'cm'), size=30, angle=0))

gs3A + theme(strip.text.x = element_text(margin=margin()))   #scale strip size
gs3A + theme(strip.text.x = element_text(margin=margin(), size=25))   #scale strip size






head(mpg)

#vline in each facet-----
ggplot(mpg, aes(x = hwy)) +   geom_histogram(binwidth = 5) +  facet_wrap(~ drv)
(mpg_summary <- mpg %>%   group_by(drv) %>%  summarise(hwy_mean = mean(hwy)))
ggplot(mpg, aes(x = hwy)) +   geom_histogram(binwidth = 5) +   facet_wrap(~ drv) +  geom_vline(data = mpg_summary, aes(xintercept = hwy_mean))


#axis limits for each facets------
ggplot(mpg, aes(x = cty, y = hwy)) +  geom_point() +   facet_grid(cyl ~ drv)
ggplot(mpg, aes(x = cty, y = hwy)) +  geom_point() +   facet_grid(cyl ~ drv, scales = "free") 

#maintain limits y=20 to 25 in all y axis
ggplot(mpg, aes(x = cty, y = hwy)) + geom_point() + facet_grid(cyl ~ drv, scales = "free") + expand_limits(x = 10, y = c(20, 25))


#remove facets; in both or either axis
ggplot(mpg, aes(x = cty, y = hwy)) +  geom_point() + facet_grid(cyl ~ drv) +  theme(strip.text = element_blank())
ggplot(mpg, aes(x = cty, y = hwy)) +  geom_point() + facet_grid(cyl ~ drv) + theme(strip.text.x = element_blank())

#wrap facets
df <- data.frame(
  x = rnorm(100),
  group = c(rep("A long group name for the first group", 50),
            rep("A muuuuuuuuuuuuuch longer group name for the second group", 50))
)

ggplot(df, aes(x = x)) +  geom_histogram(binwidth = 0.5) +  facet_wrap(~ group)
ggplot(df, aes(x = x)) +  geom_histogram(binwidth = 0.5) + facet_wrap(~ group, labeller = labeller(group = label_wrap_gen(width = 25)))


#different axis
df <- data.frame(
  year = rep(2016:2021, 2),
  price = c(10, 10, 13, 12, 14, 15, 1000, 1010, 1200, 1050, 1105, 1300),
  country = c(rep("US", 6), rep("Japan", 6))
)

df

ggplot(df, aes(x = year, y = price)) +  geom_smooth() +   facet_wrap(~ country, ncol = 1, scales = "free_y") +  scale_x_continuous(breaks = 2011:2020)

ggplot(df, aes(x = year, y = price)) +
  geom_smooth() +
  facet_wrap(~ country, ncol = 1, scales = "free_y", 
             labeller = as_labeller(
               c(US = "US Dollars (USD)", Japan = "Japanese Yens (JPY)")), 
             strip.position = "left"
  ) +
  scale_x_continuous(breaks = 2011:2020) +
  labs(y = NULL) +
  theme(strip.background = element_blank(), strip.placement = "outside")


#color
library(ggh4x)

# Only colour strips in x-direction
strip <- strip_themed(background_x = elem_list_rect(fill = rainbow(7)), background_y = elem_list_rect(fill = rainbow(7)))

# Wrap variant
ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap2(~ class, strip = strip)

ggplot(mpg, aes(displ, hwy)) +  geom_point() +  facet_grid2(year ~ cyl, strip = strip)



#-----
strip.background = element_rect(fill =' lightblue', size=1, color='darkblue', linetype='dashed')
strip.text = element_text( size=12, face='bold', color='darkblue')
strip.text.x
strip.text.y


panel.spacing = unit(.25, 'cm')
panel.spacing.x = unit(.25, 'cm')
panel.spacing.y = unit(.25, 'cm')
