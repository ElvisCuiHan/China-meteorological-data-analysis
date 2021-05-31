setwd("~/Desktop/啥狗毕业设计")

library(tidyverse)
library(lubridate)
library(ggpmisc)

data_full = read_csv("2019.csv")
data = data_full[data_full$date>=20190407 & data_full$date<=20190408, ]
data$time = ymd(data$date)
ca = paste(data$time, as.character(data$hour), ":00:00")
data$hms = ymd_hms(ca)
to_plot <- data[data$city %in% c("南京","常州","滁州","上海","扬州","镇江"), ]
city_eng = ifelse(to_plot$city=="南京", " Nanjing", 
       ifelse(to_plot$city=="常州", "Changzhou", 
              ifelse(to_plot$city=="滁州", "Chuzhou",
                     ifelse(to_plot$city=="上海", "Sanmenxia", 
                            ifelse(to_plot$city=="扬州","Yangzhou", "Zhenjiang")))))
to_plot$city_eng = city_eng

####### scatter plot #######
ggplot(data = to_plot) +
  geom_point(aes(x=PM2.5, y=O3, color=city_eng)) +
  geom_smooth(aes(x=PM2.5, y=O3, color=city_eng), method='lm', se=F) +
  stat_poly_eq(formula = y~x, label.x=150,aes(x=PM2.5, y=O3, label = paste(..eq.label.., ..rr.label..,sep = "~~~"), color=city_eng), parse = TRUE)+ 
  theme_classic() +
  ylab(TeX("O_3")) +
  xlab(TeX("PM_{2.5}")) 

####### line plot ########
ggplot(data = to_plot) +
  geom_point(aes(x=hms, y=O3, color=city_eng)) +
  geom_line(aes(x=hms, y=O3, color=city_eng)) +
  ylab("O3") +
  xlab("Time") + theme_classic()

ggplot(data = to_plot) +
  geom_point(aes(x=hms, y=PM2.5, color=city_eng)) +
  geom_line(aes(x=hms, y=PM2.5, color=city_eng)) +
  ylab("PM2.5") +
  xlab("Time") + theme_classic()

ggplot(data = to_plot[to_plot$city_eng=="Xian",]) +
  #geom_point(aes(x=hms, y=PM2.5, color="PM2.5") ) +
  geom_line(aes(x=hms, y=PM2.5, color="PM2.5"), cex=.3) +
  #geom_point(aes(x=hms, y=O3, color="O3")) +
  geom_line(aes(x=hms, y=O3, color="O3"), cex=.3) +
  ylab("Concentration") +
  xlab("Time")+ theme_classic()

