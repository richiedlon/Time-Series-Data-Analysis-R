library(fpp)
library(forecast)

setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
TempGlobal=read.csv("S3 L3 Facebook.csv")
head(TempGlobal)

arimafit=auto.arima(TempGlobal[,2], seasonal = FALSE)
arimafit
forcastval=forecast(arimafit,h=10)

plot(forcastval)
