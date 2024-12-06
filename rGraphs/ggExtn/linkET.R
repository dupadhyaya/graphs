#linkET
#https://github.com/Hy4m/linkET

#devtools::install_github("Hy4m/linkET", force = TRUE)
packageVersion("linkET")

library(linkET)
## matrix_data
matrix_data(list(mtcars = mtcars))

matrix_data(list(mtcars = mtcars)) %>%  as_md_tbl()

as_matrix_data(mtcars)
as_md_tbl(mtcars)

correlate(mtcars) %>%   as_matrix_data()

correlate(mtcars) %>% as_md_tbl()

matrix_data(list(mtcars = mtcars)) %>%  hyplot(aes(fill = mtcars)) +  geom_tile()

as_md_tbl(mtcars) %>% hyplot(aes(size = mtcars)) +  geom_point(shape = 21, fill = NA)


correlate(mtcars) %>%   as_md_tbl() %>%   qcorrplot() +  geom_square()

library(vegan); library(permute); library(lattice)
data("varespec")
data("varechem")
correlate(varespec[1:30], varechem) %>%   qcorrplot() +  geom_square() +  scale_fill_gradientn(colours = RColorBrewer::brewer.pal(11, "RdBu"))

correlate(mtcars) %>%   qcorrplot() +  geom_square() +  scale_fill_gradientn(colours = RColorBrewer::brewer.pal(11, "RdBu"))

qcorrplot(varespec[1:30], type = "lower") +   geom_square() +
  scale_fill_gradientn(colours = RColorBrewer::brewer.pal(11, "RdBu"))

qcorrplot(mtcars, type = "lower") +   geom_square() + scale_fill_gradientn(colours = RColorBrewer::brewer.pal(11, "RdBu"))

set_corrplot_style()
qcorrplot(mtcars) + geom_square()

set_default_style()
