###################################################################
###### Detect Cyclical Period Using Fourier

setwd("F:\\Backup\\\Youtube\\\Videos\\Time series analysis")

TRegions=read.csv("S2 L9 10 ECO_regionT.csv")

head(TRegions)

ArizonaNM =TRegions[,1:2]
head(ArizonaNM)
tail(ArizonaNM)
library(TSA)

DP=periodogram(ArizonaNM$Arizona.New.Mexico.Mountains, yleb='Variable Star Periodogram')
dspike=data.frame(freq=DP$freq,spec=DP$spec)
assendorder=dspike[order(-dspike$spec),]
top5=head(assendorder)
top5
time=1/top5$f
time