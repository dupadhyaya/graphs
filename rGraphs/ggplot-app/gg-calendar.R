# Calendar using ggplot

#http://www.roymfrancis.com/calendar-plot-with-ggplot2/
  
# prepare date range
dfr <- data.frame(date=seq(as.Date('2018-06-11'),as.Date('2018-08-12'),by=1))
dfr$day <- factor(strftime(dfr$date,format="%a"),levels=rev(c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")))
dfr$week <- factor(strftime(dfr$date,format="%V"))
dfr$month <- factor(strftime(dfr$date,format="%B"),levels=c("June","July","August"))
dfr$ddate <- factor(strftime(dfr$date,format="%d"))


head(dfr)

# add date tracks
dfr$comment <- "Available"
dfr$comment[dfr$date>=as.Date('2018-06-11') & dfr$date<=as.Date('2018-06-20')] <- "Limited"
dfr$comment[dfr$date>=as.Date('2018-06-21') & dfr$date<=as.Date('2018-06-29')] <- "Not available"
dfr$comment[dfr$date>=as.Date('2018-07-09') & dfr$date<=as.Date('2018-07-13')] <- "Not available"
dfr$comment[dfr$date>=as.Date('2018-08-06') & dfr$date<=as.Date('2018-08-10')] <- "Not available"
dfr$comment[dfr$day=="Sat" | dfr$day=="Sun"] <- "Weekend"

dfr$comment <- factor(dfr$comment,levels=c("Available","Limited","Not available","Weekend"))

# plot
p <- ggplot(dfr,aes(x=week,y=day))+
  geom_tile(aes(fill=comment))+
  geom_text(aes(label=ddate))+
  scale_fill_manual(values=c("#8dd3c7","#ffffb3","#fb8072","#d3d3d3"))+
  facet_grid(~month,scales="free",space="free")+
  labs(x="Week",y="")+
  theme_bw(base_size=10)+
  theme(legend.title=element_blank(),
        panel.grid=element_blank(),
        panel.border=element_blank(),
        axis.ticks=element_blank(),
        strip.background=element_blank(),
        legend.position="top",
        legend.justification="right",
        legend.direction="horizontal",
        legend.key.size=unit(0.3,"cm"),
        legend.spacing.x=unit(0.2,"cm"))
p

ggsave("calendar.png",p,height=10,width=14,units="cm",dpi=300,type="cairo")
