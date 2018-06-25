# Graphical Parameters

opar = par(no.readonly = TRUE) 
# readonly parameters - No : this is true ; which can be changed
# readonly False can be changed; while readonly cannot be
# so lets copy no.readonly=TRUE
opar

# parameters - fonts, colros, axes, labels
# values affect the whole session
?par
par(..., no.readonly = FALSE)
x = rnorm(100,50,10)
plot(x)
par(lty=2, pch=17)
plot(x)

plot(x, pch=20)
plot(x)

par(opar)  # reset
plot(x) # default
# these can be set in Rprofile, Renviron


# parameters ------------------
par(c('omi','din','fin', 'mai', 'pin'))
#$omi [1] 0 0 0 0  # outer margin
#$din [1] 4.479167 2.968750
#$fin [1] 3.583333 1.335938 
#$mai [1] 0.166 0.166 0.166 0.166  # margin in inches
#$pin [1] 3.251333 1.003937  # plot dimension

# Box Feature ----------
#bty - kind of box - 'o', 1 ,7, c, u, }

#Title ------
#main 
#cex.main 
#col.main
#font.main
#
#Margins -----
#mar
#oma
#omd
#omi

#Symbol Styles ----------
#pch, lwd, pty, col , cex, type

#General ------------
#tck - add a grid on % of the area tck=1 
#tck -0.1  0.1  1
#bg - color of the background par(bg='red')
#font - font of text : normal, bold, italic
#font.main, font.lab, font.sub
#lheight - size between lines of titles : 1 1.5
#ann : labels yes / no : TRUE FALSE
#srt - text rotation in degree : 0 45 90 135

# X axis features ---------
# lab - no of graduations L lab-c(1,2,2,0)
# lab - 10,10   1,10 10,1  2,2
# xaxp : to add c graduation from a to b : xazp = c(a,b,c)
# log - for log scale - log='x'
# xaxt - to remove x axis : axt='n
# fg = col of axis, ticks & grid : fg='red'
# cex.axis - size of tick labels
# col.axis - col of tick labels
# xlim - limits of the axis : xlim=c(0,10)
# las - orientation of tick labels : 0-parallel, 1-horz, 2- perp, 3 - vertical

# X-axis name ------------
# xlab - name of the axis
# cex.lab - size : cex.lab =2
# col.lab : color : col.lab = 'red'
# sub : subtitle