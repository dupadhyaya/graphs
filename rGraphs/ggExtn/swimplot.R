#swimplot
#https://cran.r-project.org/web/packages/swimplot/swimplot.pdf
#https://cran.r-project.org/web/packages/swimplot/vignettes/Introduction.to.swimplot.html#introduction-to-swimmers-plots

library(swimplot)

head(ClinicalTrial.Arm)
knitr::kable(head(ClinicalTrial.Arm,10))

knitr::kable(head(ClinicalTrial.AE,10))

knitr::kable(head(ClinicalTrial.Response,10))
head(ClinicalTrial.Arm)
swimmer_plot(df=ClinicalTrial.Arm,id='id',end='End_trt',fill='lightblue',width=.85)

arm_plot <- swimmer_plot(df=ClinicalTrial.Arm,id='id',end='End_trt',name_fill='Arm',   id_order='Arm',col="black",alpha=0.75,width=.8)

arm_plot


swim_plot_stratify <-swimmer_plot(df=ClinicalTrial.Arm,id='id',end='End_trt',name_fill='Arm',   col="black",alpha=0.75,width=.8,base_size = 14,stratify= c('Age','Sex'))

swim_plot_stratify

AE_plot <- arm_plot + swimmer_points(df_points= ClinicalTrial.AE,id='id', time='time', name_shape ='event',size=2.5,fill='white',col='black')
AE_plot

Response_plot <- arm_plot + swimmer_lines(df_lines=ClinicalTrial.Response,id='id',start =  'Response_start',end='Response_end',name_col='Response',size=1)

Response_plot

Response_plot_with_points <- Response_plot+
  swimmer_points_from_lines(df_lines=ClinicalTrial.Response,id='id',start =
                              'Response_start',end = 'Response_end', cont =
                              'Continued_response',name_col='Response',size=2)

Response_plot_with_points
