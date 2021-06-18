#############
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
BTCval=read.csv("S2 L11 BTC.csv")

library(forecast)
library(tseries)
library(ggplot2)
library(ggfortify)

head(BTCval,1)
tail(BTCval,1)

TSBTC=ts(BTCval[,2:2],c(2014,1),c(2021,6),12)

#Plot time series data
autoplot(TSBTC)+xlab(label = "TIME")+
  ylab(label = "Bitcoin Value")+
  ggtitle("Change of Bitcoin Value")

#Check Stationarity of Time Series data
adf.test((TSBTC))

#Check to no of differenciation required to stationarize dataset
ndiffs(TSBTC)

#differencing lag one
BTCdif1 = diff(TSBTC)

#Check Stationarity of Time Series data after differencing
adf.test((BTCdif1))

#Plot differenced data
autoplot(BTCdif1)

## Call ARIMA
diff_arima = auto.arima(BTCdif1)
diff_arima

#Make forecast for next 12 months
BTC_forecast = forecast(diff_arima,12)

#Plot predicted forcast
autoplot(BTC_forecast)+
  ylab(label = "PREDICTION FOR BTC VALUE")