#GGplot2- barchart

# Bar Chart
# number of marts established in particular year, 
# then bar chart would be most suitable option, use variable Establishment Year as shown below.
data=data1
ggplot(data, aes(Outlet_Establishment_Year)) + geom_bar(fill =  "red")+theme_bw()+ scale_x_continuous("Establishment Year", breaks = seq(1985,2010)) + scale_y_continuous("Count", breaks = seq(0,1500,150)) + coord_flip()+ labs(title = "Bar Chart") + theme_gray()

# Stacked Bar Chart-----
#we want to know the count of outlets on basis of 
# categorical variables like its type (Outlet Type) and location (Outlet Location Type) both, stack chart will visualize the scenario in most useful manner
ggplot(data, aes(Outlet_Location_Type, fill = Outlet_Type)) + geom_bar()+ labs(title = "Stacked Bar Chart", x = "Outlet Location Type", y = "Count of Outlets")
