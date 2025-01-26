# ggplot2 - Area Chart

# Area Chart
#Area chart is used to show continuity across a variable or data set It is very much same as line chart and is commonly used for time series plots
# Alternatively, it is also used to plot continuous variables and analyze the underlying trends.
#From our dataset, when we want to analyze the trend of item 
# outlet sales, area chart can be plotted as shown below 
# It shows count of outlets on basis of sales

data=data1
ggplot(data, aes(Item_MRP)) + geom_area(stat = "bin", bins = 30, fill = "steelblue") + scale_x_continuous(breaks = seq(0,11000,1000))+ labs(title = "Area Chart", x = "Item_MRP", y = "Count")

