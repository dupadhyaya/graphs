# gcookbook
data <- read.csv("http://www.cookbook-r.com/Data_input_and_output/Loading_data_from_a_file/datafile.csv")
data
# Read in a CSV file without headers
data <- read.csv("http://www.cookbook-r.com/Data_input_and_output/Loading_data_from_a_file/datafile-noheader.csv", header=FALSE)
data
data = read.csv('gcookbook/datafile.csv')
data
data = read.csv('gcookbook/datafile.csv', stringsAsFactors = F)
data
str(data)

# Chapter-2 ----------
# scatter plot
plot(mtcars$wt, mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt, mtcars$mpg)

qplot(wt, mpg, data=mtcars)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()

#Line Graph
plot(pressure$temperature, pressure$pressure, type='l')
plot(pressure$temperature, pressure$pressure, type='l')
points(pressure$temperature, pressure$pressure)
lines(pressure$temperature, pressure$pressure/2, col='red')
points(pressure$temperature, pressure$pressure/2, col='red')


plot(pressure$temperature, pressure$pressure, type='b')
lines(pressure$temperature, pressure$pressure)

qplot(pressure$temperature, pressure$pressure, geom='line')
qplot(temperature, pressure, data=pressure, geom='line')
#Eg to
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line()
