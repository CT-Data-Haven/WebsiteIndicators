library(acs)
library(stringr)
library(scales)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")


# Total Population

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalpopfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01003", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalpopfull)[,1]=str_replace(geography(totalpopfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalpop<-totalpopfull[c(2:79,81:95,97:123,125:173),]

CTtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01003", col.names="pretty")

CTtotalpopA<-rbind(CTtotalpop, totalpop)




# Total Population 18 and under or 65 and over

# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTPopAge<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01001", col.names="pretty")

# fetch ACS town data
PopAgefull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(PopAgefull)[,1]=str_replace(geography(PopAgefull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
PopAge<-PopAgefull[c(2:79,81:95,97:123,125:173),]

# Merge town and CT data
allPopAge<-rbind(CTPopAge, PopAge)

# Calculate population per age group per town
age0to17A=apply(X=allPopAge[,c(3:6,27:30)], FUN=sum, MARGIN=2, agg.term="age0to17")
age65plusA=apply(X=allPopAge[,c(20:25,44:49)], FUN=sum, MARGIN=2, agg.term="age65plus")

# Calculate pct of population per age group per town
PctAge0to17A=divide.acs(numerator=age0to17A, denominator=allPopAge[,1], method="proportion")
PctAge65plusA=divide.acs(numerator=age65plusA, denominator=allPopAge[,1], method="proportion")


# Population by Race

# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTPopRace<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B03002", col.names="pretty")

# fetch ACS town data
PopRacefull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B03002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(PopRacefull)[,1]=str_replace(geography(PopRacefull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
PopRace<-PopRacefull[c(2:79,81:95,97:123,125:173),]

# Merge town and CT data
allPopRace<-rbind(CTPopRace, PopRace)

# Calculate population per age group per town
WhiteNoHspA=apply(X=allPopRace[,3], FUN=sum, MARGIN=2, agg.term="WhiteNoHsp")
BlackA=apply(X=allPopRace[,4], FUN=sum, MARGIN=2, agg.term="Black")
HspA=apply(X=allPopRace[,c(12)], FUN=sum, MARGIN=2, agg.term="Hsp")
OtherRaceA=apply(X=allPopRace[,c(5:9)], FUN=sum, MARGIN=2, agg.term="OtherRace")

# Calculate pct of population per age group per town
PctWhiteNoHspA=divide.acs(numerator=WhiteNoHspA, denominator=allPopRace[,1], method="proportion")
PctBlackA=divide.acs(numerator=BlackA, denominator=allPopRace[,1], method="proportion")
PctHspA=divide.acs(numerator=HspA, denominator=allPopRace[,1], method="proportion")
PctOtherRaceA=divide.acs(numerator=OtherRaceA, denominator=allPopRace[,1], method="proportion")



# Homeownership
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTtenure<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B25003", col.names="pretty")

# fetch ACS town data
towntenurefull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B25003", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(towntenurefull)[,1]=str_replace(geography(towntenurefull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
towntenure<-towntenurefull[c(2:79,81:95,97:123,125:173),]

# Merge town and CT data
alltenure<-rbind(CTtenure, towntenure)

# Calculate population per age group per town
TenureHouseholdsA=apply(X=alltenure[,c(1)], FUN=sum, MARGIN=2, agg.term="Households")
TenureOwnA=apply(X=alltenure[,c(2)], FUN=sum, MARGIN=2, agg.term="Owning Household")
PctTenureOwnA=divide.acs(numerator=TenureOwnA, denominator=alltenure[,1], method="proportion")



# Foreign Born
library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
towncitizenshipfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B05001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(towncitizenshipfull)[,1]=str_replace(geography(towncitizenshipfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
towncitizenship<-towncitizenshipfull[c(2:79,81:95,97:123,125:173),]

# Fetch CT state data and calculate pct 
CTcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B05001", col.names="pretty")

allCitizenship<-rbind(CTcitizenship, towncitizenship)


# Calculate population per citizenship group per town
ForeignA=apply(X=allCitizenship[,c(5:6)], FUN=sum, MARGIN=2, agg.term="Foreign Born")
AllPctForeignA=divide.acs(numerator=ForeignA, denominator=allCitizenship[,1], method="proportion")



# Gender
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTsex<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01001", col.names="pretty")

# fetch ACS town data
townsexfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(townsexfull)[,1]=str_replace(geography(townsexfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
townsex<-townsexfull[c(2:79,81:95,97:123,125:173),]

# Merge town and CT data
allsex<-rbind(CTsex, townsex)

# Calculate population per age group per town
Totalsex=apply(X=allsex[,c(1)], FUN=sum, MARGIN=2, agg.term="Total Population")
MaleA=apply(X=allsex[,c(2)], FUN=sum, MARGIN=2, agg.term="Male")
FemaleA=apply(X=allsex[,c(26)], FUN=sum, MARGIN=2, agg.term="Female")


# Calculate pct of population per age group per town
PctMaleA=divide.acs(numerator=MaleA, denominator=Totalsex, method="proportion")
PctFemaleA=divide.acs(numerator=FemaleA, denominator=Totalsex, method="proportion")



# Educational Attainment
# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
edattainfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B06009", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(edattainfull)[,1]=str_replace(geography(towncitizenshipfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
edattain<-edattainfull[c(2:79,81:95,97:123,125:173),]

# Fetch CT state data and calculate pct 
CTedattain<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B06009", col.names="pretty")

allEdattain<-rbind(CTedattain, edattain)


# Calculate population per citizenship group per town
Adults25plusA=apply(X=allEdattain[,c(1)], FUN=sum, MARGIN=2, agg.term="No HS degree")
NoHSA=apply(X=allEdattain[,c(2)], FUN=sum, MARGIN=2, agg.term="No HS degree")
BachPlusA=apply(X=allEdattain[,c(5:6)], FUN=sum, MARGIN=2, agg.term="At least Bachelor's degree")

# Calculate pct per town
AdultPctNoHSA=divide.acs(numerator=NoHSA, denominator=allEdattain[,1], method="proportion")
AdultPctBachPlusA=divide.acs(numerator=BachPlusA, denominator=allEdattain[,1], method="proportion")




# Median Income
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B19013", col.names="pretty")

# fetch ACS town data
townmedianincfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B19013", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(townmedianincfull)[,1]=str_replace(geography(townmedianincfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
townmedianinc<-townmedianincfull[c(2:79,81:95,97:123,125:173),]

# Merge town and CT data
medianincA<-rbind(CTmedianinc, townmedianinc)






# TOTAL POVERTY

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalpovertyfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="C17002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalpovertyfull)[,1]=str_replace(geography(totalpovertyfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalpoverty<-totalpovertyfull[c(2:79,81:95,97:123,125:173),]

# Calculate total poverty per town
poverty1=apply(X=totalpoverty[,c(2:3)], FUN=sum, MARGIN=2, agg.term="TotalPoverty")

# Fetch CT state data and calculate total poverty
CTtotalpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CTpoverty1=apply(X=CTtotalpov[,c(2:3)], FUN=sum, MARGIN=2, agg.term="TotalPoverty")

CTtotalpovA<-rbind(CTpoverty1, poverty1)





# TOTAL PCT POVERTY

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalpovertyfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="C17002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalpovertyfull)[,1]=str_replace(geography(totalpovertyfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalpoverty<-totalpovertyfull[c(2:79,81:95,97:123,125:173),]

# Calculate pct per town
poverty1=apply(X=totalpoverty[,c(2:3)], FUN=sum, MARGIN=2, agg.term="TotalPoverty")
pctpoverty=divide.acs(numerator=poverty1, denominator=totalpoverty[,1], method="proportion")
povstatus=apply(X=totalpoverty[,c(1)], FUN=sum, MARGIN=2, agg.term="Total, Poverty status determined")

# Fetch CT state data and calculate pct 
CTtotalpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CTpoverty1=apply(X=CTtotalpov[,c(2:3)], FUN=sum, MARGIN=2, agg.term="TotalPoverty")
CTpctpoverty=divide.acs(numerator=CTpoverty1, denominator=CTtotalpov[,1], method="proportion")
CTpovstatus=apply(X=CTtotalpov[,c(1)], FUN=sum, MARGIN=2, agg.term="Total, Poverty status determined")

CTpctpovA<-rbind(CTpctpoverty, pctpoverty)
PovstatusA <-rbind(CTpovstatus, povstatus)




# TOTAL "LOW INC NOT POVERTY" - 1 to 2x FPL

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
total2xpovfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="C17002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(total2xpovfull)[,1]=str_replace(geography(total2xpovfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
total2xpov<-total2xpovfull[c(2:79,81:95,97:123,125:173),]

# Calculate total 2xpov per town
town2xpov1=apply(X=total2xpov[,c(4:7)], FUN=sum, MARGIN=2, agg.term="Total2xpov")

# Fetch CT state data and calculate total 2xpov
CTtotal2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CT2xpov1=apply(X=CTtotal2xpov[,c(4:7)], FUN=sum, MARGIN=2, agg.term="Total2xpov")

CTtotal1to2xpovA<-rbind(CT2xpov1, town2xpov1)




# TOTAL PCT LOW INC

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
total2xpovfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="C17002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(total2xpovfull)[,1]=str_replace(geography(total2xpovfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
total2xpov<-total2xpovfull[c(2:79,81:95,97:123,125:173),]

# Calculate pct per town
town1to2xpov=apply(X=total2xpov[,c(2:7)], FUN=sum, MARGIN=2, agg.term="Total1to2xpov")
pct1to2xpov=divide.acs(numerator=town1to2xpov, denominator=total2xpov[,1], method="proportion")

# Fetch CT state data and calculate pct
CTtotal2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CT1to2xpov=apply(X=CTtotal2xpov[,c(2:7)], FUN=sum, MARGIN=2, agg.term="Total1to2xpov")
CTpct1to2xpov=divide.acs(numerator=CT1to2xpov, denominator=CTtotal2xpov[,1], method="proportion")

CTpct1to2xpovA<-rbind(CTpct1to2xpov, pct1to2xpov)








# CHILD POPULATION IN POVERTY



# In Poverty and Low Income, 0 to 17
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CT18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")

# fetch ACS town data
town18Incfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(town18Incfull)[,1]=str_replace(geography(town18Incfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
town18Inc<-town18Incfull[c(2:79,81:95,97:123,125:173),]

# Merge town and CT data
all18inc<-rbind(CT18Inc, town18Inc)


# Calculate population per age group per town
plus18A <-apply(X=all18inc[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Undre 18")
pov18A=apply(X=all18inc[,c(3:5,16:18,29:31)], FUN=sum, MARGIN=2, agg.term="Poverty Under 18")
lowinc18A=apply(X=all18inc[,c(3:10,16:23,29:36)], FUN=sum, MARGIN=2, agg.term="Low Income Under 18")



# Calculate pct of population per age group per town
Pct18plusPovertyA=divide.acs(numerator=pov18A, denominator=plus18A, method="proportion")
Pct18plusLowincA=divide.acs(numerator=lowinc18A, denominator=plus18A, method="proportion")










# In Poverty and Low Income, 65 and older
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CT65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")

# fetch ACS town data
town65Incfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(town65Incfull)[,1]=str_replace(geography(town65Incfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
town65Inc<-town65Incfull[c(2:79,81:95,97:123,125:173),]

# Merge town and CT data
all65Incexpand<-rbind(CT65Inc, town65Inc)
all65inc <- all65Incexpand[,c(106:131)]

# Calculate population per age group per town
plus65A <-apply(X=all65inc[,c(1,14)], FUN=sum, MARGIN=2, agg.term="65 and over")
pov65A=apply(X=all65inc[,c(2:4,15:17)], FUN=sum, MARGIN=2, agg.term="Poverty 65 and over")
lowinc65A=apply(X=all65inc[,c(2:9,15:22)], FUN=sum, MARGIN=2, agg.term="Low Income 65 and over")



# Calculate pct of population per age group per town
Pct65plusPovertyA=divide.acs(numerator=pov65A, denominator=plus65A, method="proportion")
Pct65plusLowincA=divide.acs(numerator=lowinc65A, denominator=plus65A, method="proportion")









# Merge Data Frames !!!

allA <- CTtotalpopA
allB <- cbind.acs(age0to17A,PctAge0to17A)
allC <- cbind.acs(age65plusA, PctAge65plusA)
allD <- cbind.acs(MaleA, PctMaleA)
allE <- cbind.acs(FemaleA, PctFemaleA)
allF <- cbind.acs(HspA, PctHspA)
allG <- cbind.acs(WhiteNoHspA, PctWhiteNoHspA)
allH <- cbind.acs(BlackA, PctBlackA)
allI <- cbind.acs(OtherRaceA, PctOtherRaceA)
allJ <- cbind.acs(ForeignA, AllPctForeignA)
allK <- cbind.acs(TenureHouseholdsA, TenureOwnA)
allL <- cbind.acs(PctTenureOwnA, Adults25plusA)
allM <- cbind.acs(NoHSA, AdultPctNoHSA)
allN <- cbind.acs(BachPlusA, AdultPctBachPlusA)
allO <- cbind.acs(medianincA, PovstatusA)
allP <- cbind.acs(CTtotalpovA, CTpctpovA)
allQ <- cbind.acs(CTtotal1to2xpovA, CTpct1to2xpovA)
allR <- cbind.acs(plus18A,pov18A)
allS <- cbind.acs(Pct18plusPovertyA, lowinc18A)
allT <- cbind.acs(Pct18plusLowincA, plus65A)
allU <- cbind.acs(pov65A, Pct65plusPovertyA)
allV <- cbind.acs(lowinc65A,Pct65plusLowincA)

allA1 <- cbind.acs(allA, allB)
allB1 <- cbind.acs(allC, allD)
allC1 <- cbind.acs(allE, allF)
allD1 <- cbind.acs(allG, allH)
allE1 <- cbind.acs(allI, allJ)
allF1 <- cbind.acs(allK, allL)
allG1 <- cbind.acs(allM, allN)
allH1 <- cbind.acs(allO, allP)
allI1 <- cbind.acs(allQ, allR)
allJ1 <- cbind.acs(allS, allT)
allK1 <- cbind.acs(allU, allV)

allA2 <- cbind.acs(allA1, allB1)
allB2 <- cbind.acs(allC1, allD1)
allC2 <- cbind.acs(allE1, allF1)
allD2 <- cbind.acs(allG1, allH1)
allE2 <- cbind.acs(allI1, allJ1)
allF2 <- allK1

allA4 <- cbind.acs(allA2, allB2)
allB4 <- cbind.acs(allC2, allD2)
allC4 <- cbind.acs(allE2, allF2)

allA5 <- cbind.acs(allA4, allB4)
allB5 <- allC4

# All data combined
allA3 <-cbind.acs(allA5,allB5)

# Separate Estimates and Margins of Error
townprofiledf<-data.frame(estimate(allA3[,1]), 1.645*standard.error(allA3[,1]), estimate(allA3[,2]), 1.645*standard.error(allA3[,2]), estimate(allA3[,3]), 1.645*standard.error(allA3[,3]), estimate(allA3[,4]), 1.645*standard.error(allA3[,4]), estimate(allA3[,5]), 1.645*standard.error(allA3[,5]), estimate(allA3[,6]), 1.645*standard.error(allA3[,6]), estimate(allA3[,7]), 1.645*standard.error(allA3[,7]), estimate(allA3[,8]), 1.645*standard.error(allA3[,8]), estimate(allA3[,9]), 1.645*standard.error(allA3[,9]), estimate(allA3[,10]), 1.645*standard.error(allA3[,10]), estimate(allA3[,11]), 1.645*standard.error(allA3[,11]), estimate(allA3[,12]), 1.645*standard.error(allA3[,12]), estimate(allA3[,13]), 1.645*standard.error(allA3[,13]), estimate(allA3[,14]), 1.645*standard.error(allA3[,14]), estimate(allA3[,15]), 1.645*standard.error(allA3[,15]), estimate(allA3[,16]), 1.645*standard.error(allA3[,16]), estimate(allA3[,17]), 1.645*standard.error(allA3[,17]), estimate(allA3[,18]), 1.645*standard.error(allA3[,18]), estimate(allA3[,19]), 1.645*standard.error(allA3[,19]), estimate(allA3[,20]), 1.645*standard.error(allA3[,20]), estimate(allA3[,21]), 1.645*standard.error(allA3[,21]), estimate(allA3[,22]), 1.645*standard.error(allA3[,22]), estimate(allA3[,23]), 1.645*standard.error(allA3[,23]), estimate(allA3[,24]), 1.645*standard.error(allA3[,24]), estimate(allA3[,25]), 1.645*standard.error(allA3[,25]), estimate(allA3[,26]), 1.645*standard.error(allA3[,26]), estimate(allA3[,27]), 1.645*standard.error(allA3[,27]), estimate(allA3[,28]), 1.645*standard.error(allA3[,28]), estimate(allA3[,29]), 1.645*standard.error(allA3[,29]), estimate(allA3[,30]), 1.645*standard.error(allA3[,30]), estimate(allA3[,31]), 1.645*standard.error(allA3[,31]), estimate(allA3[,32]), 1.645*standard.error(allA3[,32]), estimate(allA3[,33]), 1.645*standard.error(allA3[,33]), estimate(allA3[,34]), 1.645*standard.error(allA3[,34]), estimate(allA3[,35]), 1.645*standard.error(allA3[,35]), estimate(allA3[,36]), 1.645*standard.error(allA3[,36]), estimate(allA3[,37]), 1.645*standard.error(allA3[,37]), estimate(allA3[,38]), 1.645*standard.error(allA3[,38]), estimate(allA3[,39]), 1.645*standard.error(allA3[,39]), estimate(allA3[,40]), 1.645*standard.error(allA3[,40]), estimate(allA3[,41]), 1.645*standard.error(allA3[,41]), estimate(allA3[,42]), 1.645*standard.error(allA3[,42]), estimate(allA3[,43]), 1.645*standard.error(allA3[,43]))
townprofiledf[,c(2:87)]<-townprofiledf[,c(1:86)]
townprofiledf[,1]<-rownames(townprofiledf)
colnames(townprofiledf)<-c("Town", "Total Population", "MoE Total Population", "Population Ages 0-17", "MoE Population Ages 0-17", "% of Total Population, Ages 0-17", "MoE % of Total Population, Ages 0-17", "Population Ages 65+", "MoE Population Ages 65+", "% of Total Population, Ages 65+", "MoE % of Total Population, Ages 65+", "Population Male", "MoE Population Male", "% of Total Population, Male", "MoE % of Total Population, Male", "Population Female", "MoE Population Female", "% of Total Population, Female", "MoE % of Total Population, Female", "Hispanic Population", "MoE Hispanic Population", "% of Total Population, Hispanic", "MoE % of Total Population, Hispanic", "White Non-Hispanic Population", "MoE White Non-Hispanic Population", "% of Total Population, White Non-Hispanic", "MoE % of Total Population, White Non-Hispanic", "Black Non-Hispanic Population", "MoE Black Non-Hispanic Population", "% of Total Population, Black Non-Hispanic", "MoE % of Total Population, Black Non-Hispanic", "Other Race Non-Hispanic Population", "MoE Other Race Non-Hispanic Population", "% of Total Population, Other Race Non-Hispanic", "MoE % of Total Population, Other Race Non-Hispanic", "Foreign-born Population", "MoE Foreign-born Population", "% of Total Population, Foreign-born", "MoE % of Total Population, Foreign-born", "Total Households", "MoE Total Households", "Owner-Occupied Households", "MoE Owner-Occupied Households", "Homeownership Rate", "MoE Homeownership Rate", "Population Ages 25+", "MoE Population Ages 25+", "Ages 25+ without a high school diploma", "MoE Ages 25+ without a high school diploma", "% of Population Ages 25+, without a high school diploma", "MoE % of Population Ages 25+, without a high school diploma", "Ages 25+ with a Bachelor's degree or more", "MoE Ages 25+ with a Bachelor's degree or more", "% of Population Ages 25+, with a Bachelor's degree or more", "MoE % of Population Ages 25+, with a Bachelor's degree or more", "Median Household Income", "MoE Median Household Income", "Total Population, Poverty Status Determined", "MoE Total Population, Poverty Status Determined", "Population in Poverty", "MoE Population in Poverty", "Poverty Rate", "MoE Poverty Rate", "Population Low-Income", "MoE Population Low-Income", "Low-Income Rate", "MoE Low-Income Rate", "Population Ages 0-17, Poverty Status Determined", "MoE Population Ages 0-17, Poverty Status Determined", "Population Ages 0-17 In Poverty", "MoE Population Ages 0-17 In Poverty", "Population Ages 0-17, Poverty Rate", "MoE Population Ages 0-17, Poverty Rate", "Population Ages 0-17 Low-Income", "MoE Population Ages 0-17 Low-Income", "Population Ages 0-17, Low-Income Rate", "MoE Population Ages 0-17, Low-Income Rate", "Population Ages 65+, Poverty Status Determined", "MoE Population Ages 65+, Poverty Status Determined", "Population Ages 65+ In Poverty", "MoE Population Ages 65+ In Poverty", "Population Ages 65+ Poverty Rate", "MoE Population Ages 65+ Poverty Rate", "Population Ages 65+ Low-Income", "MoE Population Ages 65+ Low-Income", "Population Ages 65+, Low-Income Rate", "MoE Population Ages 65+, Low-Income Rate")


# Round Estimates
townprofiledf[,5]=townprofiledf[,5]=round(townprofiledf[,5],0)
townprofiledf[,9]=townprofiledf[,9]=round(townprofiledf[,9],0)
townprofiledf[,25]=townprofiledf[,25]=round(townprofiledf[,25],0)
townprofiledf[,33]=townprofiledf[,33]=round(townprofiledf[,33],0)
townprofiledf[,37]=townprofiledf[,37]=round(townprofiledf[,37],0)
townprofiledf[,53]=townprofiledf[,53]=round(townprofiledf[,53],0)
townprofiledf[,61]=townprofiledf[,61]=round(townprofiledf[,61],0)
townprofiledf[,65]=townprofiledf[,65]=round(townprofiledf[,65],0)
townprofiledf[,69]=townprofiledf[,69]=round(townprofiledf[,69],0)
townprofiledf[,71]=townprofiledf[,71]=round(townprofiledf[,71],0)
townprofiledf[,75]=townprofiledf[,75]=round(townprofiledf[,75],0)
townprofiledf[,79]=townprofiledf[,79]=round(townprofiledf[,79],0)
townprofiledf[,81]=townprofiledf[,81]=round(townprofiledf[,81],0)
townprofiledf[,85]=townprofiledf[,85]=round(townprofiledf[,85],0)

# Round percentages
townprofiledf[,6]=paste(round(townprofiledf[,6]*100,1), "%",sep="")
townprofiledf[,7]=paste(round(townprofiledf[,7]*100,1), "%", sep="")
townprofiledf[,10]=paste(round(townprofiledf[,10]*100,1), "%", sep="")
townprofiledf[,11]=paste(round(townprofiledf[,11]*100,1), "%", sep="")
townprofiledf[,14]=paste(round(townprofiledf[,14]*100,1), "%", sep="")
townprofiledf[,15]=paste(round(townprofiledf[,15]*100,1), "%", sep="")
townprofiledf[,18]=paste(round(townprofiledf[,18]*100,1), "%", sep="")
townprofiledf[,19]=paste(round(townprofiledf[,19]*100,1), "%", sep="")
townprofiledf[,22]=paste(round(townprofiledf[,22]*100,1), "%", sep="")
townprofiledf[,23]=paste(round(townprofiledf[,23]*100,1), "%", sep="")
townprofiledf[,26]=paste(round(townprofiledf[,26]*100,1), "%", sep="")
townprofiledf[,27]=paste(round(townprofiledf[,27]*100,1), "%", sep="")
townprofiledf[,30]=paste(round(townprofiledf[,30]*100,1), "%", sep="")
townprofiledf[,31]=paste(round(townprofiledf[,31]*100,1), "%", sep="")
townprofiledf[,34]=paste(round(townprofiledf[,34]*100,1), "%", sep="")
townprofiledf[,35]=paste(round(townprofiledf[,35]*100,1), "%", sep="")
townprofiledf[,38]=paste(round(townprofiledf[,38]*100,1), "%", sep="")
townprofiledf[,39]=paste(round(townprofiledf[,39]*100,1), "%", sep="")
townprofiledf[,44]=paste(round(townprofiledf[,44]*100,1), "%", sep="")
townprofiledf[,45]=paste(round(townprofiledf[,45]*100,1), "%", sep="")
townprofiledf[,50]=paste(round(townprofiledf[,50]*100,1), "%", sep="")
townprofiledf[,51]=paste(round(townprofiledf[,51]*100,1), "%", sep="")
townprofiledf[,54]=paste(round(townprofiledf[,54]*100,1), "%", sep="")
townprofiledf[,55]=paste(round(townprofiledf[,55]*100,1), "%", sep="")
townprofiledf[,62]=paste(round(townprofiledf[,62]*100,1), "%", sep="")
townprofiledf[,63]=paste(round(townprofiledf[,63]*100,1), "%", sep="")
townprofiledf[,66]=paste(round(townprofiledf[,66]*100,1), "%", sep="")
townprofiledf[,67]=paste(round(townprofiledf[,67]*100,1), "%", sep="")
townprofiledf[,72]=paste(round(townprofiledf[,72]*100,1), "%", sep="")
townprofiledf[,73]=paste(round(townprofiledf[,73]*100,1), "%", sep="")
townprofiledf[,76]=paste(round(townprofiledf[,76]*100,1), "%", sep="")
townprofiledf[,77]=paste(round(townprofiledf[,77]*100,1), "%", sep="")
townprofiledf[,82]=paste(round(townprofiledf[,82]*100,1), "%", sep="")
townprofiledf[,83]=paste(round(townprofiledf[,83]*100,1), "%", sep="")
townprofiledf[,86]=paste(round(townprofiledf[,86]*100,1), "%", sep="")
townprofiledf[,87]=paste(round(townprofiledf[,87]*100,1), "%", sep="")


# Add Metadata columns
# Definition, Source, Year

townprofiledf$Source[1] <- "All data from the US Census Bureau ACS 5-year estimate. The ACS surveys a sample of households on a rolling monthly basis; survey data are aggregated and averaged into 1, 3, and 5-year period estimates. The Census Bureau considers the 5-year estimates to be the most accurate and recommends using 5-year estimates for town-level data."
townprofiledf$Year[1] <- "2013 5-year"
townprofiledf$Definition[1] <- "MoE is the Margin of Error for each estimate with a 90% confidence interval. Due to sampling methodology, margins of error exist for all reported Census estimates. With 90 percent confidence, each estimate falls between a lower limit (subtracting margin of error from estimate) and an upper limit (adding margin of error to estimate).  
'Hispanic Population' includes all persons who identify as of Hispanic or Latino ethnicity. 'White Non-Hispanic Population' includes all persons who identify as of white or Caucasian race, and not of Hispanic or Latino ethnicity. 'Black Non-Hispanic Population' includes all persons who identify as of black or African American race, and not of Hispanic or Latino ethnicity. 'Other Race Non-Hispanic Population' includes all persons who identify as another race, and not of Hispanic or Latino ethnicity. 
'Foreign-born Population' includes all residents born outside of the United States to non-American parents. An immigrant is another term for a foreign-born person.
'Total Households' is equivalent to the number of occupied housing units in a given geographic area. The Census sometimes reports households as 'occupied housing units.'
'Owner-occupied households' includes all households that own their housing unit.
'Homeownership Rate' is owner-occupied households divided by total households.
'Total Population, Poverty Status Determined' is the total population, excluding persons living in prisons, nursing homes, college dormitories, military barracks, foster children under 15 years, and people in non-conventional housing. 
'Population in Poverty' includes any persons whose annual household income is below the poverty threshold. The federal government determines the poverty threshold based on the size of the family and the ages of its members.
'Poverty Rate' is the population in poverty divided by the total population whose poverty status is determined.
'Population Low-Income' counts all whose annual household income is less than 200 percent of the poverty threshold, including the population in poverty.
'Low-Income Rate' is the low-income population divided by the total population whose poverty status is determined."
townprofiledf$"Key Facts" <- "Key Facts"
townprofiledf$"Population" <- "Population"
townprofiledf$"Race and Ethnicity, Total Population" <- "Race and Ethnicity, Total Population"
townprofiledf$"Place of Birth, Total Population" <- "Place of Birth, Total Population"
townprofiledf$"Households" <- "Households"
townprofiledf$"Educational Attainment, Population 25 years and over" <- "Educational Attainment, Population 25 years and over"
townprofiledf$"Median Income" <- "Median Income"
townprofiledf$"Poverty and Low-Income, Total Population" <- "Poverty and Low-Income, Total Population"
townprofiledf$"Poverty and Low-Income, Population 0 to 17 years" <- "Poverty and Low-Income, Population 0 to 17 years"
townprofiledf$"Poverty and Low-Income, Population 65 years and over" <- "Poverty and Low-Income, Population 65 years and over"
townprofiledf$"Other Data Sources" <- "Other Data Sources"
townprofiledf$"Metadata" <- "Metadata"


censuslink <- read.csv("TownProfilesCensus.csv", header=TRUE, nrows=170, stringsAsFactors = FALSE)

profile <- merge(townprofiledf, censuslink)
profile <- profile[c(31,1:30,32:170),]

names(profile)[103:106] <- c("Social Characteristics", "Economic Characteristics", "Housing Characteristics", "Demographic Characteristics")

profiledf <- profile[,c(1,91,92,2:11,16:19,93,20:35,94,36:39,95,40:45,96,46:55,97,56:57,98,58:67,99,68:77,100,78:87,102,88:90,101,103:106)]


write.csv(profiledf, "5year2013_town_profile.csv", row.names=F)
