library(lubridate)

##get standard dates
ymd("2019-02-02") #Year first
mdy("March 25th, 2019") #Month first
mdy("June 13, 2001", tz = "GMT") #Month first with time zone
dmy("25-July-2021")#Day First
ymd_hm("2019-11-07 16:43", tz = "UTC") # Date and time with time zone

# Extract components

datetime = ymd_hms("2017-07-08 16:47:36")

year(datetime) #year
month(datetime) #month
mday(datetime) #day

#Import a CSV timeseries dataset

setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

datacrashes=read.csv("S2 L1 Fatalities data.csv")
head(datacrashes)
class(datacrashes$Date) # Original Class of the date variable

datacrashes$Date2=mdy(datacrashes$Date) #lubridate
head(datacrashes)
class(datacrashes$Date2) # Class of the date variable after lubridate

datacrashes$Year=year(datacrashes$Date2) # Extract Year
datacrashes$Month=month(datacrashes$Date2) # Extract month
datacrashes$Day=mday(datacrashes$Date2)  # Extract day

head(datacrashes)
AnnualFatalities=aggregate(Fatalities~Year,datacrashes,sum) #Annual crashes
head(AnnualFatalities)



