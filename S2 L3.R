setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

cases=read.csv("S2 L3 CoronaData.csv") ## Daily Data
## Corona Virus Cases

head(cases,n=50)
tail(cases,n=10)

#Available date range 
ncol(cases)

smove=cases[,2:7]

head(smove)

## Create a daily Date object
inds = seq(as.Date("2020-03-01"), as.Date("2021-05-27"), by = "day")

startDate=c(2020, as.numeric(format(inds[1], "%j")))
startDate

#Create time series object
myts = ts(smove,start = startDate, frequency = 365)

plot(myts)


library(devtools)
install_github('sinhrks/ggfortify')
require(ggfortify) #Plot graphs using time series objects as ggplot2 graphs 

autoplot(myts) # time series on facets
autoplot(myts, facets = FALSE) #time series of corona cases in one plot




