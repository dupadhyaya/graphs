# Data Import for Plots

#Case-1 : bigmart

fullurl="https://docs.google.com/spreadsheets/d/13tWJP6fcWNE7FObz4Cn_-_R0us7qIFialUy1m9nwBYY/edit#gid=356784553"
library(gsheet)
data1 = as.data.frame(gsheet2tbl(fullurl))
names(data1)
str(data1)
dim(data1)
