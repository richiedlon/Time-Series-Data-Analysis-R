library(xts)
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

TRegions=read.csv("S2 L9 10 ECO_regionT.csv")


head(TRegions)
tail(TRegions)
tsData = TRegions[,2:2] # ts data
head(tsData,1)
tail(tsData,1)

TSTempRegions=ts(tsData,c(1950,1),c(2020,12),12)


plot(TSTempRegions)


##### Model for the Forecast #####
library(forecTheta)

fit_dsm = dstm(TSTempRegions, level=c(95), h=12)

round(fit_dsm$mean,2)
