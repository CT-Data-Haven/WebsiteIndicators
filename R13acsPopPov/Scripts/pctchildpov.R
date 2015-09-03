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
townchild=apply(X=totalchildpoverty[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Totalchild")
pctchildpoverty=divide.acs(numerator=townchildpoverty, denominator=townchild, method="proportion")

# Fetch CT state data and calculate total childpoverty
CTtotalchildpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")
CTchild=apply(X=CTtotalchildpoverty[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Totalchild")
CTchildpoverty=apply(X=CTtotalchildpoverty[,c(3:5,16:18,29:31)], FUN=sum, MARGIN=2, agg.term="Totalchildpoverty")
CTpctchildpoverty=divide.acs(numerator=CTchildpoverty, denominator=CTchild, method="proportion")

CTpctchildpov<-rbind(CTpctchildpoverty, pctchildpoverty)

CTpctchildpovdf<-data.frame(Totalchildpoverty=estimate(CTpctchildpov), ME90=1.645*standard.error(CTpctchildpov))
CTpctchildpovdf[,c(2:3)]<-CTpctchildpovdf[,c(1:2)]
CTpctchildpovdf[,1]<-rownames(CTpctchildpovdf)
colnames(CTpctchildpovdf)<-c("Town", "Pct Population Under 18 below poverty Level", "90% MoE")
CTpctchildpovdf[,2]=CTpctchildpovdf[,2]=round(CTpctchildpovdf[,2],3)
CTpctchildpovdf[,3]=CTpctchildpovdf[,3]=round(CTpctchildpovdf[,3],3)

write.csv(CTpctchildpovdf, "2013_CT_towns_pct_Child_Population_inPoverty.csv", row.names=F)
