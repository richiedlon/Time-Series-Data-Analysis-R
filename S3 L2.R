library(astsa)
library(tseries)
library(forecast)
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

BTC=read.csv("S2 L11 BTC.csv")
stc=BTC[,2:2]
BTCfiltered=ts(stc,c(2014,1),c(2021,6),12)

plot(BTCfiltered)
