#Time Series Plots in R

library(ggplot2)
AirPassengers

plot(AirPassengers)

monthplot(AirPassengers)
str(AirPassengers)

forms1 = data.frame(Date=as.Date('2019-06-01')+ sample(1:10,size=10), forms = seq(10,100,10))
forms1
ggplot(forms1, aes(x=Date, y=forms)) + geom_line()
+  scale_x_date(format = "%b-%Y") + xlab("") + ylab("Forms")

#multiple students
admissions = data.frame(formNo = paste('Form', 101:200,sep='-'), formDate = as.Date('2019-05-01') + sample(1:45, size=100, replace=T) )
admissions
admissions$feeDate = admissions$formDate + sample(1:20)
admissions

ggplot(forms1, aes(x=Date, y=forms)) + geom_line()
+  scale_x_date(format = "%b-%Y") + xlab("") + ylab("Forms")
