setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
train = read.csv("S4 L14 Website visits.csv")

head(train)
tail(train)

library(data.table)
library(TSA)
library(forecast)

trafficdata=ts(train[,3:3],c(2014-09-14),c(2020-08-19),365)
cleandata=tsclean(trafficdata)

ndiffs(cleandata)
pgram=periodogram(cleandata)
data.table(period=1/pgram$freq, spec=pgram$spec)[order(-spec)][1:2]

trainset=ts(cleandata[1:2000])

y.ts=cleandata[2001:2167]

#Base model

fit0=auto.arima(trainset)
fc0 = forecast(fit0,h=60)
plot(fc0)

bestfit=list(aicc=fit0$aicc, i=0,fit=fit0)
bestfit

for(i in 1:3) {
  for (j in 1:3){
    z1 = fourier(ts(trainset, frequency=7.000), K=i)
    z2 = fourier(ts(trainset, frequency=187.5), K=j)
    fit = auto.arima(trainset, xreg=cbind(z1, z2), seasonal=F)
    if(fit$aicc < bestfit$aicc) {
      bestfit = list(aicc=fit$aicc, i=i, j=j, fit=fit)
    }
  }
}
bestfit

fc=forecast(bestfit$fit, xreg=cbind(
  fourier(ts(trainset, frequency=7.000), K=bestfit$i, h=60),
  fourier(ts(trainset, frequency=187.5), K=bestfit$j, h=60)))

plot(fc)