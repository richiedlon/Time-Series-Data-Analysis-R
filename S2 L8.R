library(fpp)
library(astsa)
library(dygraphs)
library(DT)

setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

weather = read.csv('S2 L8 Global Temparature.csv', header=TRUE, stringsAsFactors=FALSE)
head(weather)
tail(weather)
smove=weather[,2:2]
TS_AnnualTemp=ts(smove,start=c(1880,1), end=c(2016, 12), frequency=12)
plot(TS_AnnualTemp)

plot.ts(TS_AnnualTemp, main = "Temparature variation", xlab = "Year", ylab = "ML")
seasonplot(TS_AnnualTemp, year.labels = TRUE, year.labels.left=TRUE, col=1:40, pch=19, main = "Seasonal Variation of Temparature", xlab = "Month", ylab = "Temparature")

                  ########## monthly plots  ##########  

monthplot(TS_AnnualTemp, year.labels = TRUE, year.labels.left=TRUE, col=1:40, pch=19, main = "Monthly Variation of Temparature", xlab = "Month", ylab = "Temparature")

          ##########  Monthly variation-- boxplot   ########## 

boxplot(TS_AnnualTemp ~ cycle(TS_AnnualTemp), xlab = "Month", ylab = "Temparature", main = "Monthly Variation of Temparature ")

              ########## Moving average smoothing ##########

plot(TS_AnnualTemp, col="black", main = "1 Year Moving Average")
lines(ma(TS_AnnualTemp, order = 12), col = "green", lwd=3)

plot(TS_AnnualTemp, col="black", main = "3 Year Moving Average")
lines(ma(TS_AnnualTemp, order = 36), col = "green", lwd=3)

plot(TS_AnnualTemp, col="black", main = "10 Year Moving Average")
lines(ma(TS_AnnualTemp, order = 120), col = "green", lwd=3)
