library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

# TOTAL POPULATION DF

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

CTtotalpop<-rbind(CTtotalpop, totalpop)

CTtotalpopdf<-data.frame(TotalPopulation=estimate(CTtotalpop), ME90=1.645*standard.error(CTtotalpop))
CTtotalpopdf[,c(2:3)]<-CTtotalpopdf[,c(1:2)]
CTtotalpopdf[,1]<-rownames(CTtotalpopdf)
colnames(CTtotalpopdf)<-c("Town", "Total Population", "90% MoE")

write.csv(CTtotalpopdf, "2013_CT_towns_Total_Population.csv", row.names=F)
