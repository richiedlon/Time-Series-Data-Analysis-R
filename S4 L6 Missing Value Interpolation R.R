library(xts)
library(imputeTS)
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

TRegions=read.csv("S4 L6 Interpolate Missing Values.csv")

head(TRegions)
tail(TRegions)
tsData = TRegions[,2:2] # ts data
head(tsData,1)
tail(tsData,1)

TSTempRegions=ts(tsData,c(1950,1),c(2020,12),12)

ggplot_na_distribution(TSTempRegions,ylab="Temparature")

clean_data = na_interpolation(TSTempRegions,"linear")

ggplot_na_distribution(clean_data,ylab="Temparature")
