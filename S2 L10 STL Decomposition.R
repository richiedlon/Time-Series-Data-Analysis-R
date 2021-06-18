############################ STL decomposition ####################################
## 3 components: the trend, seasonality and remainder
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

TRegions=read.csv("S2 L9 10 ECO_regionT.csv")

head(TRegions)
tsData=TRegions [,2:2]

tail(TRegions)
TSTempRegion=ts(tsData,c(1950,1), c(2020,12),12)
plot(TSTempRegion)
decomposedTemp=decompose(TSTempRegion,type="additive")
plot(decomposedTemp)

stlDecomposeTemp=stl(TSTempRegion,s.window="periodic")
plot(stlDecomposeTemp)
seasonal_comp=stlDecomposeTemp$time.series[,1]
plot(seasonal_comp)
