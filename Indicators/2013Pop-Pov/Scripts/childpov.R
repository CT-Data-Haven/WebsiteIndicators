library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

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

CTtotalchildpov<-rbind(CTchildpoverty, townchildpoverty)

CTtotalchildpovdf<-data.frame(Totalchildpoverty=estimate(CTtotalchildpov), ME90=1.645*standard.error(CTtotalchildpov))
CTtotalchildpovdf[,c(2:3)]<-CTtotalchildpovdf[,c(1:2)]
CTtotalchildpovdf[,1]<-rownames(CTtotalchildpovdf)
colnames(CTtotalchildpovdf)<-c("Town", "Total Population Under 18 in poverty", "90% MoE")
CTtotalchildpovdf[,3]=CTtotalchildpovdf[,3]=round(CTtotalchildpovdf[,3],0)

write.csv(CTtotalchildpovdf, "2013_CT_towns_Total_Child_Population_inPoverty.csv", row.names=F)
