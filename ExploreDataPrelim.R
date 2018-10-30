#***
#For an initial exploration of the data
#***

#load the data, basic examination
d<-read.csv(file="./Data/TychoMalariaUS.csv",stringsAsFactors = FALSE)

dim(d)
names(d)
class(d)

#is it all malaria?
unique(d$ConditionName) #so it is only malaria
unique(d$ConditionSNOMED)

#is it always the same pathogen?
unique(d$PathogenName)
unique(d$PathogenTaxonID)

#what is fatalities?
unique(d$Fatalities)
#don't know but it's always 0

#only USA?
unique(d$CountryName)
unique(d$CountryISO)
#yes

#more on locs
locs2<-unique(d[,c("Admin1Name","Admin1ISO")])
locs2
#these are synonyms, just keep the ISO

#Make yourself a data frame with a column for the different areas where data are available,
#other columns to be added
locs<-unique(d[,c("Admin1ISO","Admin2Name","CityName")])
locs<-locs[order(locs$Admin1ISO,locs$Admin2Name,locs$CityName),]
#Note some rows just have a state designation, some have a state and a county designation. 
#We do not know as of 2018 10 30 whether the state designations without county are for the 
#whole state or only for the other counties not separately listed or what.

#what is PartOfCumulative...
unique(d$PartOfCumulativeCountSeries)
head(d[d$PartOfCumulativeCountSeries==1 & d$Admin1Name=="WISCONSIN",],100)
tail(d[d$PartOfCumulativeCountSeries==0 & d$Admin1Name=="WISCONSIN",],20)
head(d)
#We think we know what this is, but not entriely sure. Also, does the "cumulative" just keep 
#going or does it reset? Can we just throw this cumulative stuff out, i.e., is it completely 
#redundant with the non-cumulative stuff or not?

#what is AgeRange?
unique(d$AgeRange)

#Subpopulation?
unique(d$Subpopulation)
#Civilian or Militry or non specified
sum(d$Subpopulation=="Civilian")
sum(d$Subpopulation=="Military")
sum(d$Subpopulation=="None specified")
#may need to be careful here, but OK because most are none specified

#Place of aquisition?
unique(d$PlaceOfAcquisition)
#only NA

#Diagnosis certainty?
unique(d$DiagnosisCertainty)
#only NA

#source name
unique(d$SourceName)
#only one value

#throw out columsn with only one unique value
d<-d[,-c(1,2,3,4,5,6,7,8,15,17,18,19)]
names(d)

#remaining issues:
#1) not sure what to do with smaller admin units
#2) not sure what to do with cummulative v non-cum counts
#3) not sure what to do with miltary/civilian/not specified

#Is the city specified whenever the county is? Are these the "big" cities?

#sort carefull to try to answer some of the above outstanding questions
dAK<-d[d$Admin1ISO=="US-AK",]
unique(dAK$Admin2Name)
unique(dAK$CityName) #so AK has no sub-spatial units
dAK<-dAK[order(dAK$PeriodEndDate,dAK$PeriodStartDate,dAK$PartOfCumulativeCountSeries),]
head(dAK,100) #maybe the bulk of the records are cummulative
tail(dAK,100)
dim(dAK)

dAK0<-dAK[dAK$PartOfCumulativeCountSeries==0,]
dAK0[order(dAK0$PeriodStartDate),c("PeriodStartDate","PeriodEndDate","CountValue")]

sum(d$PartOfCumulativeCountSeries==0)
sum(d$PartOfCumulativeCountSeries==1)

#maybe a different state would be better - AK probably has little malaria.
#Madeleine to look at some southern state. We want to know if these are redundant 
#forms of the same info. Check 4-5 by eye, then read about dates in R. Type ?as.POSICct
#to get started. Think about how to check in an automated way using date objects the same
#assumption we're trying to make here.

