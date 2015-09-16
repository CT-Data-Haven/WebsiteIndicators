library(acs)
library(stringr)
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




# TOTAL PCT LOW INC NOT POVERTY

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
town1to2xpov=apply(X=total2xpov[,c(4:7)], FUN=sum, MARGIN=2, agg.term="Total1to2xpov")
pct1to2xpov=divide.acs(numerator=town1to2xpov, denominator=total2xpov[,1], method="proportion")

# Fetch CT state data and calculate pct
CTtotal2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CT1to2xpov=apply(X=CTtotal2xpov[,c(4:7)], FUN=sum, MARGIN=2, agg.term="Total1to2xpov")
CTpct1to2xpov=divide.acs(numerator=CT1to2xpov, denominator=CTtotal2xpov[,1], method="proportion")

CTpct1to2xpovA<-rbind(CTpct1to2xpov, pct1to2xpov)










# CHILD POPULATION IN POVERTY

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalchildpovertyfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalchildpovertyfull)[,1]=str_replace(geography(totalchildpovertyfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalchildpoverty<-totalchildpovertyfull[c(2:79,81:95,97:123,125:173),]

# Calculate total childpoverty per town
townchildpoverty=apply(X=totalchildpoverty[,c(3:5,16:18,29:31)], FUN=sum, MARGIN=2, agg.term="Totalchildpoverty")

# Fetch CT state data and calculate total childpoverty
CTtotalchildpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")
CTchildpoverty=apply(X=CTtotalchildpoverty[,c(3:5,16:18,29:31)], FUN=sum, MARGIN=2, agg.term="Totalchildpoverty")

CTtotalchildpovA<-rbind(CTchildpoverty, townchildpoverty)




# CHILD POPULATION PCT IN POVERTY

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalchildpovertyfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalchildpovertyfull)[,1]=str_replace(geography(totalchildpovertyfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalchildpoverty<-totalchildpovertyfull[c(2:79,81:95,97:123,125:173),]

# Calculate total childpoverty per town
townchildpoverty=apply(X=totalchildpoverty[,c(3:5,16:18,29:31)], FUN=sum, MARGIN=2, agg.term="Totalchildpoverty")
townchild=apply(X=totalchildpoverty[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Totalchild")
pctchildpoverty=divide.acs(numerator=townchildpoverty, denominator=townchild, method="proportion")

# Fetch CT state data and calculate total childpoverty
CTtotalchildpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")
CTchild=apply(X=CTtotalchildpoverty[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Totalchild")
CTchildpoverty=apply(X=CTtotalchildpoverty[,c(3:5,16:18,29:31)], FUN=sum, MARGIN=2, agg.term="Totalchildpoverty")
CTpctchildpoverty=divide.acs(numerator=CTchildpoverty, denominator=CTchild, method="proportion")

CTpctchildpovA<-rbind(CTpctchildpoverty, pctchildpoverty)





# CHILD POPULATION LOW INCOME NOT POVERTY

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalchild1to2xpovfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalchild1to2xpovfull)[,1]=str_replace(geography(totalchild1to2xpovfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalchild1to2xpov<-totalchild1to2xpovfull[c(2:79,81:95,97:123,125:173),]

# Calculate total child1to2xpov per town
townchild1to2xpov=apply(X=totalchild1to2xpov[,c(6:10,19:23,32:36)], FUN=sum, MARGIN=2, agg.term="Totalchild1to2xpov")

# Fetch CT state data and calculate total child1to2xpov
CTtotalchild1to2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")
CTchild1to2xpov=apply(X=CTtotalchild1to2xpov[,c(6:10,19:23,32:36)], FUN=sum, MARGIN=2, agg.term="Totalchild1to2xpov")

CTtotalchild1to2xpovA<-rbind(CTchild1to2xpov, townchild1to2xpov)





# CHILD POPULATION PCT LOW INCOME NOT POVERTY

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalchild1to2xpovfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalchild1to2xpovfull)[,1]=str_replace(geography(totalchild1to2xpovfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalchild1to2xpov<-totalchild1to2xpovfull[c(2:79,81:95,97:123,125:173),]

# Calculate total child1to2xpov per town
townchild1to2xpov=apply(X=totalchild1to2xpov[,c(6:10,19:23,32:36)], FUN=sum, MARGIN=2, agg.term="Totalchild1to2xpov")
townchild=apply(X=totalchild1to2xpov[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Totalchild")
pctchild1to2xpov=divide.acs(numerator=townchild1to2xpov, denominator=townchild, method="proportion")

# Fetch CT state data and calculate total child1to2xpov
CTtotalchild1to2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")
CTchild1to2xpov=apply(X=CTtotalchild1to2xpov[,c(6:10,19:23,32:36)], FUN=sum, MARGIN=2, agg.term="Totalchild1to2xpov")
CTchild=apply(X=CTtotalchild1to2xpov[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Totalchild")
CTpctchild1to2xpov=divide.acs(numerator=CTchild1to2xpov, denominator=CTchild, method="proportion")

CTpctchild1to2xpovA<-rbind(CTpctchild1to2xpov, pctchild1to2xpov)




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
lowinc65A=apply(X=all65inc[,c(5:9,18:22)], FUN=sum, MARGIN=2, agg.term="Low Income 65 and over")



# Calculate pct of population per age group per town
Pct65plusPovertyA=divide.acs(numerator=pov65, denominator=plus65, method="proportion")
Pct65plusLowincA=divide.acs(numerator=lowinc65, denominator=plus65, method="proportion")









# Merge Data Frames !!!

allA <- CTtotalpopA
allB <- cbind.acs(age0to17A,PctAge0to17A)
allC <- cbind.acs(age65plusA, PctAge65plusA)
allD <- cbind.acs(HspA, PctHspA)
allE <- cbind.acs(WhiteNoHspA, PctWhiteNoHspA)
allF <- cbind.acs(BlackA, PctBlackA)
allG <- cbind.acs(OtherRaceA, PctOtherRaceA)
allH <- cbind.acs(TenureOwnA, PctTenureOwnA)
allI <- cbind.acs(ForeignA, AllPctForeignA)
allJ <- PovstatusA
allK <- cbind.acs(CTtotalpovA, CTpctpovA)
allL <- cbind.acs(CTtotal1to2xpovA, CTpct1to2xpovA)
allM <- cbind.acs(CTtotalchildpovA, CTpctchildpovA)
allN <- cbind.acs(CTtotalchild1to2xpovA, CTpctchild1to2xpovA)
allO <- cbind.acs(pov65A, Pct65plusPovertyA)
allP <- cbind.acs(lowinc65A,Pct65plusLowincA)

allA1 <- cbind.acs(allA, allB)
allB1 <- cbind.acs(allC, allD)
allC1 <- cbind.acs(allE, allF)
allD1 <- cbind.acs(allG, allH)
allE1 <- cbind.acs(allI, allJ)
allF1 <- cbind.acs(allK, allL)
allG1 <- cbind.acs(allM, allN)
allH1 <- cbind.acs(allO, allP)


allA2 <- cbind.acs(allA1, allB1)
allB2 <- cbind.acs(allC1, allD1)
allC2 <- cbind.acs(allE1, allF1)
allD2 <- cbind.acs(allG1, allH1)

allA4 <- cbind.acs(allA2, allB2)
allB4 <- cbind.acs(allC2, allD2)

# All data combined
allA3 <-cbind.acs(allA4,allB4)

# Separate Estimates and Margins of Error
townprofiledf<-data.frame(estimate(allA3[,1]), 1.645*standard.error(allA3[,1]), estimate(allA3[,2]), 1.645*standard.error(allA3[,2]), estimate(allA3[,3]), 1.645*standard.error(allA3[,3]), estimate(allA3[,4]), 1.645*standard.error(allA3[,4]), estimate(allA3[,5]), 1.645*standard.error(allA3[,5]), estimate(allA3[,6]), 1.645*standard.error(allA3[,6]), estimate(allA3[,7]), 1.645*standard.error(allA3[,7]), estimate(allA3[,8]), 1.645*standard.error(allA3[,8]), estimate(allA3[,9]), 1.645*standard.error(allA3[,9]), estimate(allA3[,10]), 1.645*standard.error(allA3[,10]), estimate(allA3[,11]), 1.645*standard.error(allA3[,11]), estimate(allA3[,12]), 1.645*standard.error(allA3[,12]), estimate(allA3[,13]), 1.645*standard.error(allA3[,13]), estimate(allA3[,14]), 1.645*standard.error(allA3[,14]), estimate(allA3[,15]), 1.645*standard.error(allA3[,15]), estimate(allA3[,16]), 1.645*standard.error(allA3[,16]), estimate(allA3[,17]), 1.645*standard.error(allA3[,17]), estimate(allA3[,18]), 1.645*standard.error(allA3[,18]), estimate(allA3[,19]), 1.645*standard.error(allA3[,19]), estimate(allA3[,20]), 1.645*standard.error(allA3[,20]), estimate(allA3[,21]), 1.645*standard.error(allA3[,21]), estimate(allA3[,22]), 1.645*standard.error(allA3[,22]), estimate(allA3[,23]), 1.645*standard.error(allA3[,23]), estimate(allA3[,24]), 1.645*standard.error(allA3[,24]), estimate(allA3[,25]), 1.645*standard.error(allA3[,25]), estimate(allA3[,26]), 1.645*standard.error(allA3[,26]), estimate(allA3[,27]), 1.645*standard.error(allA3[,27]), estimate(allA3[,28]), 1.645*standard.error(allA3[,28]), estimate(allA3[,29]), 1.645*standard.error(allA3[,29]), estimate(allA3[,30]), 1.645*standard.error(allA3[,30]))
townprofiledf[,c(2:61)]<-townprofiledf[,c(1:60)]
townprofiledf[,1]<-rownames(townprofiledf)
colnames(townprofiledf)<-c("Town", "Total Population", "MoE Total Population", "Ages 0-17", "MoE Ages 0-17", "Pct Ages 0-17", "MoE Pct Ages 0-17", "Ages 65+", "MoE Ages 65+", "Pct Ages 65+", "MoE Pct Ages 65+","Hispanic Population", "MoE Hispanic Population", "Pct Hispanic", "MoE Pct Hispanic", "White Population", "MoE White Population", "Pct White", "MoE Pct White", "Black Population", "MoE Black Population", "Pct Black", "MoE Pct Black", "Other Race Population", "MoE Other Race Population", "Pct Other Race", "MoE Pct Other Race", "Homeowners", "MoE Homeowners", "Homeownership Rate", "MoE Homeownership Rate", "Foreign-born Population", "MoE Foreign-born Population", "Pct Foreign-born", "MoE Pct Foreign-born", "Poverty Status Determined", "MoE Poverty Status Determined", "Population in Poverty", "MoE Population in Poverty", "Poverty Rate", "MoE Poverty Rate", "Population Low Income", "MoE Population Low Income", "Pct Low Income", "MoE Pct Low Income", "Ages 0-17 In Poverty", "MoE Ages 0-17 In Poverty", "Pct Ages 0-17 in Poverty", "MoE Pct Ages 0-17 in Poverty", "Ages 0-17 Income 1-2x Poverty", "MoE Ages 0-17 Income 1-2x Poverty", "Pct Ages 0-17 Income 1-2x Poverty", "MoE Pct Ages 0-17 Income 1-2x Poverty", "Ages 65+ In Poverty", "MoE Ages 65+ In Poverty", "Pct Ages 65+ in Poverty", "MoE Pct Ages 65+ in Poverty", "Ages 65+ Income 1-2x Poverty", "MoE Ages 65+ Income 1-2x Poverty", "Pct Ages 65+ Income 1-2x Poverty", "MoE Pct Ages 65+ Income 1-2x Poverty")

# Round Estimates
townprofiledf[,5]=townprofiledf[,5]=round(townprofiledf[,5],0)
townprofiledf[,9]=townprofiledf[,9]=round(townprofiledf[,9],0)
townprofiledf[,25]=townprofiledf[,25]=round(townprofiledf[,25],0)
townprofiledf[,33]=townprofiledf[,33]=round(townprofiledf[,33],0)
townprofiledf[,39]=townprofiledf[,39]=round(townprofiledf[,39],0)
townprofiledf[,43]=townprofiledf[,43]=round(townprofiledf[,43],0)
townprofiledf[,47]=townprofiledf[,47]=round(townprofiledf[,47],0)
townprofiledf[,51]=townprofiledf[,51]=round(townprofiledf[,51],0)
townprofiledf[,55]=townprofiledf[,55]=round(townprofiledf[,55],0)
townprofiledf[,59]=townprofiledf[,59]=round(townprofiledf[,59],0)

# Round MOEs
townprofiledf[,6]=townprofiledf[,6]=round(townprofiledf[,6],3)
townprofiledf[,7]=townprofiledf[,7]=round(townprofiledf[,7],3)
townprofiledf[,10]=townprofiledf[,10]=round(townprofiledf[,10],3)
townprofiledf[,11]=townprofiledf[,11]=round(townprofiledf[,11],3)
townprofiledf[,14]=townprofiledf[,14]=round(townprofiledf[,14],3)
townprofiledf[,15]=townprofiledf[,15]=round(townprofiledf[,15],3)
townprofiledf[,18]=townprofiledf[,18]=round(townprofiledf[,18],3)
townprofiledf[,19]=townprofiledf[,19]=round(townprofiledf[,19],3)
townprofiledf[,22]=townprofiledf[,22]=round(townprofiledf[,22],3)
townprofiledf[,23]=townprofiledf[,23]=round(townprofiledf[,23],3)
townprofiledf[,26]=townprofiledf[,26]=round(townprofiledf[,26],3)
townprofiledf[,27]=townprofiledf[,27]=round(townprofiledf[,27],3)
townprofiledf[,30]=townprofiledf[,30]=round(townprofiledf[,30],3)
townprofiledf[,31]=townprofiledf[,31]=round(townprofiledf[,31],3)
townprofiledf[,34]=townprofiledf[,34]=round(townprofiledf[,34],3)
townprofiledf[,35]=townprofiledf[,35]=round(townprofiledf[,35],3)
townprofiledf[,40]=townprofiledf[,40]=round(townprofiledf[,40],3)
townprofiledf[,41]=townprofiledf[,41]=round(townprofiledf[,41],3)
townprofiledf[,44]=townprofiledf[,44]=round(townprofiledf[,44],3)
townprofiledf[,45]=townprofiledf[,45]=round(townprofiledf[,45],3)
townprofiledf[,48]=townprofiledf[,48]=round(townprofiledf[,48],3)
townprofiledf[,49]=townprofiledf[,49]=round(townprofiledf[,49],3)
townprofiledf[,52]=townprofiledf[,52]=round(townprofiledf[,52],3)
townprofiledf[,53]=townprofiledf[,53]=round(townprofiledf[,53],3)
townprofiledf[,56]=townprofiledf[,56]=round(townprofiledf[,56],3)
townprofiledf[,57]=townprofiledf[,57]=round(townprofiledf[,57],3)
townprofiledf[,60]=townprofiledf[,60]=round(townprofiledf[,60],3)
townprofiledf[,61]=townprofiledf[,61]=round(townprofiledf[,61],3)

write.csv(townprofiledf, "2013_town_profile_sept16.csv", row.names=F)
