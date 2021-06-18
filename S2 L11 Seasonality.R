############# More on seasonality

library(fpp)
library(forecast)

## 3 components: the trend, seasonality and remainder
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

TRegions=read.csv("S2 L9 10 ECO_regionT.csv")

head(TRegions)
tsData=TRegions [,2:2]
timeserie_Temp=ts(tsData,c(2000,1), c(2020,12),12)

plot(as.ts(timeserie_Temp),main="Additive Seasonality")

trend_Temp = ma(timeserie_Temp, order = 12, centre = T) #ma of 4
plot(as.ts(timeserie_Temp))
lines(trend_Temp) #trend line
plot(as.ts(trend_Temp))

##De-trend time series
## Remove trend to expose seasonality

detrend_Temp = timeserie_Temp - trend_Temp 
## subtract the previous trend in case of additive TS
plot(as.ts(detrend_Temp))

##average seasonality
meanTemp = t(matrix(data = detrend_Temp, nrow = 4))
seasonal_Temp = colMeans(meanTemp, na.rm = T)
plot(as.ts(rep(seasonal_Temp,16))) #repeat 16 times

######## Multiplicative seasonality
data(AirPassengers)
timeserie_air = AirPassengers
plot(as.ts(timeserie_air),main="Multiplicative TS")

trend_air = ma(timeserie_air, order = 12, centre = T)
#tskr previous 12 months
plot(as.ts(timeserie_air))
lines(trend_air)
plot(as.ts(trend_air))

detrend_air = timeserie_air / trend_air
### divide the previous trend in case of multiplicative TS
plot(as.ts(detrend_air))

##average seasonality
m_air = t(matrix(data = detrend_air, nrow = 12))
seasonal_air = colMeans(m_air, na.rm = T)
plot(as.ts(rep(seasonal_air,12)))

