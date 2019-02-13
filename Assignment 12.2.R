library(readr)
Crimes <- read_csv("E:/munmun_acadgild/acadgild data analytics/supporting files/communities.csv")
View(Crimes)


names(Crimes) <- c("Case", "Number", "Date", "Block", "IUCR", "Primary Type", "Description",
                   "Location Desc", "Arrest", "Domestic", "Beat", "District", "Ward", "Community Area",
                   "FBI Code", "X Coordinate", "Y Coordinate", "Year", "Updated On", 
                   "Latitude", "Longitude", "Location")
head(Crimes)
str(Crimes)

#a. Visualize the correlation between all variables in a meaningful and clear way 
# of representing. Find out top 3 reasons for having more crime in a city.

library(dplyr)
Crimes <- na.omit(Crimes)
names(Crimes)
c <- cor(Crimes[c(11,12,13,14,18,20,21)])
c

psych::cor.plot(c)

# Find out top 3 reasons for having more crime in a city.
x <- as.data.frame(table(Crimes$Description))
x[order(x$Freq, decreasing = T)[1:3],]

#-------------------------------------------------------------------------
# b. What is the difference between co-variance and correlation? Take an 
#example from this dataset and show the differences if any?


correlation <- cor(Crimes[c(11,12,13,14,18,20,21)])
correlation
psych::cor.plot(correlation)

covariance <- cov(Crimes[c(11,12,13,14,18,20,21)])
covariance 
psych::cor.plot(covariance)

#OR

correlation1 <- cor(Crimes[c(11,12)])
correlation1

covariance1 <- cov(Crimes[c(11,12)])
covariance1 

#or

correlation1 <- cor(Crimes[c(14,18)])
correlation1

covariance1 <- cov(Crimes[c(14,18)])
covariance1 

