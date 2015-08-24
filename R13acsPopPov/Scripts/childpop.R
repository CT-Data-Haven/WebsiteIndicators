library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalchildfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalchildfull)[,1]=str_replace(geography(totalchildfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalchild<-totalchildfull[c(2:79,81:95,97:123,125:173),]

# Calculate total children per town
towntotalchild=apply(X=totalchild[,c(3:6,27:30)], FUN=sum, MARGIN=2, agg.term="Totalchildren")
townpctchild=divide.acs(numerator=towntotalchild, denominator=totalchild[,1], method="proportion")

# Fetch CT state data and calculate total childpoverty
CTtotalchild<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01001", col.names="pretty")
CTchild<-apply(X=CTtotalchild[,c(3:6,27:30)], FUN=sum, MARGIN=2, agg.term="Totalchildren")

CTtotalchild<-rbind(CTchild,towntotalchild)

CTtotalchilddf<-data.frame(Totalchild=estimate(CTtotalchild), ME90=1.645*standard.error(CTtotalchild))
CTtotalchilddf[,c(2:3)]<-CTtotalchilddf[,c(1:2)]
CTtotalchilddf[,1]<-rownames(CTtotalchilddf)
colnames(CTtotalchilddf)<-c("Town", "Total Population Under 18", "90% MoE")
CTtotalchilddf[,3]=CTtotalchilddf[,3]=round(CTtotalchilddf[,3],0)

write.csv(CTtotalchilddf, "2013_CT_towns_Total_Child_Population.csv", row.names=F)