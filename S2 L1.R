library(lubridate)

##get standard dates
ymd("2019-02-02") #Year first
mdy("March 25th, 2019") #Month first
mdy("June 13, 2001", tz = "GMT") #Month first with time zone
dmy("25-July-2021")#Day First
ymd_hm("2019-11-07 16:43", tz = "UTC") # Date and time with time zone

# Extract components

datetime = ymd_hms("2017-07-08 16:347:36")

year(datetime) #year
month(datetime) #month
mday(datetime) #day

#Import a CSV timeseries dataset

setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")
datacrashes=read.csv("S2 L1 Fatalities data.csv")
head(datacrashes)

class(datacrashes$Date)

n$Date2=dmy(datacrashes$Date) #lubridate

datacrashes$Year=year(datacrashes$Date)
datacrashes$Month=month(datacrashes$Date)
datacrashes$Day=mday(datacrashes$Date)

AnnualFatalities=aggregate(Fatalities~Year,datacrashes,mean)
head(AnnualFatalities)

############
#### on a data frame

library(coronavirus)
covid19_df <- refresh_coronavirus_jhu()
head(covid19_df)
