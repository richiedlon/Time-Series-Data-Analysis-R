#############
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
TempGlobal=read.csv("S2 L8 Global Temparature.csv")

head(TempGlobal)
tail(TempGlobal)
TStempfULL=ts(TempGlobal[,2:3],c(2000,1),c(2010,12),12)
plot(TStempfULL)

tslinear_reg=tslm(GCAG~GISTEMP,data=TStempfULL)
summary(tslinear_reg)

fcast=forecast(tslinear_reg, newdata=data.frame(GISTEMP=c(-1,1)))
plot(fcast, ylab="% change in GCAG")

TStempfULL=ts(TempGlobal[,2:2],c(2000,1),c(2010,12),12)
fit_predict=tslm(TStempfULL ~trend)

fitmodel=forecast(fit_predict, h=24)
plot(fitmodel)