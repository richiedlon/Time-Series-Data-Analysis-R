library(astsa)
library(forecast)
library(tseries)
library(ggplot2)
library(reshape2)

setwd("F://Backup//Youtube//Videos//Time series analysis")
stock=read.csv("S3 L3 Stock.csv")
str(stock)
stock$Date= as.Date(stock$Date)
str(stock)
head(stock)

names(stock) = c("Date","stock")
stock[,"stock"] = log(stock[,"stock"])


ggplot(stock,aes(x=Date,y=stock)) + geom_line(size=.5) + theme_classic() + labs(title="Log Stock Value")

Date.detrend = residuals(lm(stock ~ Date, data=stock)) 
head(Date.detrend)

datframe = data.frame("Date"=stock[,"Date"],"Detrended"=Date.detrend)
ggplot(datframe,aes(x=Date,y=Detrended)) + geom_hline(yintercept=0,colour="green") + geom_line(size=.5) + theme_classic() + labs(title="Detrended Linear",y="")

adf.test(datframe$Detrended)



