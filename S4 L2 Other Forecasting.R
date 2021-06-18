#############
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
TempGlobal=read.csv("S2 L9 10 ECO_regionT.csv")

library(forecast)


head(TempGlobal,1)
tail(TempGlobal,1)
TStempfULL=ts(TempGlobal[,2:2],c(2012,6),c(2021,6),12)
TStemp=window(TStempfULL,start=1992, end=2018)

plot(TStemp)

Tempfit1 = meanf(TStemp, h=12)   #Mean forecasting
plot(Tempfit1)

Tempfit2 = naive(TStemp, h=12)    # Naive function forecasting
plot(Tempfit2)


Tempfit3 = snaive(TStemp, h=12)   #Seasonal Naive Forecasting
plot(Tempfit3)

plot(Tempfit1, plot.conf=FALSE) # Mean forecasting
lines(Tempfit2$mean,col=2)      # Naive function forecasting
lines(Tempfit3$mean,col=3)      # Seasonal Naive Forecasting


AccuracyTest = window(TStempfULL, start=2018)
accuracy(Tempfit1, AccuracyTest)
accuracy(Tempfit2, AccuracyTest)
accuracy(Tempfit3, AccuracyTest)

#model with lowest RMSE is the best 