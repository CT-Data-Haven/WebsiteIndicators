library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

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

CTtotalpov<-rbind(CTpoverty1, poverty1)

CTtotalpovdf<-data.frame(TotalPoverty=estimate(CTtotalpov), ME90=1.645*standard.error(CTtotalpov))
CTtotalpovdf[,c(2:3)]<-CTtotalpovdf[,c(1:2)]
CTtotalpovdf[,1]<-rownames(CTtotalpovdf)
colnames(CTtotalpovdf)<-c("Town", "Total Population below Poverty Level", "90% MoE")
CTtotalpovdf[,3]=CTtotalpovdf[,3]=round(CTtotalpovdf[,3],0)

write.csv(CTtotalpovdf, "2013_CT_towns_Total_Population_Poverty.csv", row.names=F)
