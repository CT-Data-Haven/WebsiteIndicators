library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalchildlowincfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalchildlowincfull)[,1]=str_replace(geography(totalchildlowincfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalchildlowinc<-totalchildlowincfull[c(2:79,81:95,97:123,125:173),]

# Calculate total child low inc per town
townchildlowinc=apply(X=totalchildlowinc[,c(3:10,16:23,29:36)], FUN=sum, MARGIN=2, agg.term="Totalchildlowinc")

# Fetch CT state data and calculate total child low inc
CTtotalchildlowinc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")
CTchildlowinc=apply(X=CTtotalchildpoverty[,c(3:10,16:23,29:36)], FUN=sum, MARGIN=2, agg.term="Totalchildlowinc")

CTtotalchildlowinc<-rbind(CTchildlowinc, townchildlowinc)

CTtotalchildlowincdf<-data.frame(Totalchildlowinc=estimate(CTtotalchildlowinc), ME90=1.645*standard.error(CTtotalchildlowinc))
CTtotalchildlowincdf[,c(2:3)]<-CTtotalchildlowincdf[,c(1:2)]
CTtotalchildlowincdf[,1]<-rownames(CTtotalchildlowincdf)
colnames(CTtotalchildlowincdf)<-c("Town", "Total Population Under 18 below 200% FPL", "90% MoE")
CTtotalchildlowincdf[,3]=CTtotalchildlowincdf[,3]=round(CTtotalchildlowincdf[,3],0)

write.csv(CTtotalchildlowincdf, "2013_CT_towns_Total_Child_Population_LowInc.csv", row.names=F)
