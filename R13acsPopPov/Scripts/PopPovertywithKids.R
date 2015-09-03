library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

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

# Fetch CT state data and calculate pct 
CTtotalpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CTpoverty1=apply(X=CTtotalpov[,c(2:3)], FUN=sum, MARGIN=2, agg.term="TotalPoverty")
CTpctpoverty=divide.acs(numerator=CTpoverty1, denominator=CTtotalpov[,1], method="proportion")

CTpctpovA<-rbind(CTpctpoverty, pctpoverty)




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




# TOTAL POPULATION UNDER 18 YEARS

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalchildfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalchildfull)[,1]=str_replace(geography(totalchildfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalchild<-totalchildfull[c(2:79,81:95,97:123,125:173),]

# Calculate total children per town
towntotalchild=apply(X=totalchild[,c(3:6,27:30)], FUN=sum, MARGIN=2, agg.term="Totalchildren")
townpctchild=divide.acs(numerator=towntotalchild, denominator=totalchild[,1], method="proportion")

# Fetch CT state data and calculate total childpoverty
CTtotalchild<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01001", col.names="pretty")
CTchild<-apply(X=CTtotalchild[,c(3:6,27:30)], FUN=sum, MARGIN=2, agg.term="Totalchildren")

CTtotalchildA<-rbind(CTchild,towntotalchild)





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


# Merge Data Frames !!!

allA <- CTtotalpopA
allB <- cbind.acs(CTtotalpovA, CTpctpovA)
allC <- cbind.acs(CTtotal1to2xpovA, CTpct1to2xpovA)
allD <- CTtotalchildA
allE <- cbind.acs(CTtotalchildpovA, CTpctchildpovA)
allF <- cbind.acs(CTtotalchild1to2xpovA, CTpctchild1to2xpovA)

allA1 <- cbind.acs(allA, allB)
allB1 <- cbind.acs(allC, allD)
allC1 <- cbind.acs(allE, allF)

allA2 <- cbind.acs(allA1, allB1)

# All data combined
allA3 <-cbind.acs(allA2,allC1)

# Separate Estimates and Margins of Error
CTPopandPovdf<-data.frame(estimate(allA3[,1]), 1.645*standard.error(allA3[,1]), estimate(allA3[,2]), 1.645*standard.error(allA3[,2]), estimate(allA3[,3]), 1.645*standard.error(allA3[,3]), estimate(allA3[,4]), 1.645*standard.error(allA3[,4]), estimate(allA3[,5]), 1.645*standard.error(allA3[,5]), estimate(allA3[,6]), 1.645*standard.error(allA3[,6]), estimate(allA3[,7]), 1.645*standard.error(allA3[,7]), estimate(allA3[,8]), 1.645*standard.error(allA3[,8]), estimate(allA3[,9]), 1.645*standard.error(allA3[,9]), estimate(allA3[,10]), 1.645*standard.error(allA3[,10]))
CTPopandPovdf[,c(2:21)]<-CTPopandPovdf[,c(1:20)]
CTPopandPovdf[,1]<-rownames(CTPopandPovdf)
colnames(CTPopandPovdf)<-c("Town", "Total Population", "Total Population 90% MoE", "Total Population in Poverty", "Total Population in Poverty 90% MOE", "Pct Population in Poverty", "Pct Population in Poverty 90% MOE", "Total Population Income 1-2x Poverty", "Total Population Income 1-2x Poverty 90% MOE", "Pct Population Income 1-2x Poverty", "Pct Population Income 1-2x Poverty 90% MOE", "Total Population Under 18", "Total Population Under 18 90% MOE", "Total Children in Poverty", "Total Children in Poverty 90% MOE", "Pct Children in Poverty", "Pct Children in Poverty 90% MOE", "Total Children Income 1-2x Poverty", "Total Children Income 1-2x Poverty 90% MOE", "Pct Children Income 1-2x Poverty", "Pct Children Income 1-2x Poverty 90% MOE")

# Round Estimates
CTPopandPovdf[,5]=CTPopandPovdf[,5]=round(CTPopandPovdf[,5],0)
CTPopandPovdf[,9]=CTPopandPovdf[,9]=round(CTPopandPovdf[,9],0)
CTPopandPovdf[,13]=CTPopandPovdf[,13]=round(CTPopandPovdf[,13],0)
CTPopandPovdf[,15]=CTPopandPovdf[,15]=round(CTPopandPovdf[,15],0)
CTPopandPovdf[,19]=CTPopandPovdf[,19]=round(CTPopandPovdf[,19],0)

# Round MOEs
CTPopandPovdf[,6]=CTPopandPovdf[,6]=round(CTPopandPovdf[,6],3)
CTPopandPovdf[,7]=CTPopandPovdf[,7]=round(CTPopandPovdf[,7],3)
CTPopandPovdf[,10]=CTPopandPovdf[,10]=round(CTPopandPovdf[,10],3)
CTPopandPovdf[,11]=CTPopandPovdf[,11]=round(CTPopandPovdf[,11],3)
CTPopandPovdf[,16]=CTPopandPovdf[,16]=round(CTPopandPovdf[,16],3)
CTPopandPovdf[,17]=CTPopandPovdf[,17]=round(CTPopandPovdf[,17],3)
CTPopandPovdf[,20]=CTPopandPovdf[,20]=round(CTPopandPovdf[,20],3)
CTPopandPovdf[,21]=CTPopandPovdf[,21]=round(CTPopandPovdf[,21],3)


