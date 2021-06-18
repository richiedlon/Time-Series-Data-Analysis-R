#############
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
BTCval=read.csv("S2 L8 Global Temparature.csv")

library(forecast)


head(BTCval,1)
tail(BTCval,1)

TSBTC_Train=ts(BTCval[,2:2],c(1990,1),c(2014,6),12)
TSBTC_Test=ts(BTCval[,2:2],c(2014,7),c(2016,12),12)

fit_bats = bats(TSBTC_Train)
fit_bats
plot(fit_bats)

prd= forecast(fit_bats, h=24, level=0.95)
plot(prd)

f_bats=bats(TSBTC_Test, model=fit_bats)

accuracy(f_bats)
