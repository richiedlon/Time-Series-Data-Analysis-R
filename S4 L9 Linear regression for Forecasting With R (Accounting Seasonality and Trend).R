#############
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
TempGlobal=read.csv("S2 L8 Global Temparature.csv")

head(TempGlobal)
tail(TempGlobal)

TStempfULL=ts(TempGlobal[,2:2],c(2000,1),c(2010,12),12)


newdataframe=data.frame(temparature = TStempfULL, as.numeric(time(TStempfULL)))
names(newdataframe)=c("Temparature", "time")

seasonmodel=tslm(Temparature~season+trend,newdataframe)
predictTemp=forecast(seasonmodel,h=24) 
autoplot(predictTemp)