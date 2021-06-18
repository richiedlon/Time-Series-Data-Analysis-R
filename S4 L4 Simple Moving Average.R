library (expsmooth)
library (smooth)

setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
stockFB=read.csv("S3 L3 Facebook.csv")
SstockFB= ts(stockFB[2:2],c(2012,6),c(2021,06),12)

plot(SstockFB)
STOCKfit=sma(SstockFB, order=12, h=12, holdout = TRUE, intervals="parametric", level=0.95)
STOCKfit$holdout
STOCKfit
STOCKfit=sma(SstockFB, order=12, h=12, holdout = TRUE, intervals="parametric", level=0.95 ,silent = FALSE)
