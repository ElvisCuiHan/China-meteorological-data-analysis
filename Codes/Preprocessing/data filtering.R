setwd("~/Desktop/啥狗毕业设计")
rm(list=ls())

library(tidyverse)

data_O3 = read_csv("数据预处理/2019-O3.csv")
data_PM = read_csv("数据预处理/2019-PM2.5.csv")

tidy_O3 <- data_O3 %>% 
  gather(colnames(data_O3)[4:370], key = "city", value = "O3") %>%
  select(., -type)

tidy_PM <- data_PM %>% 
  gather(colnames(data_PM)[4:370], key = "city", value = "PM2.5") %>%
  select(., -type)

rm(data_O3, data_PM)

to_csv <-left_join(tidy_O3, tidy_PM)
write_csv(to_csv, "2019.csv")
