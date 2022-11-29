#WordCloud
#https://www.r-graph-gallery.com/196-the-wordcloud2-library/

# library
library(wordcloud2) 

# have a look to the example dataset
head(demoFreq)

wordcloud2(demoFreq, size=1.6)

# Gives a proposed palette
wordcloud2(demoFreq, size=1.6, color='random-dark')

# or a vector of colors. vector must be same length than input data
wordcloud2(demoFreq, size=1.6, color=rep_len( c("green","blue"), nrow(demoFreq) ) )

# Change the background color
wordcloud2(demoFreq, size=1.6, color='random-light', backgroundColor="black")

# Change the shape:
wordcloud2(demoFreq, size = 0.7, shape = 'star')

# Change the shape using your image
wordcloud2(demoFreq, figPath = "star.png", size = 1.5, color = "skyblue", backgroundColor="black")

ww=wordcloud2(demoFreq, size = 2.3, minRotation = -pi/6, maxRotation = -pi/6, rotateRatio = 1)

#data demoFreqC
wordcloud2(demoFreqC, size = 2, fontFamily = "微软雅黑", color = "random-light", backgroundColor = "grey")

#lettercloud not working
letterCloud( demoFreq, word = "R", color='random-light' , backgroundColor="black")
letterCloud( demoFreq, word = "PEACE", color="white", backgroundColor="pink")

#install webshot
library(webshot)
webshot::install_phantomjs()
# Make the graph
my_graph=wordcloud2(demoFreq, size=1.5)
# save it in html
library("htmlwidgets")
saveWidget(my_graph,"tmp.html",selfcontained = F)
# and in png
webshot("tmp.html","fig_1.pdf", delay =5, vwidth = 480, vheight=480)