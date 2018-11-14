d<-read.csv(file="./Data/TychoMalraiaUS.csv",stringsAsFactors = FALSE)
dim(d)
names(d)
class(d)
unique(d$ConditionName) #only malaria in the data
unique(d$PathogenName) #only Plasmodium
unique(d$ConditionSNOMED) #only 61462000
unique(d$AgeRange) #only 0-130
unique(d$SourceName) #only US Nationally Notifiable Disease Surveillance System
unique(d$PlaceOfAcquisition) #only NA
unique(d$Fatalities) #only 0
unique(d$PathogenTaxonID) #only 5820
unique(d$DiagnosisCertainty) #only NA
unique(d$CountryISO) #only US
unique(d$CountryName) #only UNITED STATES OF AMERICA
#Are Admin1Name and Admin1ISO the same thing?
locs2<-unique(d[,c("Admin1Name","Admin1ISO")])
locs2
unique(d$Subpopulation) #unsure about this - Civilian, Non specified, or Military 
unique(d$PartOfCumulativeCountSeries) #0 or 1 - is the cumulative redundant or does it show data for different dates?
summary(d$CountValue) #a max of 735??? 
#also how can summary() be split to only show cumulative data or only noncumulative
d<-d[,-c(1,2,3,4,5,6,7,8,15,17,18,19)]
names(d)
d[which.max(d$CountValue),]#Makes sense that this is part of the cumulative series but this still seem like an outlier?

