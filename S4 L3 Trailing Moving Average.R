library(tidyverse)      # data manipulation and visualization
library(lubridate)      # easily work with dates and times
library(fpp2)           # working with time series data
library(zoo) 


setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
TempGlobal=read.csv("S2 L8 Global Temparature.csv")
TStempfULL=ts(TempGlobal[,2:2],c(1880,1),c(2016,12),12)

tail(TempGlobal)

autoplot(TStempfULL, series = "Data") + 
  autolayer(ma(TStempfULL, 13), series = "1 yr MA") +
  autolayer(ma(TStempfULL, 25), series = "2 yr MA") +
  autolayer(ma(TStempfULL, 37), series = "3 yr MA") +
  xlab("Date") + 
  ylab("Temparature")


Temp_TMA = TempGlobal %>% 
              select(Date, Temparature = GCAG) %>% 
              mutate(srate_tma = rollmean(Temparature, k = 12, fill = NA, align = "right"))

tail(Temp_TMA,20)
str(Temp_TMA)

Temp_TMA$Date= as.Date(Temp_TMA$Date)
str(Temp_TMA)

Temp_TMA %>%
  gather(metric, value, -Date) %>%
  ggplot(aes(Date, value, color = metric)) +
  geom_line()
tail(Temp_TMA)
