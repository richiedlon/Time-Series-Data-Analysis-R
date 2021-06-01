# Set the work directory
setwd("F:\\Backup\\Youtube\\Videos\\Time series analysis\\Data")

# Read the relavent CSV File 
census=read.csv("name_changed.csv")

var<-census
data(var)
names(var)
str(var)
##examine data distribution
head(var)

hist(var$tot_pop)
boxplot(var$tot_po,main="Formalised Descriptive statistics",xlab="Sepal Length")

#Exploratory Data analysis between two variables
var2<-mtcars

names(var2)
str(var2)
head(var2)
plot(var2$mpg,var2$hp)

#Visualizing Categorical Data

catData <- table(var2$cyl)
catData
barplot(catData, main="Automobiles", xlab="No of Cylinders")

barplot(catData, main="Automobiles", xlab="No of Automobiles",horiz=TRUE)


library(ggplot2)

# relation bw miles per galoon and horsepower of different gear level
#am: Transmission - Auto = 0, Manual= 1
#hp: Horse power
#mpg: miles per galoon
#gear: No of gears

# You can see the no of horse power decreases with mpg value
qplot(mpg, hp, data = var2, color = am)

#Specify transmission as a factor
qplot(mpg, hp, data = var2, color = factor(am))

#Specify point size with reference to a variable
qplot(mpg, hp, data = var2, color = factor(am), size =gear )

##Add labels such as x, y and topics.

qplot(mpg, hp, data = var2, color = am,
      xlab = "Sepal Length", ylab = "Petal Length",
      main = "Sepal vs. Petal Length in Iris data")

# Plot the number of movies each director has.
qplot(mpg, hp, data = var2, color = am, geom = "line", ylab = "Horse Power")

###NoTE
# Specifying color Only make sense for categorical datasets not for numerical 
# datasets with decimal values



### Working with Histograms
var3<-iris

qplot(Sepal.Width, data = iris, geom = "histogram",ylab = "Count")

qplot(Sepal.Width, data = iris, geom = "histogram", fill=Species ,ylab = "Count")

qplot(Species, Sepal.Width, data = iris, geom = "boxplot", fill=Species)

#The facet approach partitions a plot into a matrix of panels. 
#Each panel shows a different subset of the data.

ggplot(data=iris,aes(Sepal.Width,Sepal.Length)) +geom_point()+facet_grid(. ~ Species) +geom_smooth(method="lm")




