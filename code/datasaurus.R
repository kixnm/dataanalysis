library(tidyverse)
library(datasauRus)
library(gtsummary)

datasaurus_dozen %>%
  group_by(dataset) %>%
  summarise(mean_x=mean(x),
            mean_y=mean(y),
            std_dev_x=sd(x),
            std_dev_y=sd(y),
            coor_x_y=cor(x,y))

datasaurus_dozen %>%
  filter(str_detect(dataset,"dots"))

datasaurus_dozen %>%
  filter(str_detect(dataset,"dots")) %>%
  ggplot()+
  geom_point(aes(x = x, y = y))+
  theme_classic()

ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset))+
  geom_point()+
  theme_void()+
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol = 4)
