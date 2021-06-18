#############
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
WeeklyData=read.csv("S4 L9 lags.csv")

head(WeeklyData)
tail(WeeklyData)
TStempfULL=ts(WeeklyData[,3:3],c(1990,6),c(1997,52),52)

plot(TStempfULL)

library(zoo)

TStempfULL = as.zoo(TStempfULL)

class(TStempfULL)

x1 = Lag(TStempfULL, k=1) #observation lagged by a week

x2 = Lag(TStempfULL, k=2) #observation lagged by 2 weeks

x3 = Lag(TStempfULL, k=3) #observation lagged by 3 weeks

x4 = Lag(TStempfULL, k=4) #observation lagged by 4 weeks

x=cbind(TStempfULL, x1,x2,x3,x4) 

head(x)
