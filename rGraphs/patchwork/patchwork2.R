#patch work - Advanced

#https://ggplot2-book.org/arranging-plots

pacman::p_load(tidyverse, patchwork)


p1 <- ggplot(mpg) + geom_point(aes(x = displ, y = hwy))

p2 <- ggplot(mpg) + geom_bar(aes(x = as.character(year), fill = drv), position = "dodge") +  labs(x = "year")

p3 <- ggplot(mpg) +  geom_density(aes(x = hwy, fill = drv), colour = NA) +  facet_grid(rows = vars(drv))

p4 <- ggplot(mpg) +  stat_summary(aes(x = drv, y = hwy, fill = drv), geom = "col", fun.data = mean_se) + stat_summary(aes(x = drv, y = hwy), geom = "errorbar", fun.data = mean_se, width = 0.5)
p1
p2
p3
p4


p1+p2
p1 + p2 + p3 + p4
p1 + p2 + p3 + p4 + plot_layout(ncol = 2, byrow = TRUE)

p1 / p2

p1 + p2
p1 | p2

p3 | ( p2 / (p1 | p4))

layout <- "
AAB
C#B
CDD
"

p1 + p2 + p3 + p4 + plot_layout(design = layout)

p1 + p2 + p3 + plot_layout(ncol = 2, guides = "collect")

#optimisearea-----
p1 + p2 + p3 + guide_area() + plot_layout(ncol = 2, guides = "collect")

#modifysubplots-----
p12 <- p1 + p2
p12[[2]] <- p12[[2]] + theme_light()
p12

#modifytheme for all------
p1 + p4 & theme_minimal()

p1 + p4 & scale_y_continuous(limits = c(0, 45)) #same y axis


#plotannotate------
p34 <- p3 + p4 + plot_annotation(   title = "A closer look at the effect of drive train in cars", caption = "Source: mpg dataset in ggplot2" )
p34

p34 + plot_annotation(theme = theme_gray(base_family = "mono"))

p34 & theme_gray(base_family = "mono")

p123 <- p1 | (p2 / p3)
p123 + plot_annotation(tag_levels = "I") # Uppercase roman numerics

#taglevels-----
p123[[2]] <- p123[[2]] + plot_layout(tag_level = "new")
p123 + plot_annotation(tag_levels = c("I", "a"))

#arrange-----
p1 + inset_element(p2, left = 0.5, bottom = 0.4, right = 0.9, top = 0.95)

#proportion----
p1 +  inset_element(  p2, left = 0.4, bottom = 0.4, right = unit(1, "npc") - unit(15, "mm"),  top = unit(1, "npc") - unit(15, "mm"), align_to = "full" )

p24 <- p2 / p4 + plot_layout(guides = "collect")
p1 + inset_element(p24, left = 0.5, bottom = 0.05, right = 0.95, top = 0.9)

p12 <- p1 + inset_element(p2, left = 0.5, bottom = 0.5, right = 0.9, top = 0.95)
p12
p12 & theme_bw()

p12 + plot_annotation(tag_levels = "A")


#align-----
p3_dims <- get_dim(p3)
p1_aligned <- set_dim(p1, p3_dims)
plot(p1_aligned)
plot(p3)
p1_aligned + theme_minimal()

set_dim(p4, p3_dims)

max_dims <- get_max_dim(p1, p2, p3, p4)
set_dim(p4, max_dims)

set_dim(p2, max_dims)

plots_aligned <- align_patches(p1, p2, p3, p4)
for (p in plots_aligned) {  plot(p)}


#-----
patch <- p1 + p2
p3 + patch


#addtables------
p1 + gt::gt(mtcars[1:10, c('mpg', 'disp')])

p1 + wrap_table(mtcars[1:10, c('mpg', 'disp')], panel = "full", space = "fixed")

p1 + grid::textGrob('Some really important text')

p1 + ~plot(mtcars$mpg, mtcars$disp, main = 'Plot 2')

old_par <- par(mar = c(0, 2, 0, 0), bg = NA)
p1 + wrap_elements(panel = ~plot(mtcars$mpg, mtcars$disp), clip = FALSE)
par(old_par)

old_par <- par(mar = c(0, 0, 0, 0), mgp = c(1, 0.25, 0), bg = NA, cex.axis = 0.75, las = 1, tcl = -0.25)
p1 +   wrap_elements(panel = ~plot(mtcars$mpg, mtcars$disp), clip = FALSE) + ggtitle('Plot 2') + theme(plot.margin = margin(5.5, 5.5, 5.5, 35))
par(old_par)


# This will work
wrap_elements(grid::textGrob('Text on left side')) + p1

wrap_plots(p1, p2, p3, p4)

patch - p3

names(mpg)
p1 + p2 + geom_jitter(aes(year, displ))

(p1 + plot_spacer() + p2) / (plot_spacer() + p3 + plot_spacer())

p1 + p2 + p3 + p4 +  plot_layout(ncol = 3)

p1 + p2 + p3 + p4 +  plot_layout(widths = c(2, 1))

p1 + p2 + p3 + p4 + plot_layout(widths = c(2, 1), heights = unit(c(5, 1), c('cm', 'null')))

#free-----
layout <- c(  area(t = 2, l = 1, b = 5, r = 4), area(t = 1, l = 3, b = 3, r = 5))
p1 + p2 +  plot_layout(design = layout)

layout <- '
A#B
#C#
D#E
'
wrap_plots(D = p1, C = p2, B = p3, design = layout)

p_fixed <- ggplot(mtcars) +   geom_point(aes(hp, disp)) + ggtitle('Plot F') +  coord_fixed()
p_fixed + p1 + p2 + p3

p_fixed + p1 + p2 + p3 + plot_layout(widths = 1)

p2mod <- p2 + labs(x = "This is such a long\nand important label that\nit has to span many lines")
p1 | p2mod

free(p1) | p2mod

design <- "#AAAA#
           #AAAA#
           BBCCDD
           EEFFGG"
p3 + p2 + p1 + p4 + p4 + p1 + p2 +   plot_layout(design = design)
free(p3) + p2 + p1 + p4 + p4 + p1 + p2 +  plot_layout(design = design)

p3_very_precise <- p3 +  scale_y_continuous(labels = \(x) format(as.numeric(x), nsmall = 10))

p1 / free(p3_very_precise, side = "l")

free(p1, type = "label") /  p3_very_precise

plot_spacer() + p3_very_precise + p1 + p2

plot_spacer() + free(p3_very_precise, type = "space", side = "l") + p1 + p2

#inset-----
p1 + inset_element(p2, left = 0.6, bottom = 0.6, right = 1, top = 1)

p1 + inset_element(p2, left = 0, bottom = 0.6, right = 0.4, top = 1, align_to = 'full')

p1 + inset_element(   p2,   left = 0.5,   bottom = 0.5,   right = unit(1, 'npc') - unit(1, 'cm'), top = unit(1, 'npc') - unit(1, 'cm') )

p3 + inset_element(p1, left = 0.5, bottom = 0, right = 1, top = 0.5, on_top = FALSE, align_to = 'full')

((p2 / p3 + plot_layout(guides = 'auto')) | p1) + plot_layout(guides = 'collect')
((p2 / p3 + plot_layout(guides = 'keep')) | p1) + plot_layout(guides = 'collect')

p1a <- ggplot(mtcars) + geom_point(aes(mpg, disp, colour = mpg, size = wt)) + ggtitle('Plot 1a')

p1a | (p2 / p3)

(p1a | (p2 / p3)) + plot_layout(guides = 'collect')
