library(astsa)
library(tseries)
library(forecast)
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
stockFB=read.csv("S3 L3 Facebook.csv")
head(stockFB,1)
tail(stockFB,1)
stc=stockFB[,2:2]
stockFBfiltered=ts(stc,c(2012,6),c(2021,06),12)

plot(stockFBfiltered)
adf.test(stockFBfiltered)

#Calculate no of differences needed to make stationary
ndiffs(stockFBfiltered)
stockFBfiltered_Sdeff = diff(stockFBfiltered, lag=frequency(stockFBfiltered), differences=1)
plot(stockFBfiltered_Sdeff, type="l", main="Seasonally Differenced of the Dataset")  
adf.test(stockFBfiltered_Sdeff) 

ndiffs(stockFBfiltered_Sdeff)
stockFBstationaryTS = diff(stockFBfiltered_Sdeff, differences= 1)
plot(stockFBstationaryTS, type="l", main="Seasonal Differenced and normal differences")

adf.test(stockFBstationaryTS)
