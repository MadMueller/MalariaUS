d<-read.csv(file="./Data/TychoMalariaUS.csv",stringsAsFactors = FALSE)


#***DAN - notes added to explain, can move or delete when you understand
dcu<-d[d$PartOfCumulativeCountSeries==1,]
dnc<-d[d$PartOfCumulativeCountSeries==0,] #put a condition in the first dimension to take only the rows that meet that condition
dim(d)
dim(dcu)[1]+dim(dnc)[1]

dwd<-d[d$PartOfCumulativeCountSeries==0 & d$Admin1ISO=="US-AK",]
unique(dwd$Admin1ISO)
unique(dwd$PartOfCumulativeCountSeries)

#why does this make sense?
m<-matrix(1:80,10,8)
m[1:3,1:3]
m[c(1,3,5),c(2,4,6)]
m[c(T,T,T,F,F,F,F,F,F,F),c(1,2,3)]

#also with vectors
x<-rnorm(100)
whichlt<-(x<0)
x[whichlt]
#***

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
dAK<-d[d$Admin1ISO=="US-AK",]
unique(dAK$PeriodStartDate)
unique(dAK$PeriodEndDate)
