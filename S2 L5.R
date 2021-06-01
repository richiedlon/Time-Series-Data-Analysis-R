setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

library('ggplot2')
library('forecast')
library('lubridate')

dataset_daily = read.csv('S2 L5 Weather Data.csv', header=TRUE, stringsAsFactors=FALSE)

head(dataset_daily)
tail(dataset_daily)

dataset_daily$DateEdited = as.Date(dataset_daily$Date, format = "%m/%d/%Y")
str(dataset_daily)

ggplot(dataset_daily, aes(DateEdited, Humidity)) + geom_line() + scale_x_date('month')  


dataset_daily$hum_MA7 = ma(dataset_daily$Humidity, order=7)
# weekly MA
dataset_daily$hum_MA30 = ma(dataset_daily$Humidity, order=30)
# monthly MA
head(dataset_daily)
ggplot() +
  geom_line(data = dataset_daily, aes(x = DateEdited, y = Humidity, colour = "HUmidity - Observations")) +
  geom_line(data = dataset_daily, aes(x = DateEdited, y = hum_MA7,   colour = "Moving Average - WEEKLY"))  +
  geom_line(data = dataset_daily, aes(x = DateEdited, y = hum_MA30, colour = "Moving Average - MONTHLY"))  +
  ylab('Humidity')

