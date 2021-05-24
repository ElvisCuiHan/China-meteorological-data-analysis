setwd("~/Desktop/啥狗毕业设计")
rm(list=ls())

library(tidyverse)
library(lmtest)
library(lubridate)

data = read_csv(file = "to_test.csv") %>% drop_na()

# 感兴趣城市
city_int <- c("北京", "杭州", "上海", "广州", "西安")
city_convert <- tibble(city=city_int, 
                       city_eng=c("Beijing", "Hangzhou", "Shanghai", "Guangzhou", "Xi'an"))
data_int <- data[data$city %in% city_int[1:5], ]
data_int = inner_join(data_int, city_convert)

# 假设检验
O3_PM_corr <- function(city="杭州") {
  PM = data_int[data_int$city==city & data_int$type=="PM2.5", ]$measurement
  O3 = data_int[data_int$city==city & data_int$type=="O3_8h", ]$measurement
  
  mod1 <- cor.test((PM), (O3), method="pearson")
  mod2 <- cor.test((PM), (O3), method="spearman", exact = F)
  mod3 <- cor.test((PM), (O3), method="kendall")
  
  mod4 <- grangertest(x=PM, y=O3, order = 3) 
  list(mod1, mod2, mod3, mod4)
}
O3_PM_corr("北京")
O3_PM_corr("广州")
O3_PM_corr("上海")
O3_PM_corr("杭州")
O3_PM_corr("西安")
