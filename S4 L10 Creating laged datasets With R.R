###### Lags

library(forecast)
library(stats)

#############
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
TempGlobal=read.csv("S2 L8 Global Temparature.csv")

TStempsubset=ts(TempGlobal[,2:2],c(2000,1),c(2010,12),12)

head(TStempsubset)

laggedTS=stats::lag(TStempsubset,3)
head(laggedTS)

lagdf=as.data.frame(TStempsubset)
lagdf=slide(lagdf, "x", NewVar="Lag by 1", slideBy=1)
lagdf=slide(lagdf, "x", NewVar="Lead by 1", slideBy=-1)

head(lagdf)
