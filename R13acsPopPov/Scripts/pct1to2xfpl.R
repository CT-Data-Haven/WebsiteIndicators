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

# Calculate pct per town
town1to2xpov=apply(X=total2xpov[,c(4:7)], FUN=sum, MARGIN=2, agg.term="Total1to2xpov")
pct1to2xpov=divide.acs(numerator=town1to2xpov, denominator=total2xpov[,1], method="proportion")

# Fetch CT state data and calculate pct
CTtotal2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CT1to2xpov=apply(X=CTtotal2xpov[,c(4:7)], FUN=sum, MARGIN=2, agg.term="Total1to2xpov")
CTpct1to2xpov=divide.acs(numerator=CT1to2xpov, denominator=CTtotal2xpov[,1], method="proportion")

CTpct1to2xpov<-rbind(CTpct1to2xpov, pct1to2xpov)

CTpct1to2xpovdf<-data.frame(Pct1to2xpov=estimate(CTpct1to2xpov), ME90=1.645*standard.error(CTpct1to2xpov))
CTpct1to2xpovdf[,c(2:3)]<-CTpct1to2xpovdf[,c(1:2)]
CTpct1to2xpovdf[,1]<-rownames(CTpct1to2xpovdf)
colnames(CTpct1to2xpovdf)<-c("Town", "Pct Population 1-2x FPL Level", "90% MoE")

write.csv(CTpct1to2xpovdf, "2013_CT_towns_Pct_Population_1to2xpov.csv", row.names=F)
