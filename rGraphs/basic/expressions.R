# Expressions
str(mtcars)
# mpg is miles per gallon
plot(mtcars$wt,mtcars$mpg,xlab='', ylab='')
title(ylab=expression('mile gallon'^-1))
text(2,15,expression('Count'['per net']))
text(3,20,expression('Superscript \n and \n Subscript'))
text(5,25,expression(Count [per ~ net]))
title(xlab=expression(italic('gears')))
text(5,30,expression(bolditalic('gear123')))
# types - plain, italic, bold, bolditalic

