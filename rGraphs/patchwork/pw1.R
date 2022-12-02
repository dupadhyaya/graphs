# patchwork 
#https://gotellilab.github.io/GotelliLabMeetingHacks/NickGotelli/ggplotPatchwork.html
#install 
# install.packages("devtools")
devtools::install_github("thomasp85/patchwork")

library(ggplot2)
library(patchwork)

p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))

p1 + p2


# g2
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))

(p1 | p2 | p3) /  p4



theme_border <- theme_gray() +   theme(plot.background = element_rect(fill = NA, colour = 'black', linewidth  = 3)) 
ggplot() +    ggplot() +    plot_annotation(theme = theme_border)

(p1 | p2 | p3) /  p4  +    plot_annotation(theme = theme_border)


(p1 | p2 | p3) /  p4  &  plot_annotation(theme = theme(plot.background = element_rect(color  = 'blue', linewidth = 2, linetype = 'dotted', fill ="ivory")))


p1 + p2 + (p3 + p4 + plot_layout(heights=c(.5, .5))) + plot_layout(widths = c(.4,.4, .2)) +  theme(plot.margin = unit(c(.2,.2,.2,.2), "cm")) & theme(plot.background = element_rect(color  = 'black', linewidth = 1,linetype = 'dotted', fill ="ivory"))


#vertical
p1 + p2 + p3 + plot_layout(ncol=1)

#relative to each other
p1 + p2 + plot_layout(ncol=1,heights=c(2,1))
p1 + p2 + plot_layout(ncol=2,widths=c(2,1))


#Add A Spacer Plot
p1 + plot_spacer() + p2


#Use Nested Layouts
p1 + {
  p2 + {
    p3 +
      p4 +
      plot_layout(ncol=1)
  }
} + plot_layout(ncol=1)


# -Operator For Subtrack Placement
p1 + p2 - p3 + plot_layout(ncol=1)

#\ and | Operators For Intuitive Layouts
(p1 | p2 | p3)/p4

(p1 | p2)/(p3 | p4)

(p1 / p2 /p3) | p4


p1 + grid::textGrob('Some really important text')

#assembly
#https://patchwork.data-imaginist.com/articles/guides/assembly.html
p1 + gridExtra::tableGrob(mtcars[1:10, c('mpg', 'disp')])

p1 + ~plot(mtcars$mpg, mtcars$disp, main = 'Plot 2')


old_par <- par(mar = c(0, 0, 0, 0), mgp = c(1, 0.25, 0),  bg = NA, cex.axis = 0.75, las = 1, tcl = -0.25)
p1 +   wrap_elements(panel = ~plot(mtcars$mpg, mtcars$disp), clip = FALSE) +  ggtitle('Plot 2') +    theme(plot.margin = margin(5.5, 5.5, 5.5, 35))
par(old_par)

# This won't do anything
grid::textGrob('Text on left side') + p1
#> NULL
# This will work
wrap_elements(grid::textGrob('Text on left side')) + p1


wrap_plots(p1, p2, p3, p4)


patch <- p1 + p2
p3 + patch

patch + p3

patch - p3

wrap_plots(patch, p3)


p1 + p2 + geom_jitter(aes(gear, disp))


patchwork <- p1 + p2
patchwork[[1]] <- patchwork[[1]] + theme_minimal()
patchwork

patchwork <- p3 / (p1 | p2)
patchwork & theme_minimal()


patchwork * theme_minimal()
