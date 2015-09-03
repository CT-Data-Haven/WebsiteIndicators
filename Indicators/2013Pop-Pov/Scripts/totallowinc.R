library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totallowincfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="C17002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totallowincfull)[,1]=str_replace(geography(totallowincfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totallowinc<-totallowincfull[c(2:79,81:95,97:123,125:173),]

# Calculate total poverty per town
lowinc1=apply(X=totallowinc[,c(2:7)], FUN=sum, MARGIN=2, agg.term="TotalLowInc")

# Fetch CT state data and calculate total poverty
CTtotallowinc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CTlowinc1=apply(X=CTtotallowinc[,c(2:7)], FUN=sum, MARGIN=2, agg.term="TotalLowInc")

CTtotallowinc<-rbind(CTlowinc1, lowinc1)

CTtotallowincdf<-data.frame(CTtotallowinc=estimate(CTtotallowinc), ME90=1.645*standard.error(CTtotallowinc))
CTtotallowincdf[,c(2:3)]<-CTtotallowincdf[,c(1:2)]
CTtotallowincdf[,1]<-rownames(CTtotallowincdf)
colnames(CTtotallowincdf)<-c("Town", "Total Population below 200% FPL", "90% MoE")
CTtotallowincdf[,3]=CTtotallowincdf[,3]=round(CTtotallowincdf[,3],0)

write.csv(CTtotallowincdf, "2013_CT_Total_Population_LowInc.csv", row.names=F)
