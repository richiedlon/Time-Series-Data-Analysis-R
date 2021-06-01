# Set the work directory
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis\\Data")

# Read the relavent CSV File 
census=read.csv("Lecture3\\DataCensus_SriLanka.csv")

#Display the first 6 rows present in the newdataset data frame.
head(census)

#Data structure of the CSV file
str(census)


## 1. Some minor Data cleaning

# Replace the Dollar sign ($) with a blank and convert that variable to numeric format
census$IncomeNew = as.numeric(gsub("[\\$,]", "", census$Income))

#Column names
names(census)

str(census)
# No of Coloumns
ncol(census)

## 2. Filtering certain columns and get the output

columns_filtered= names(census) %in% c("province_n", 
                                       "district_n", 
                                       "dsd_n",
                                       "male",
                                       "female",
                                       "tot_pop",
                                       "IncomeNew") 

#include the above columns in line no 21 and create a new dataset
newdataset= census[columns_filtered]

#exclude the above columns in line no 21 and create new dataset
exclude_selected= census[!columns_filtered] 

#Display the first 6 rows present in the newdataset data frame.
head(newdataset)

#Removes all incomplete cases of a data object
newdataset=na.omit(newdataset)
head(newdataset)


## 3. Renameing data columns

# Renaming column
names(newdataset)[names(newdataset)=="province_n"] ="Province"
names(newdataset)[names(newdataset)=="district_n"] ="District"
names(newdataset)[names(newdataset)=="dsd_n"] ="DSD"
head(newdataset)
write.csv(newdataset,"name_changed.csv") #store dataframe in a csv

