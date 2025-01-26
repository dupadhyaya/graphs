# Moscaic2

# Titanic Data Set

data(Titanic) # Load Data Set
Titanic   # Display Data
str(Titanic)  # Show Structure of Data Set
?mosaicplot
mosaicplot(Titanic,
             main = "Survival on the Titanic",
            # col = hcl(c(240, 120)),
             col = c('green', 'blue'),
             off = c(5,5,5,5))
(x = apply(Titanic, 2:1, sum))
(x = apply(Titanic, c(1,2), sum))  # opposite of above
(x = apply(Titanic, c(2,1), sum))

x
str(x)
mosaicplot(x, main = "Survival on the Titanic",
           col = hcl(c(200, 150, 100,50)),
           off = c(30, 12),
           border=2)




# Another Example
# Mosaic Plot Example
library(vcd)
vcd::mosaic(HairEyeColor, shade=TRUE, legend=TRUE)

# R Mosaic Plot Example
airquality
str(airquality)
table1 <- table(airquality$Temp, airquality$Month)
table1
mosaicplot(table1)

#https://www.tutorialgateway.org/mosaic-plot-in-r/
#http://www.datasciencemadesimple.com/mosaic-plot-in-r/

# mosaic plot in R with mosaicplot function

mosaicplot(UCBAdmissions, sort = 3:1,
           col = hcl(c(120, 10)),
           main = "Student admissions at UC Berkeley")  

## Association Plot Example
library(vcd)
vcd::assoc(HairEyeColor, shade=TRUE)
mosaicplot(HairEyeColor)
HairEyeColor
#association plot use assoc(x, row_vars, col_vars) 
#where x is a contingency table, row_vars is a vector of integers giving the indices of the variables to be used for the rows, and col_vars is a vector of integers giving the indices of the
# variables to be used for the columns of the association plot.
