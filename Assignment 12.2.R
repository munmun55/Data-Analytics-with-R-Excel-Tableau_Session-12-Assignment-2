
library(readr)
Crimes <- read_csv("E:/munmun_acadgild/acadgild data analytics/supporting files/crimes-in-chicago/Chicago_Crimes_2012_to_2017.csv")
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

crimemodel1 <- Crimes
crimemodel1 <- mutate(Crimes, Date = as.numeric(as.factor(Date)), 
                      IUCR  = as.numeric(as.factor(IUCR )),
                      Location = as.numeric(as.factor( Location)))
names(crimemodel1)
str(crimemodel1)
correlation <- cor(Crimes[,c("Case", "Number", "Date", "Block", "IUCR", "Primary Type", "Description",
                             "Location Desc", "Arrest", "Domestic", "Beat", "District", "Ward", "Community Area",
                             "FBI Code", "X Coordinate", "Y Coordinate", "Year", "Updated On", 
                             "Latitude", "Longitude", "Location")])
psych::cor.plot(correlation)

#-------------------------------------------------------------------------
# b. What is the difference between co-variance and correlation? Take an 
#example from this dataset and show the differences if any?

# Co-Variance is a systematic relationship between a pair of random variables wherein a 
# change in one variable reciprocated by an equivalent change in another variable.
# Measure of correlation, Lie between -??? and +???, Change in scale affects covariance

# Correlation is statistical measure that indicates how strongly two variables are related.
# Scaled version of covariance, Lie between -1 and +1, 
# Change in scale does not affect the coorelation. Unit free measure
# Correlation is a special case of covariance which can be obtained when the data is standardised.

cov(crimemodel1$count, crimemodel1$past.crime.30)
cor(crimemodel1$count, crimemodel1$past.crime.30)

# covariances is hard to compare as the value ranges from -??? and +???
# we get a different covariance from when we do it in other units
# Then we need to 'normalize' the covariance by means divide the covariance 
# by something that represents the diversity and scale in both the covariates, 
# and end up with a value that is assured to be between -1 and 1: the correlation