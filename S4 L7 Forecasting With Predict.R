library(prophet) 
library(dplyr)
library(plotly)
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis")

StockValue=read.csv("S4 L7 Microsoft stock.csv")

head(StockValue)
tail(StockValue)

Microstock = StockValue[c("Date","Close.Last")] 

colnames(Microstock) = c("ds","y")   # Rename columns
head(Microstock)

plot(Microstock$y)
df1 = Microstock
df1$y = log(Microstock$y)

plot(df1$y)
m= prophet(Microstock)
forcastcycle = make_future_dataframe(m , periods = 365)
head(forcastcycle)
tail(forcastcycle)


prediction = predict(m, forcastcycle) 
tail(prediction$yhat) 
plot(m, prediction)


ggplotly(plot(m, prediction))

prophet_plot_components(m, prediction)

