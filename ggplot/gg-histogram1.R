# GG Plot2 - Histogram
# Histogram

data= data1
ggplot(data, aes(Item_MRP)) + geom_histogram(binwidth = 2)+
  scale_x_continuous("Item MRP", breaks = seq(0,270,by = 30))+  scale_y_continuous("Count", breaks = seq(0,200,by = 20))+ labs(title =  "Histogram")


#Eg4 RiA : Singer
data(singer, package='lattice')
#histogram
ggplot(singer, aes(x =height)) + geom_histogram()
#boxplot
ggplot(singer, aes(x=voice.part, y=height)) + geom_boxplot()