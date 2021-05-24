setwd("~/Desktop/啥狗毕业设计")
rm(list=ls())

library(tidyverse)
library("xlsx")

data = read_csv(file = "2019.csv") %>% drop_na()

to_csv <- data[data$O3 >= 160 & data$PM2.5 >= 75, ]
write_csv(to_csv, "filtered.csv")
write.xlsx(to_csv, "filtered.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

# 1 京津冀及周边地区
jjj <- c("北京","天津","石家庄","唐山","廊坊","保定","沧州",
         "衡水","邢台","邯郸","太原","阳泉","长治","晋城",
         "济南","淄博","济宁","德州","聊城","滨州","菏泽",
         "郑州","开封","安阳","鹤壁","新乡","焦作","濮阳")
jjj <- to_csv[to_csv$city %in% jjj, ]
write.xlsx(jjj, "处理后数据/jjj.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

# 2 长三角
csj <- c("上海", "南京", "无锡","常州", "苏州",
         "南通", "盐城","扬州", "镇江", "泰州",
         "杭州", "宁波", "嘉兴", "湖州","绍兴", 
         "金华", "舟山","台州", "合肥", "芜湖", 
         "马鞍山"," 铜陵", "安庆", "滁州","池州", "宣城")
csj <- to_csv[to_csv$city %in% csj, ]
write.xlsx(csj, "处理后数据/csj.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

# 3 珠三角
zsj <- c("广州", "佛山", "肇庆","深圳", "东莞", 
         "惠州", "珠海", "中山", "江门")
zsj <- to_csv[to_csv$city %in% zsj, ]
write.xlsx(zsj, "处理后数据/zsj.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

# 4 汾渭平原
fwpy <- c("西安","宝鸡","咸阳","渭南","铜川","杨凌","太原",
          "晋中","吕梁","临汾","运城","洛阳","三门峡")
fwpy <- to_csv[to_csv$city %in% fwpy, ]
write.xlsx(fwpy, "处理后数据/fwpy.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

# 5 成渝城市群
cycsq <- c("成都","自贡","泸州","德阳","绵阳","遂宁","内江",
           "乐山","南充","眉山","宜宾","广安","达州","雅安",
           "资阳","重庆")
cycsq <- to_csv[to_csv$city %in% cycsq, ]
write.xlsx(cycsq, "处理后数据/cycsq.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)
