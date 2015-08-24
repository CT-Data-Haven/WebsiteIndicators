library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

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

CTpctchild1to2xpov<-rbind(CTpctchild1to2xpov, pctchild1to2xpov)

CTpctchild1to2xpovdf<-data.frame(Totalchild1to2xpov=estimate(CTpctchild1to2xpov), ME90=1.645*standard.error(CTpctchild1to2xpov))
CTpctchild1to2xpovdf[,c(2:3)]<-CTpctchild1to2xpovdf[,c(1:2)]
CTpctchild1to2xpovdf[,1]<-rownames(CTpctchild1to2xpovdf)
colnames(CTpctchild1to2xpovdf)<-c("Town", "Pct Population Under 18 100-200% FPL", "90% MoE")

write.csv(CTpctchild1to2xpovdf, "2013_CT_towns_Pct_Child_Population_1to2FPL.csv", row.names=F)