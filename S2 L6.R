library(tseries)
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

weather = read.csv('S2 L4 Rainfall Temparature.csv', header=TRUE, stringsAsFactors=FALSE)

AnnualTemparature=aggregate(Temp~Year,weather,mean)
head(AnnualTemparature)

smove=AnnualTemparature[,2:2]
str(smove)


TS_AnnualTemp=ts(smove,start=c(2010),end=c(2019),frequency=1)
TS_AnnualTemp
plot(TS_AnnualTemp)
lines(lowess(time(TS_AnnualTemp),TS_AnnualTemp),lwd=3, col=2)

######### Check for a significant trend ######### 
## Randomness Test-Runs, 
hypo_test = factor(ifelse(AnnualTemparature$Temp >= median(AnnualTemparature$Temp),1,0))
head(xx1)
runs.test(hypo_test, a = "less")
