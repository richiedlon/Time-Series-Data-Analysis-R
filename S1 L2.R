data(airquality)
head(airquality)
str(airquality)
summary(airquality)

# 1. Remove all rows with NA
aq=na.omit(airquality)
head(aq)
str(aq)
summary(aq)

# 2. Replace NA values with 0
turnzero= airquality
turnzero[is.na(turnzero)]<-0
head(turnzero)
str(turnzero)
summary(turnzero)

# 3. Deal with Mean values
meanOzone= mean(airquality$Ozone,na.rm=T)
mean_fix=ifelse(is.na(airquality$Ozone),meanOzone,airquality$Ozone)
head(mean_fix)
str(mean_fix)
summary(mean_fix)

summary(airquality$Ozone)

# 4. Deal with Predictive mean mapping
library(mice)
library(VIM)
pmmaAirq=airquality
md.pattern(pmmaAirq)

mp <- aggr(pmmaAirq, col=c('green','Red'),
           numbers=TRUE, sortVars=TRUE,
           labels=names(pmmaAirq), cex.axis=.7,
           gap=5, ylab=c("Missing data","Pattern"))

pmm_updated<- mice(pmmaAirq, m=5, maxit = 50, method = 'pmm', seed = 500)
summary(pmm_updated)
pmm_updated$imp$Ozone
FinalData<-complete(pmm_updated,1)
head(FinalData)
