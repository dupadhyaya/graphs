#Bar plot
#https://ggplot2.tidyverse.org/reference/


(campus = c('AUC-R', 'AUUP-L','AUH-M','AUM-M'))
(str = c(100, 140, 130, 150))
(present = c(80, 100, 110, 125))
(attendance = data.frame(campus, str, present))
attendance$percentage = attendance$present/attendance$str
attendance

library(ggplot2)
ggplot(data=attendance, aes( x = campus, y = percentage, fill = campus ) ) +  geom_bar( stat = "identity", position = "stack" ) +
  coord_flip() +  scale_fill_brewer( palette = "YlGnBu" ) +
  theme_minimal() + theme( legend.position = "bottom" )


course


#-----
(cc_grid = expand.grid(c('AUC-R', 'AUUP-L','AUH-M','AUM-M'), c('BTech','MTech','BCA', 'MBA')))
(cc_grid$str = ceiling(runif(16, 50, 100)))
head(cc_grid)
names(cc_grid)[1:2] = c('campus','course')

g1 = ggplot(data=cc_grid, aes(x=course, y=str, group=campus)) 
g2 = geom_bar(stat='sum')
g1+ g2

h1 = ggplot(data=cc_grid, aes(x=course, y=str, fill=course)) 
h2 = geom_bar(stat ='identity')
h3 = facet_wrap( ~ campus )
h1 + h2 + h3
h4 = geom_text( aes( label = str,  vjust = 1, size = .5, color = 'white'))
h5 = h1 + h2 + h3 + h4
cc_grid %>% arrange(campus, course)
h5 + theme_bw() + theme( axis.text.x = element_text( angle = 90,  hjust = 1 ) )               

library(ggthemes)
#The theme will drop all the borders, grids, and axis lines to maximize the data / ink ratio.
h5 + theme_tufte()


#Stacked Bar Plot
ggplot(data=cc_grid, aes( x = course, y = str, fill = campus ) ) +  geom_bar( stat = "identity", position = "stack" ) +
  coord_flip() +  scale_fill_brewer( palette = "YlGnBu" ) +
  theme_minimal() + theme( legend.position = "bottom" )


cc_grid
x_label = cc_grid$campus

n1= ggplot(data=cc_grid, aes(x= campus, y=str,fill=campus)) + geom_bar(stat='identity', width=0.75, size=0.05) + facet_wrap(.~ course, labeller = as_labeller(x_label)) + scale_y_continuous(limits=c(0,max(str)*1.2)) + scale_x_discrete(expand=c(0,1), labels=x_label) + scale_fill_manual(values=c("red","green","blue","yellow")) + labs(x ="C6 Campus",y="Strength", title = "Distribution of Strength of Students - C6 Campuses" ) 
n2 = geom_text(aes(label=str,vjust=1.2,size=.2,color='white'))
n1+n2
n3 = theme( 
  strip.text=element_text(size=8,color="white",hjust=0.5 ), 
  strip.background = element_rect(fill="violet",color = "green" ), 
  panel.background = element_rect(fill="#efefef",color = NA ),
  panel.grid.major.x = element_blank(),
  panel.grid.minor.x = element_blank(),
  panel.grid.minor.y = element_blank(),
  panel.grid.major.y = element_line(color = "cyan" ),
  panel.spacing.x = unit(1,"cm" ),
  panel.spacing.y = unit(1,"cm" ),
  legend.position = "none") 
n1 + n2 + n3

#Tiles
ggplot(data=cc_grid, aes(x=campus, y=course, fill = str)) + geom_tile(show.legend = FALSE) +  geom_text(aes(label = str, color = "black"))
