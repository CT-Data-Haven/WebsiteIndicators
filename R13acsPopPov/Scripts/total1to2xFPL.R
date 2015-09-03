library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

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

CTtotal1to2xpov<-rbind(CT2xpov1, town2xpov1)

CTtotal1to2xpovdf<-data.frame(Total2xpov=estimate(CTtotal1to2xpov), ME90=1.645*standard.error(CTtotal1to2xpov))
CTtotal1to2xpovdf[,c(2:3)]<-CTtotal1to2xpovdf[,c(1:2)]
CTtotal1to2xpovdf[,1]<-rownames(CTtotal1to2xpovdf)
colnames(CTtotal1to2xpovdf)<-c("Town", "Total Population 1-2x FPL Level", "90% MoE")
CTtotal1to2xpovdf[,3]=CTtotal1to2xpovdf[,3]=round(CTtotal1to2xpovdf[,3],0)

write.csv(CTtotal1to2xpovdf, "2013_CT_towns_Total_Population_1to2xpov.csv", row.names=F)
