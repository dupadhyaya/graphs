# ggplot2 - Heat Chart

# Heat Map

#Heat Map uses intensity (density) of colors to display relationship between two or three or many variables in a two dimensional image It allows you to explore two dimensions as the axis and the third dimension  by intensity of color from our dataset, if we want to know cost of each item 
# on every outlet, we can plot heatmap as shown below using three variables Item MRP, Outlet Identifier & Item Type from our mart dataset


ggplot(data, aes(Outlet_Identifier, Item_Type))+ geom_raster(aes(fill = Item_MRP))+ labs(title ="Heat Map", x = "Outlet_Identifier", y = "Item Type")+  scale_fill_continuous(name = "Item MRP")
