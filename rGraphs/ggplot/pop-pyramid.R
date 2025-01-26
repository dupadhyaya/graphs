# GG Plot2 - Population Pyramid
#
library(ggplot2)
library(ggthemes)
options(scipen = 999)  # turns of scientific notations like 1e+40
#Population pyramids offer a unique way of visualizing how much population or what percentage of population fall under a certain category. The below pyramid is an excellent example of how many users are retained at each stage of a email marketing campaign funnel.

# Read data
email_campaign_funnel <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/email_campaign_funnel.csv")
dim(email_campaign_funnel)
email_campaign_funnel
# X Axis Breaks and Labels 
brks <- seq(-15000000, 15000000, 5000000)
lbls = paste0(as.character(c(seq(15, 0, -5), seq(5, 15, 5))), "m")

# Plot
ggplot(email_campaign_funnel, aes(x = Stage, y = Users, fill = Gender)) +   # Fill column
  geom_bar(stat = "identity", width = .6) +   # draw the bars
  scale_y_continuous(breaks = brks,  labels = lbls) + ## Breaks Labels
  coord_flip() +  labs(title="Email Campaign Funnel") +
  theme_tufte() +  # Tufte theme from ggfortify
  theme(plot.title = element_text(hjust = .5),axis.ticks = element_blank()) +  # Centre plot title
  scale_fill_brewer(palette = "Dark2")  # Color palette

head(mtcars)

head(email_campaign_funnel)
table(mtcars$carb)
(brks <- seq(0, 8, 1))
(lbls = paste0(as.character(seq(0,8,1)), "-carb"))
sapply(list(brks, lbls), length)
cbind(brks, lbls)
s1 <- mtcars %>% group_by(carb, am) %>% summarise(meanMPG = mean(mpg, na.rm=t))
s1
ggplot(s1, aes(x = factor(carb), y = meanMPG, fill = am)) +   geom_bar(stat = "identity", width = .6) +  coord_flip() + theme_tufte()  
``