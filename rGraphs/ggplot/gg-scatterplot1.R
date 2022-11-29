# GG Plot2
# Data Visualization
library(ggplot2) 

# Scatter Plot # 2 variables
data = data1
ggplot(data, aes(Item_Visibility, Item_MRP)) + geom_point() +
  scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+  scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ theme_bw()

# 3 variables

ggplot(data, aes(Item_Visibility, Item_MRP)) + geom_point(aes(color =  Item_Type)) + scale_x_continuous("Item Visibility",   breaks =seq(0,0.35,0.05))+ scale_y_continuous("Item MRP", 
 breaks = seq(0,270,by =30))+ theme_bw() + labs(title="Scatterplot") + facet_wrap( ~ Item_Type)
