#ggpackets
#https://dgkf.github.io/ggpackets/
devtools::install_github('dgkf/ggpackets', build_vignettes = TRUE)
library(ggpackets)



ggpk_box_and_scatter <- ggpacket() +   geom_point(position = position_jitter(width = 0.4), alpha = 0.02) +  geom_boxplot(outlier.shape = NA, fill = NA, color = 'black') +    geom_text(stat = 'summary', vjust = -1, fun.data = function(d) c(    y = quantile(d, 0.75, names = F) + 1.5 * IQR(d),   label = length(d)   )) +   theme_linedraw() +   scale_color_distiller(palette = "Set1")

ggplot(diamonds, aes(x = cut, y = price, color = carat)) +  ggpk_box_and_scatter() +  ggtitle('Diamond price distribution by cut')


#------
ggpk_labelled_heatmap <- function(...) {
  ggpacket(...) %+%
    geom_tile(.id = 'tile', color = NA, ...) %+% 
    geom_text(.id = c("text", "text1"), color = "black", vjust = -0.3,  fontface = "bold", ...) %+%
    geom_text(.id = c("text", "text2"), aes(label = sprintf("(%.1f)", ..fill..)), color = "black", vjust = 1.1, ...) %+% theme_void()
} 

head(OrchardSprays)
ggplot(as.data.frame(OrchardSprays)) +  aes(x = rowpos, y = colpos, label = treatment, fill = decrease) +    ggpk_labelled_heatmap(text.color = "red", text2.alpha = 0.5) + ggtitle('Honeybee population decline in repellent trial grid')
