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

# Calculate pct per town
totallowinc1=apply(X=totallowinc[,c(2:7)], FUN=sum, MARGIN=2, agg.term="TotalLowInc")
pctlowinc=divide.acs(numerator=totallowinc1, denominator=totallowinc[,1], method="proportion")

# Fetch CT state data and calculate pct
CTtotallowinc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")
CTlowinc1=apply(X=CTtotallowinc[,c(2:7)], FUN=sum, MARGIN=2, agg.term="TotalLowInc")
CTpctlowinc=divide.acs(numerator=CTlowinc1, denominator=CTtotallowinc[,1], method="proportion")

CTpctlowinc<-rbind(CTpctlowinc, pctlowinc)

CTpctlowincdf<-data.frame(CTpctlowinc=estimate(CTpctlowinc), ME90=1.645*standard.error(CTpctlowinc))
CTpctlowincdf[,c(2:3)]<-CTpctlowincdf[,c(1:2)]
CTpctlowincdf[,1]<-rownames(CTpctlowincdf)
colnames(CTpctlowincdf)<-c("Town", "Pct Population below 200% FPL", "90% MoE")
CTpctlowincdf[,2]=CTpctlowincdf[,2]=round(CTpctlowincdf[,2],3)
CTpctlowincdf[,3]=CTpctlowincdf[,3]=round(CTpctlowincdf[,3],3)

write.csv(CTpctlowincdf, "2013_CT_towns_Pct_Population_LowInc.csv", row.names=F)
