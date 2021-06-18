setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
stockFB=read.csv("S3 L3 Facebook.csv")

library (forecast)
library(stats)

head(stockFB)
tail(stockFB)
TSstockFB= ts(stockFB[2:2],c(2012,6),c(2021,06),12)

statsStock=stats::HoltWinters(TSstockFB)
stockForecast=forecast:::forecast.HoltWinters(statsStock)
forecast:::plot.forecast(stockForecast)
head(stockForecast)
