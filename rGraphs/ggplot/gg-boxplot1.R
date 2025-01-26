# GGplot2 - Box Plot

#Boxplot
#Box Plots are used to plot a combination of categorical and continuous variables  This plot is useful for visualizing the spread of the data and detect outliers It shows five statistically significant numbers- the minimum, the 25th percentile, the median, the 75th percentile and the maximum along with outliers

# Box Plot
data = data1
ggplot(data, aes(Item_Type, Item_MRP)) + geom_boxplot(fill =
"red")+ scale_y_continuous("Item Outlet Sales", breaks= seq(0,15000, by=500))+ labs(title = "Box Plot", x = "Item_Type")
