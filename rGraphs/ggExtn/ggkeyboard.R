#ggkeyboard
#https://github.com/sharlagelfand/ggkeyboard
devtools::install_github("sharlagelfand/ggkeyboard", ref = "main")

library(ggkeyboard)

ggkeyboard()

library(scales)

show_col(keyboard_palette("serika"))
ggkeyboard(palette = keyboard_palette("serika"))
