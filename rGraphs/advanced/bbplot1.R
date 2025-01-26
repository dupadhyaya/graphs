#https://bbc.github.io/rcookbook/
#https://github.com/bbc/bbplot

if(!require(pacman))install.packages("pacman")

# install.packages('devtools')
BiocManager::install("systemPipeR", version = "3.8")
devtools::install_github("bbc/bbplot")
#https://github.com/bbc/bbplot

pacman::p_load('dplyr', 'tidyr', 'gapminder', 'ggplot2',  'ggalt','forcats', 'R.utils', 'png', 'grid', 'ggpubr', 'scales', 'bbplot')

#Prepare data
line_df <- gapminder %>%
  filter(country == "China") 

line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
  geom_line(colour = "#007f7f", size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") 
#+ bbc_style()
line


#Make plot
line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
  geom_line(colour = "#1380A1", size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  bbc_style() +
  labs(title="Living longer",
       subtitle = "Life expectancy in China 1952-2007")


#Prepare data
line_df <- gapminder %>%
  filter(country == "China") 

#Make plot
line <- ggplot(line_df, aes(x = year, y = lifeExp)) +
  geom_line(colour = "#1380A1", size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  bbc_style() +
  labs(title="Living longer",
       subtitle = "Life expectancy in China 1952-2007")
line

#Prepare data
multiple_line_df <- gapminder %>%
  filter(country == "China" | country == "United States") 

#Make plot
multiple_line <- ggplot(multiple_line_df, aes(x = year, y = lifeExp, colour = country)) +  geom_line(size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  scale_colour_manual(values = c("#FAAB18", "#1380A1")) +
  bbc_style() +
  labs(title="Living longer",
       subtitle = "Life expectancy in China and the US")
multiple_line

#Prepare data
bar_df <- gapminder %>%
  filter(year == 2007 & continent == "Africa") %>%
  arrange(desc(lifeExp)) %>%
  head(5)

#Make plot
bars <- ggplot(bar_df, aes(x = country, y = lifeExp)) +
  geom_bar(stat="identity", 
           position="identity", 
           fill="#1380A1") +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  bbc_style() +
  labs(title="Reunion is highest",
       subtitle = "Highest African life expectancy, 2007")
bars
