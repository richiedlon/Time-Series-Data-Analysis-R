setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

weather=read.csv("S2 L4 Rainfall Temparature.csv") ## Daily Data
## Monthly Rainfall and Temperature

head(weather)
tail(weather)

#Convert data into a time series
Rainfall=ts(weather$Rainfallmm,c(2010,1),c(2019,12),12)

#12 is specified as these are monthly data
plot(Rainfall)

library(Kendall)
lines(lowess(time(Rainfall),Rainfall),lwd=3, col=2)

library(ggfortify)
#Plot Decomposed Time Series Data
autoplot(decompose(Rainfall))

###### annual data
#Aggregate monthly data to represent the entire year
AnnualTemparature=aggregate(Temp~Year,weather,mean)
head(AnnualTemparature)

smove=AnnualTemparature[,2:2]

TS_AnnualTemp=ts(smove,start=c(2010),end=c(2019),frequency=1)

plot(TS_AnnualTemp)

lines(lowess(time(TS_AnnualTemp),TS_AnnualTemp),lwd=3, col=2)

#Plot Decomposed Time Series Data
autoplot(decompose(TS_AnnualTemp))

