setwd("~/Desktop/啥狗毕业设计")
rm(list=ls())

library(tidyverse)
library(lubridate)
library(scales)

data = read_csv("数据预处理/monthly_average.csv")

hi = data %>% gather(colnames(data)[3:7], key = "city", value = "measurement")
hi %>% group_by(type, city) %>%
  filter(., city=="西安") %>%
  ggplot() +
  geom_line(aes(x=Month, y=measurement, color=type)) +
  geom_point(aes(x=Month, y=measurement, color=type)) +
  scale_x_continuous(breaks = 1:12, 
                    labels = c('Jan', 'Feb', 'Mar', 'Apr', 
                               'May', 'June', 'July', 'Aug', 
                               'Sept', 'Oct', 'Nov', 'Dec')) +
  ylab("Concentration") 
  #ggtitle(" O3 and PM2.5 concentration in Xi'an")

write.csv(hi, file="to_test.csv")  
