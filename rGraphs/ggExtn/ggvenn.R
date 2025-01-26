#ggvenn
#https://github.com/yanlinlin82/ggvenn

#install.packages("ggvenn") # install via CRAN
#if (!require(devtools)) install.packages("devtools")
#devtools::install_github("yanlinlin82/ggvenn") # install via GitHub (for latest version)

library(ggvenn)

a <- list(`Set 1` = c(1, 3, 5, 7, 9),
          `Set 2` = c(1, 5, 9, 13),
          `Set 3` = c(1, 2, 8, 9),
          `Set 4` = c(6, 7, 10, 12))
a
ggvenn(a, c("Set 1", "Set 2"))            # draw two-set venn
ggvenn(a, c("Set 1", "Set 2", "Set 3"))   # draw three-set venn
ggvenn(a)   # without set names, the first 4 elements in list will be chose to draw four-set venn


#------
d <- dplyr::tibble(value   = c(1,     2,     3,     5,     6,     7,     8,     9),
                   `Set1` = c(TRUE,  FALSE, TRUE,  TRUE,  FALSE, TRUE,  FALSE, TRUE),
                   `Set2` = c(TRUE,  FALSE, FALSE, TRUE,  FALSE, FALSE, FALSE, TRUE),
                   `Set3` = c(TRUE,  TRUE,  FALSE, FALSE, FALSE, FALSE, TRUE,  TRUE),
                   `Set4` = c(FALSE, FALSE, FALSE, FALSE, TRUE,  TRUE,  FALSE, FALSE))
d
ggvenn(d, c("Set1", "Set2"))           # draw two-set venn
ggvenn(d, c("Set1", "Set2", "Set3"))  # draw three-set venn
ggvenn(d)   # without set names, the first 4 logical column in data.frame will be chose to draw four-set venn

# draw two-set venn (use A, B in aes)
ggplot(d, aes(A = `Set1`, B = `Set2`)) +  geom_venn() + theme_void() + coord_fixed()

# draw three-set venn (use A, B, C in aes)
ggplot(d, aes(A = `Set1`, B = `Set2`, C = `Set3`)) +  geom_venn() + theme_void() + coord_fixed()

# draw four-set venn (use A, B, C, D in aes)
ggplot(d, aes(A = `Set1`, B = `Set2`, C = `Set3`, D = `Set4`)) + geom_venn() + theme_void() + coord_fixed()


a <- list(A = 1:5, B = 4:6)
d <- dplyr::tibble(key = 1:6, A = c(rep(TRUE, 5), FALSE), B = rep(c(FALSE, TRUE), each = 3))

identical(a, data_frame_to_list(d))  # TRUE
identical(d, list_to_data_frame(a))  # TRUE



#another library------
#https://github.com/gaospecial/ggVennDiagram
#install.packages("ggVennDiagram")

library(ggVennDiagram)
genes <- paste("gene",1:1000,sep="")
set.seed(20231214)
x <- list(A=sample(genes,300), B=sample(genes,525),  C=sample(genes,440), D=sample(genes,350))
x

library(ggplot2)
ggVennDiagram(x) + scale_fill_gradient(low="grey90",high = "red")

ggVennDiagram(x, set_color = c("blue","red","green","purple"))

ggVennDiagram(x,category.names = c("Stage 1","Stage 2","Stage 3", "Stage4"))


ggVennDiagram(x,category.names = c("Stage 1","Stage 2","Stage 3", "Stage4"), label = "none")

ggVennDiagram(x, label_alpha=0)

y <- list(
  A = sample(letters, 8),
  B = sample(letters, 8),
  C = sample(letters, 8),
  D = sample(letters, 8)
)

process_region_data(Venn(y))

ggVennDiagram(y, show_intersect = TRUE)


x <- list(A=sample(genes,300),
          B=sample(genes,525),
          C=sample(genes,440),
          D=sample(genes,350),
          E=sample(genes,200),
          F=sample(genes,150),
          G=sample(genes,100))
x
# two dimension Venn plot
ggVennDiagram(x[1:2],label = "none")

# three dimension Venn plot
ggVennDiagram(x[1:3],label = "none")

# four dimension Venn plot
ggVennDiagram(x[1:4],label = "none")

# five dimension Venn plot
ggVennDiagram(x[1:5],label = "none")

# six dimension Venn plot
ggVennDiagram(x[1:6],label = "none")

# seven dimension Venn plot
ggVennDiagram(x,label = "none")


# add an extra member in list
x$H = sample(genes,500)
ggVennDiagram(x)

ggVennDiagram(x[1:4], force_upset = TRUE, order.set.by = "name", order.intersect.by = "none")

venn = Venn(x)
plot_upset(venn, nintersects = 30, relative_height = 2, relative_width = 0.3)
