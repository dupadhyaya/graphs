#venn diagram
#https://rdrr.io/bioc/systemPipeR/f/inst/extdata/vignette_archive/systemPipeR.pdf

source("http://bioconductor.org/biocLite.R") # Sources the biocLite.R installation script
biocLite("systemPipeR") # Installs the package

library(systemPipeR)
setlist5 <- list(A=sample(letters, 18), B=sample(letters, 16), C=sample(letters, 20), D=sample(letters, 22), E=sample(letters, 18))
setlist5
OLlist5 <- overLapper(setlist=setlist5, sep="_", type="vennsets")
OLlist5

vennPlot(OLlist5, mymain="", mysub="", colmode=2, ccol=c("blue", "red"))
http://girke.bioinformatics.ucr.edu/GEN242/pages/mydoc/Rgraphics.html#6_specialty_graphics
