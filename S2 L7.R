setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

weather = read.csv('S2 L4 Rainfall Temparature.csv', header=TRUE, stringsAsFactors=FALSE)
smove=weather[,4:4]
TS_AnnualTemp=ts(smove,start=c(2010,1), end=c(2019, 12), frequency=12)
plot(TS_AnnualTemp)


plot(TS_AnnualTemp, type='p', ylab='Rainfall', main='nearest neighbor'  )
lines(supsmu(time(TS_AnnualTemp), TS_AnnualTemp, span="cv"), col="red")
lines(supsmu(time(TS_AnnualTemp), TS_AnnualTemp, span=0.01), col="blue")


plot(TS_AnnualTemp, type='p', ylab='Rainfall- spline')
lines(smooth.spline(time(TS_AnnualTemp), TS_AnnualTemp))
lines(smooth.spline(time(TS_AnnualTemp), TS_AnnualTemp, spar=1))

