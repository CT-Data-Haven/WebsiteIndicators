library(acs)
library(stringr)
library(scales)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

# Connecticut counties
Fairfield.C=geo.make(state=9,county=01)
Hartford.C=geo.make(state=9,county=03)
Litchfield.C=geo.make(state=9,county=05)
Middlesex.C=geo.make(state=9,county=07)
New.Haven.C=geo.make(state=9,county=09)
New.London.C=geo.make(state=9,county=11)
Tolland.C=geo.make(state=9,county=13)
Windham.C=geo.make(state=9,county=15)

# Connecticut counties
Fairfield.C=geo.make(state=9,county=01)
Hartford.C=geo.make(state=9,county=03)
Litchfield.C=geo.make(state=9,county=05)
Middlesex.C=geo.make(state=9,county=07)
New.Haven.C=geo.make(state=9,county=09)
New.London.C=geo.make(state=9,county=11)
Tolland.C=geo.make(state=9,county=13)
Windham.C=geo.make(state=9,county=15)


# Fairfield County towns
Bethel=geo.make(state=9,county=01,county.subdivision=04720)
Bridgeport=geo.make(state=9,county=01,county.subdivision=08070)
Brookfield=geo.make(state=9,county=01,county.subdivision=08980)
Danbury=geo.make(state=9,county=01,county.subdivision=18500)
Darien=geo.make(state=9,county=01,county.subdivision=18850)
Easton=geo.make(state=9,county=01,county.subdivision=23890)
Fairfield.t=geo.make(state=9, county=01, county.subdivision=26620)
Greenwich=geo.make(state=9,county=01,county.subdivision=33620)
Monroe=geo.make(state=9,county=01,county.subdivision=48620)
New.Canaan=geo.make(state=9,county=01,county.subdivision=50580)
New.Fairfield=geo.make(state=9,county=01,county.subdivision=50860)
Newtown=geo.make(state=9,county=01,county.subdivision=52980)
Norwalk=geo.make(state=9,county=01,county.subdivision=56060)
Redding=geo.make(state=9,county=01,county.subdivision=63480)
Ridgefield=geo.make(state=9,county=01,county.subdivision=63970)
Shelton=geo.make(state=9,county=01,county.subdivision=68170)
Sherman=geo.make(state=9,county=01,county.subdivision=68310)
Stamford=geo.make(state=9,county=01,county.subdivision=73070)
Stratford=geo.make(state=9,county=01,county.subdivision=74190)
Trumbull=geo.make(state=9,county=01,county.subdivision=77200)
Weston=geo.make(state=9,county=01,county.subdivision=83430)
Westport=geo.make(state=9,county=01,county.subdivision=83500)
Wilton=geo.make(state=9,county=01,county.subdivision=86370)

# Hartford County Towns
Avon=geo.make(state=9,county=03,county.subdivision=02060)
Berlin=geo.make(state=9,county=03,county.subdivision=04300)
Bloomfield=geo.make(state=9,county=03,county.subdivision=05910)
Bristol=geo.make(state=9,county=03,county.subdivision=08490)
Burlington=geo.make(state=9,county=03,county.subdivision=10100)
Canton=geo.make(state=9,county=03,county.subdivision=12270)
East.Granby=geo.make(state=9,county=03,county.subdivision=22070)
East.Hartford=geo.make(state=9,county=03,county.subdivision=22630)
East.Windsor=geo.make(state=9,county=03,county.subdivision=24800)
Enfield=geo.make(state=9,county=03,county.subdivision=25990)
Farmington=geo.make(state=9,county=03,county.subdivision=27600)
Glastonbury=geo.make(state=9,county=03,county.subdivision=31240)
Granby=geo.make(state=9,county=03,county.subdivision=32640)
Hartford=geo.make(state=9,county=03,county.subdivision=37070)
Hartland=geo.make(state=9,county=03,county.subdivision=37140)
Manchester=geo.make(state=9,county=03,county.subdivision=44700)
Marlborough=geo.make(state=9,county=03,county.subdivision=45820)
New.Britain=geo.make(state=9,county=03,county.subdivision=50440)
Newington=geo.make(state=9,county=03,county.subdivision=52140)
Plainville=geo.make(state=9,county=03,county.subdivision=60120)
Rocky.Hill=geo.make(state=9,county=03,county.subdivision=65370)
Simsbury=geo.make(state=9,county=03,county.subdivision=68940)
Southington=geo.make(state=9,county=03,county.subdivision=70550)
South.Windsor=geo.make(state=9,county=03,county.subdivision=71390)
Suffield=geo.make(state=9,county=03,county.subdivision=74540)
West.Hartford=geo.make(state=9,county=03,county.subdivision=82590)
Wethersfield=geo.make(state=9,county=03,county.subdivision=84900)
Windsor=geo.make(state=9,county=03,county.subdivision=87000)
Windsor.Locks=geo.make(state=9,county=03,county.subdivision=87070)

# Litchfield County towns
Barkhamsted=geo.make(state=9,county=05,county.subdivision=02760)
Bethlehem=geo.make(state=9,county=05,county.subdivision=04930)
Bridgewater=geo.make(state=9,county=05,county.subdivision=08210)
Canaan=geo.make(state=9,county=05,county.subdivision=10940)
Colebrook=geo.make(state=9,county=05,county.subdivision=16050)
Cornwall=geo.make(state=9,county=05,county.subdivision=17240)
Goshen=geo.make(state=9,county=05,county.subdivision=32290)
Harwinton=geo.make(state=9,county=05,county.subdivision=37280)
Kent=geo.make(state=9,county=05,county.subdivision=40290)
Litchfield.t=geo.make(state=9,county=05,county.subdivision=43370)
Morris=geo.make(state=9,county=05,county.subdivision=49460)
New.Hartford=geo.make(state=9,county=05,county.subdivision=51350)
New.Milford=geo.make(state=9,county=05,county.subdivision=52630)
Norfolk=geo.make(state=9,county=05,county.subdivision=53470)
North.Canaan=geo.make(state=9,county=05,county.subdivision=54030)
Plymouth=geo.make(state=9,county=05,county.subdivision=60750)
Roxbury=geo.make(state=9,county=05,county.subdivision=65930)
Salisbury=geo.make(state=9,county=05,county.subdivision=66420)
Sharon=geo.make(state=9,county=05,county.subdivision=67960)
Thomaston=geo.make(state=9,county=05,county.subdivision=75730)
Torrington=geo.make(state=9,county=05,county.subdivision=76570)
Warren=geo.make(state=9,county=05,county.subdivision=79510)
Washington=geo.make(state=9,county=05,county.subdivision=79720)
Watertown=geo.make(state=9,county=05,county.subdivision=80490)
Winchester=geo.make(state=9,county=05,county.subdivision=86440)
Woodbury=geo.make(state=9,county=05,county.subdivision=87910)

# Middlesex Counties
Chester=geo.make(state=9,county=07,county.subdivision=14300)
Clinton=geo.make(state=9,county=07,county.subdivision=15350)
Cromwell=geo.make(state=9,county=07,county.subdivision=18080)
Deep.River=geo.make(state=9,county=07,county.subdivision=19130)
Durham=geo.make(state=9,county=07,county.subdivision=20810)
East.Haddam=geo.make(state=9,county=07,county.subdivision=22280)
East.Hampton=geo.make(state=9,county=07,county.subdivision=22490)
Essex=geo.make(state=9,county=07,county.subdivision=26270)
Haddam=geo.make(state=9,county=07,county.subdivision=35230)
Killingworth=geo.make(state=9,county=07,county.subdivision=40710)
Middlefield=geo.make(state=9,county=07,county.subdivision=47080)
Middletown=geo.make(state=9,county=07,county.subdivision=47360)
Old.Saybrook=geo.make(state=9,county=07,county.subdivision=57320)
Portland=geo.make(state=9,county=07,county.subdivision=61800)
Westbrook=geo.make(state=9,county=07,county.subdivision=81680)

#New Haven County towns
Ansonia=geo.make(state=9,county=09,county.subdivision=01220)
Beacon.Falls=geo.make(state=9,county=09,county.subdivision=03250)
Bethany=geo.make(state=9,county=09,county.subdivision=04580)
Branford=geo.make(state=9,county=09,county.subdivision=07310)
Cheshire=geo.make(state=9,county=09,county.subdivision=14160)
Derby=geo.make(state=9,county=09,county.subdivision=19550)
East.Haven=geo.make(state=9,county=09,county.subdivision=22910)
Guilford=geo.make(state=9,county=09,county.subdivision=34950)
Hamden=geo.make(state=9,county=09,county.subdivision=35650)
Madison=geo.make(state=9,county=09,county.subdivision=44560)
Meriden=geo.make(state=9,county=09,county.subdivision=46520)
Middlebury=geo.make(state=9,county=09,county.subdivision=46940)
Milford=geo.make(state=9,county=09,county.subdivision=47535)
Naugatuck=geo.make(state=9,county=09,county.subdivision=49950)
New.Haven.t=geo.make(state=9,county=09,county.subdivision=52070)
North.Branford=geo.make(state=9,county=09,county.subdivision=53890)
North.Haven=geo.make(state=9,county=09,county.subdivision=54870)
Orange=geo.make(state=9,county=09,county.subdivision=57600)
Oxford=geo.make(state=9,county=09,county.subdivision=58300)
Prospect=geo.make(state=9,county=09,county.subdivision=62290)
Seymour=geo.make(state=9,county=09,county.subdivision=67610)
Southbury=geo.make(state=9,county=09,county.subdivision=69640)
Wallingford=geo.make(state=9,county=09,county.subdivision=78740)
Waterbury=geo.make(state=9,county=09,county.subdivision=80070)
West.Haven=geo.make(state=9,county=09,county.subdivision=82870)
Wolcott=geo.make(state=9,county=09,county.subdivision=87560)
Woodbridge=geo.make(state=9,county=09,county.subdivision=87700)

# New London County towns
Bozrah=geo.make(state=9,county=11,county.subdivision=06820)
Colchester=geo.make(state=9,county=11,county.subdivision=15910)
East.Lyme=geo.make(state=9,county=11,county.subdivision=23400)
Franklin=geo.make(state=9,county=11,county.subdivision=29910)
Griswold=geo.make(state=9,county=11,county.subdivision=33900)
Groton=geo.make(state=9,county=11,county.subdivision=34250)
Lebanon=geo.make(state=9,county=11,county.subdivision=42390)
Ledyard=geo.make(state=9,county=11,county.subdivision=42600)
Lisbon=geo.make(state=9,county=11,county.subdivision=43230)
Lyme=geo.make(state=9,county=11,county.subdivision=44210)
Montville=geo.make(state=9,county=11,county.subdivision=48900)
New.London.t=geo.make(state=9,county=11,county.subdivision=52350)
North.Stonington=geo.make(state=9,county=11,county.subdivision=55500)
Norwich=geo.make(state=9,county=11,county.subdivision=56270)
Old.Lyme=geo.make(state=9,county=11,county.subdivision=57040)
Preston=geo.make(state=9,county=11,county.subdivision=62150)
Salem=geo.make(state=9,county=11,county.subdivision=66210)
Sprague=geo.make(state=9,county=11,county.subdivision=71670)
Stonington=geo.make(state=9,county=11,county.subdivision=73770)
Voluntown=geo.make(state=9,county=11,county.subdivision=78600)
Waterford=geo.make(state=9,county=11,county.subdivision=80280)

# Tolland County towns
Andover=geo.make(state=9,county=13,county.subdivision=01080)
Bolton=geo.make(state=9,county=13,county.subdivision=06260)
Columbia=geo.make(state=9,county=13,county.subdivision=16400)
Coventry=geo.make(state=9,county=13,county.subdivision=17800)
Ellington=geo.make(state=9,county=13,county.subdivision=25360)
Hebron=geo.make(state=9,county=13,county.subdivision=37910)
Mansfield=geo.make(state=9,county=13,county.subdivision=44910)
Somers=geo.make(state=9,county=13,county.subdivision=69220)
Stafford=geo.make(state=9,county=13,county.subdivision=72090)
Tolland.t=geo.make(state=9,county=13,county.subdivision=76290)
Union=geo.make(state=9,county=13,county.subdivision=77830)
Vernon=geo.make(state=9,county=13,county.subdivision=78250)
Willington=geo.make(state=9,county=13,county.subdivision=85950)

# Windham County towns
Ashford=geo.make(state=9,county=15,county.subdivision=01430)
Brooklyn=geo.make(state=9,county=15,county.subdivision=09190)
Canterbury=geo.make(state=9,county=15,county.subdivision=12130)
Chaplin=geo.make(state=9,county=15,county.subdivision=13810)
Eastford=geo.make(state=9,county=15,county.subdivision=21860)
Hampton=geo.make(state=9,county=15,county.subdivision=36000)
Killingly=geo.make(state=9,county=15,county.subdivision=40500)
Plainfield=geo.make(state=9,county=15,county.subdivision=59980)
Pomfret=geo.make(state=9,county=15,county.subdivision=61030)
Putnam=geo.make(state=9,county=15,county.subdivision=62710)
Scotland=geo.make(state=9,county=15,county.subdivision=67400)
Sterling=geo.make(state=9,county=15,county.subdivision=73420)
Thompson=geo.make(state=9,county=15,county.subdivision=75870)
Windham=geo.make(state=9,county=15,county.subdivision=86790)
Woodstock=geo.make(state=9,county=15,county.subdivision=88190)

# Regions
GNH=Milford+Orange+Woodbridge+Bethany+Hamden+New.Haven.t+West.Haven+East.Haven+North.Haven+North.Branford+Branford+Guilford+Madison
combine(GNH)=T
combine.term(GNH)="GNH"

GWB=Oxford+Beacon.Falls+Naugatuck+Prospect+Cheshire+Wolcott+Waterbury+Middlebury+Southbury+Woodbury+Watertown+Thomaston+Bethlehem
combine(GWB)=T
combine.term(GWB)="GWB"


Valley=Ansonia+Beacon.Falls+Derby+Naugatuck+Oxford+Seymour+Shelton
combine(Valley)=T
combine.term(Valley)="Valley"

Valley.towns=Ansonia+Beacon.Falls+Derby+Naugatuck+Oxford+Seymour+Shelton


# Total Population

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalpopfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01003", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalpopfull)[,1]=str_replace(geography(totalpopfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
totalpop<-totalpopfull[c(2:79,81:95,97:123,125:173),]


# MUST DO THIS WITH EACH INDICATOR !!!!!!
CTtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01003", col.names="pretty")
GNHtotalpop<-acs.fetch(2013, 5, geography=GNH, table.number="B01003", col.names="pretty")
GWBtotalpop<-acs.fetch(2013, 5, geography=GWB, table.number="B01003", col.names="pretty")
Valleytotalpop<-acs.fetch(2013, 5, geography=Valley, table.number="B01003", col.names="pretty")
FCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B01003", col.names="pretty")
HCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B01003", col.names="pretty")
LCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B01003", col.names="pretty")
MCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B01003", col.names="pretty")
NHCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B01003", col.names="pretty")
NLCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B01003", col.names="pretty")
TCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B01003", col.names="pretty")
WCtotalpop<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B01003", col.names="pretty")


regionA <- rbind(CTtotalpop, GNHtotalpop)
regionB <- rbind(GWBtotalpop, Valleytotalpop)
regionC <- rbind(FCtotalpop, HCtotalpop)
regionD <- rbind(LCtotalpop, MCtotalpop)
regionE <- rbind(NHCtotalpop, NLCtotalpop)
regionF <- rbind(TCtotalpop, WCtotalpop)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

CTtotalpopA<-rbind(regionAAAA, totalpop)




# Total Population 18 and under or 65 and over

# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTPopAge<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01001", col.names="pretty")

# fetch ACS town data
PopAgefull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(PopAgefull)[,1]=str_replace(geography(PopAgefull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
PopAge<-PopAgefull[c(2:79,81:95,97:123,125:173),]

CTAge<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01001", col.names="pretty")
GNHAge<-acs.fetch(2013, 5, geography=GNH, table.number="B01001", col.names="pretty")
GWBAge<-acs.fetch(2013, 5, geography=GWB, table.number="B01001", col.names="pretty")
ValleyAge<-acs.fetch(2013, 5, geography=Valley, table.number="B01001", col.names="pretty")
FCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B01001", col.names="pretty")
HCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B01001", col.names="pretty")
LCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B01001", col.names="pretty")
MCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B01001", col.names="pretty")
NHCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B01001", col.names="pretty")
NLCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B01001", col.names="pretty")
TCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B01001", col.names="pretty")
WCAge<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B01001", col.names="pretty")


regionA <- rbind(CTPopAge, GNHAge)
regionB <- rbind(GWBAge, ValleyAge)
regionC <- rbind(FCAge, HCAge)
regionD <- rbind(LCAge, MCAge)
regionE <- rbind(NHCAge, NLCAge)
regionF <- rbind(TCAge, WCAge)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

allPopAge<-rbind(regionAAAA, PopAge)


# Calculate population per age group per town
age0to17A=apply(X=allPopAge[,c(3:6,27:30)], FUN=sum, MARGIN=2, agg.term="age0to17")
age65plusA=apply(X=allPopAge[,c(20:25,44:49)], FUN=sum, MARGIN=2, agg.term="age65plus")

# Calculate pct of population per age group per town
PctAge0to17A=divide.acs(numerator=age0to17A, denominator=allPopAge[,1], method="proportion")
PctAge65plusA=divide.acs(numerator=age65plusA, denominator=allPopAge[,1], method="proportion")


# Population by Race

# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTPopRace<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B03002", col.names="pretty")

# fetch ACS town data
PopRacefull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B03002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(PopRacefull)[,1]=str_replace(geography(PopRacefull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
PopRace<-PopRacefull[c(2:79,81:95,97:123,125:173),]


GNHRace<-acs.fetch(2013, 5, geography=GNH, table.number="B03002", col.names="pretty")
GWBRace<-acs.fetch(2013, 5, geography=GWB, table.number="B03002", col.names="pretty")
ValleyRace<-acs.fetch(2013, 5, geography=Valley, table.number="B03002", col.names="pretty")
FCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B03002", col.names="pretty")
HCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B03002", col.names="pretty")
LCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B03002", col.names="pretty")
MCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B03002", col.names="pretty")
NHCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B03002", col.names="pretty")
NLCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B03002", col.names="pretty")
TCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B03002", col.names="pretty")
WCRace<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B03002", col.names="pretty")


regionA <- rbind(CTPopRace, GNHRace)
regionB <- rbind(GWBRace, ValleyRace)
regionC <- rbind(FCRace, HCRace)
regionD <- rbind(LCRace, MCRace)
regionE <- rbind(NHCRace, NLCRace)
regionF <- rbind(TCRace, WCRace)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
allPopRace<-rbind(regionAAAA, PopRace)

# Calculate population per age group per town
WhiteNoHspA=apply(X=allPopRace[,3], FUN=sum, MARGIN=2, agg.term="WhiteNoHsp")
BlackA=apply(X=allPopRace[,4], FUN=sum, MARGIN=2, agg.term="Black")
HspA=apply(X=allPopRace[,c(12)], FUN=sum, MARGIN=2, agg.term="Hsp")
OtherRaceA=apply(X=allPopRace[,c(5:9)], FUN=sum, MARGIN=2, agg.term="OtherRace")

# Calculate pct of population per age group per town
PctWhiteNoHspA=divide.acs(numerator=WhiteNoHspA, denominator=allPopRace[,1], method="proportion")
PctBlackA=divide.acs(numerator=BlackA, denominator=allPopRace[,1], method="proportion")
PctHspA=divide.acs(numerator=HspA, denominator=allPopRace[,1], method="proportion")
PctOtherRaceA=divide.acs(numerator=OtherRaceA, denominator=allPopRace[,1], method="proportion")



# Homeownership
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTtenure<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B25003", col.names="pretty")

# fetch ACS town data
towntenurefull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B25003", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(towntenurefull)[,1]=str_replace(geography(towntenurefull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
towntenure<-towntenurefull[c(2:79,81:95,97:123,125:173),]


GNHtenure<-acs.fetch(2013, 5, geography=GNH, table.number="B25003", col.names="pretty")
GWBtenure<-acs.fetch(2013, 5, geography=GWB, table.number="B25003", col.names="pretty")
Valleytenure<-acs.fetch(2013, 5, geography=Valley, table.number="B25003", col.names="pretty")
FCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B25003", col.names="pretty")
HCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B25003", col.names="pretty")
LCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B25003", col.names="pretty")
MCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B25003", col.names="pretty")
NHCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B25003", col.names="pretty")
NLCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B25003", col.names="pretty")
TCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B25003", col.names="pretty")
WCtenure<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B25003", col.names="pretty")


regionA <- rbind(CTtenure, GNHtenure)
regionB <- rbind(GWBtenure, Valleytenure)
regionC <- rbind(FCtenure, HCtenure)
regionD <- rbind(LCtenure, MCtenure)
regionE <- rbind(NHCtenure, NLCtenure)
regionF <- rbind(TCtenure, WCtenure)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
alltenure<-rbind(regionAAAA, towntenure)

# Calculate population per age group per town
TenureHouseholdsA=apply(X=alltenure[,c(1)], FUN=sum, MARGIN=2, agg.term="Households")
TenureOwnA=apply(X=alltenure[,c(2)], FUN=sum, MARGIN=2, agg.term="Owning Household")
PctTenureOwnA=divide.acs(numerator=TenureOwnA, denominator=alltenure[,1], method="proportion")



# INSERT  HOMEOWNERS WITH CAR

# INSERT COST-BURDENED (UNIVERSE MAY BE DIFFERENT THAN HOUSEHOLDS IF WE CANNOT REPORT MARGIN OF ERROR FOR ALL HOUSEHOLDS)




# Foreign Born
library(acs)
library(stringr)
api.key.install(key="61a6ec2a084f67119446589d66b12b702106746b")

# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
towncitizenshipfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B05001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(towncitizenshipfull)[,1]=str_replace(geography(towncitizenshipfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
towncitizenship<-towncitizenshipfull[c(2:79,81:95,97:123,125:173),]

# Fetch CT state data and calculate pct 
CTcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B05001", col.names="pretty")

GNHcitizenship<-acs.fetch(2013, 5, geography=GNH, table.number="B05001", col.names="pretty")
GWBcitizenship<-acs.fetch(2013, 5, geography=GWB, table.number="B05001", col.names="pretty")
Valleycitizenship<-acs.fetch(2013, 5, geography=Valley, table.number="B05001", col.names="pretty")
FCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B05001", col.names="pretty")
HCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B05001", col.names="pretty")
LCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B05001", col.names="pretty")
MCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B05001", col.names="pretty")
NHCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B05001", col.names="pretty")
NLCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B05001", col.names="pretty")
TCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B05001", col.names="pretty")
WCcitizenship<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B05001", col.names="pretty")


regionA <- rbind(CTcitizenship, GNHcitizenship)
regionB <- rbind(GWBcitizenship, Valleycitizenship)
regionC <- rbind(FCcitizenship, HCcitizenship)
regionD <- rbind(LCcitizenship, MCcitizenship)
regionE <- rbind(NHCcitizenship, NLCcitizenship)
regionF <- rbind(TCcitizenship, WCcitizenship)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
allcitizenship<-rbind(regionAAAA, towncitizenship)


# Calculate population per citizenship group per town
ForeignA=apply(X=allcitizenship[,c(5:6)], FUN=sum, MARGIN=2, agg.term="Foreign Born")
AllPctForeignA=divide.acs(numerator=ForeignA, denominator=allcitizenship[,1], method="proportion")



# Gender
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTsex<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B01001", col.names="pretty")

# fetch ACS town data
townsexfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B01001", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(townsexfull)[,1]=str_replace(geography(townsexfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
townsex<-townsexfull[c(2:79,81:95,97:123,125:173),]

GNHsex<-acs.fetch(2013, 5, geography=GNH, table.number="B01001", col.names="pretty")
GWBsex<-acs.fetch(2013, 5, geography=GWB, table.number="B01001", col.names="pretty")
Valleysex<-acs.fetch(2013, 5, geography=Valley, table.number="B01001", col.names="pretty")
FCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B01001", col.names="pretty")
HCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B01001", col.names="pretty")
LCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B01001", col.names="pretty")
MCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B01001", col.names="pretty")
NHCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B01001", col.names="pretty")
NLCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B01001", col.names="pretty")
TCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B01001", col.names="pretty")
WCsex<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B01001", col.names="pretty")


regionA <- rbind(CTsex, GNHsex)
regionB <- rbind(GWBsex, Valleysex)
regionC <- rbind(FCsex, HCsex)
regionD <- rbind(LCsex, MCsex)
regionE <- rbind(NHCsex, NLCsex)
regionF <- rbind(TCsex, WCsex)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
allsex<-rbind(regionAAAA, townsex)


# Calculate population per age group per town
Totalsex=apply(X=allsex[,c(1)], FUN=sum, MARGIN=2, agg.term="Total Population")
MaleA=apply(X=allsex[,c(2)], FUN=sum, MARGIN=2, agg.term="Male")
FemaleA=apply(X=allsex[,c(26)], FUN=sum, MARGIN=2, agg.term="Female")


# Calculate pct of population per age group per town
PctMaleA=divide.acs(numerator=MaleA, denominator=Totalsex, method="proportion")
PctFemaleA=divide.acs(numerator=FemaleA, denominator=Totalsex, method="proportion")



# Educational Attainment
# fetch ACS data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
edattainfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B06009", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(edattainfull)[,1]=str_replace(geography(towncitizenshipfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
edattain<-edattainfull[c(2:79,81:95,97:123,125:173),]

# Fetch CT state data and calculate pct 
CTedattain<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B06009", col.names="pretty")

GNHedattain<-acs.fetch(2013, 5, geography=GNH, table.number="B06009", col.names="pretty")
GWBedattain<-acs.fetch(2013, 5, geography=GWB, table.number="B06009", col.names="pretty")
Valleyedattain<-acs.fetch(2013, 5, geography=Valley, table.number="B06009", col.names="pretty")
FCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B06009", col.names="pretty")
HCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B06009", col.names="pretty")
LCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B06009", col.names="pretty")
MCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B06009", col.names="pretty")
NHCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B06009", col.names="pretty")
NLCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B06009", col.names="pretty")
TCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B06009", col.names="pretty")
WCedattain<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B06009", col.names="pretty")


regionA <- rbind(CTedattain, GNHedattain)
regionB <- rbind(GWBedattain, Valleyedattain)
regionC <- rbind(FCedattain, HCedattain)
regionD <- rbind(LCedattain, MCedattain)
regionE <- rbind(NHCedattain, NLCedattain)
regionF <- rbind(TCedattain, WCedattain)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
allEdattain<-rbind(regionAAAA, edattain)




# Calculate population per citizenship group per town
Adults25plusA=apply(X=allEdattain[,c(1)], FUN=sum, MARGIN=2, agg.term="No HS degree")
NoHSA=apply(X=allEdattain[,c(2)], FUN=sum, MARGIN=2, agg.term="No HS degree")
BachPlusA=apply(X=allEdattain[,c(5:6)], FUN=sum, MARGIN=2, agg.term="At least Bachelor's degree")

# Calculate pct per town
AdultPctNoHSA=divide.acs(numerator=NoHSA, denominator=allEdattain[,1], method="proportion")
AdultPctBachPlusA=divide.acs(numerator=BachPlusA, denominator=allEdattain[,1], method="proportion")




# Median Income
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CTmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B19013", col.names="pretty")

# fetch ACS town data
townmedianincfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B19013", col.names="pretty")


# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(townmedianincfull)[,1]=str_replace(geography(townmedianincfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
townmedianinc<-townmedianincfull[c(2:79,81:95,97:123,125:173),]

FCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B19013", col.names="pretty")
HCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B19013", col.names="pretty")
LCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B19013", col.names="pretty")
MCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B19013", col.names="pretty")
NHCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B19013", col.names="pretty")
NLCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B19013", col.names="pretty")
TCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B19013", col.names="pretty")
WCmedianinc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B19013", col.names="pretty")


regionA <- rbind(CTmedianinc, FCmedianinc)
regionB <- rbind(HCmedianinc, LCmedianinc)
regionC <- rbind(MCmedianinc, NHCmedianinc)
regionD <- rbind(NLCmedianinc,TCmedianinc)
regionE <- WCmedianinc


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- regionE

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
allmedianinc<-rbind(regionAAAA, townmedianinc)






# TOTAL POVERTY

# fetch ACS data
CTpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")

# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
totalpovertyfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="C17002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(totalpovertyfull)[,1]=str_replace(geography(totalpovertyfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
townpoverty<-totalpovertyfull[c(2:79,81:95,97:123,125:173),]

GNHpoverty<-acs.fetch(2013, 5, geography=GNH, table.number="C17002", col.names="pretty")
GWBpoverty<-acs.fetch(2013, 5, geography=GWB, table.number="C17002", col.names="pretty")
Valleypoverty<-acs.fetch(2013, 5, geography=Valley, table.number="C17002", col.names="pretty")
FCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="C17002", col.names="pretty")
HCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="C17002", col.names="pretty")
LCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="C17002", col.names="pretty")
MCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="C17002", col.names="pretty")
NHCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="C17002", col.names="pretty")
NLCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="C17002", col.names="pretty")
TCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="C17002", col.names="pretty")
WCpoverty<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="C17002", col.names="pretty")



regionA <- rbind(CTpoverty, GNHpoverty)
regionB <- rbind(GWBpoverty, Valleypoverty)
regionC <- rbind(FCpoverty, HCpoverty)
regionD <- rbind(LCpoverty, MCpoverty)
regionE <- rbind(NHCpoverty, NLCpoverty)
regionF <- rbind(TCpoverty, WCpoverty)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
allpoverty<-rbind(regionAAAA, townpoverty)

# Calculate total poverty per town
CTtotalpovA=apply(X=allpoverty[,c(2:3)], FUN=sum, MARGIN=2, agg.term="TotalPoverty")
CTpctpovA=divide.acs(numerator=CTtotalpovA, denominator=allpoverty[,1], method="proportion")
PovstatusA=apply(X=allpoverty[,c(1)], FUN=sum, MARGIN=2, agg.term="Total, Poverty status determined")





# TOTAL "LOW INC NOT POVERTY" - 1 to 2x FPL

# fetch ACS data
CT2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="C17002", col.names="pretty")

# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
total2xpovfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="C17002", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(total2xpovfull)[,1]=str_replace(geography(total2xpovfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
total2xpov<-total2xpovfull[c(2:79,81:95,97:123,125:173),]

GNH2xpov<-acs.fetch(2013, 5, geography=GNH, table.number="C17002", col.names="pretty")
GWB2xpov<-acs.fetch(2013, 5, geography=GWB, table.number="C17002", col.names="pretty")
Valley2xpov<-acs.fetch(2013, 5, geography=Valley, table.number="C17002", col.names="pretty")
FC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="C17002", col.names="pretty")
HC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="C17002", col.names="pretty")
LC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="C17002", col.names="pretty")
MC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="C17002", col.names="pretty")
NHC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="C17002", col.names="pretty")
NLC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="C17002", col.names="pretty")
TC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="C17002", col.names="pretty")
WC2xpov<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="C17002", col.names="pretty")

regionA <- rbind(CT2xpov, GNH2xpov)
regionB <- rbind(GWB2xpov, Valley2xpov)
regionC <- rbind(FC2xpov, HC2xpov)
regionD <- rbind(LC2xpov, MC2xpov)
regionE <- rbind(NHC2xpov, NLC2xpov)
regionF <- rbind(TC2xpov, WC2xpov)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
all2xpov<-rbind(regionAAAA, total2xpov)


# Calculate total 2xpov per town
CTtotal1to2xpovA=apply(X=all2xpov[,c(4:7)], FUN=sum, MARGIN=2, agg.term="Total2xpov")
CTpct1to2xpovA=divide.acs(numerator=CTtotal1to2xpovA, denominator=all2xpov[,1], method="proportion")







# CHILD POPULATION IN POVERTY



# In Poverty and Low Income, 0 to 17
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CT18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")

# fetch ACS town data
town18Incfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(town18Incfull)[,1]=str_replace(geography(town18Incfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
town18Inc<-town18Incfull[c(2:79,81:95,97:123,125:173),]


GNH18Inc<-acs.fetch(2013, 5, geography=GNH, table.number="B17024", col.names="pretty")
GWB18Inc<-acs.fetch(2013, 5, geography=GWB, table.number="B17024", col.names="pretty")
Valley18Inc<-acs.fetch(2013, 5, geography=Valley, table.number="B17024", col.names="pretty")
FC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B17024", col.names="pretty")
HC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B17024", col.names="pretty")
LC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B17024", col.names="pretty")
MC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B17024", col.names="pretty")
NHC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B17024", col.names="pretty")
NLC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B17024", col.names="pretty")
TC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B17024", col.names="pretty")
WC18Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B17024", col.names="pretty")

regionA <- rbind(CT18Inc, GNH18Inc)
regionB <- rbind(GWB18Inc, Valley18Inc)
regionC <- rbind(FC18Inc, HC18Inc)
regionD <- rbind(LC18Inc, MC18Inc)
regionE <- rbind(NHC18Inc, NLC18Inc)
regionF <- rbind(TC18Inc, WC18Inc)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
all18Inc<-rbind(regionAAAA, total18Inc)

# Merge town and CT data
all18inc<-rbind(CT18Inc, town18Inc)


# Calculate population per age group per town
plus18A <-apply(X=all18inc[,c(2,15,28)], FUN=sum, MARGIN=2, agg.term="Undre 18")
pov18A=apply(X=all18inc[,c(3:5,16:18,29:31)], FUN=sum, MARGIN=2, agg.term="Poverty Under 18")
lowinc18A=apply(X=all18inc[,c(3:10,16:23,29:36)], FUN=sum, MARGIN=2, agg.term="Low Income Under 18")



# Calculate pct of population per age group per town
Pct18plusPovertyA=divide.acs(numerator=pov18A, denominator=plus18A, method="proportion")
Pct18plusLowincA=divide.acs(numerator=lowinc18A, denominator=plus18A, method="proportion")










# In Poverty and Low Income, 65 and older
# fetch ACS CT data
# table name full = acs.fetch(endyear, 5, geography=geomake(state=9,county="*",county.subdivision="*"), table.number="XXX", col.names="pretty")
CT65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9), table.number="B17024", col.names="pretty")

# fetch ACS town data
town65Incfull<-acs.fetch(2013, 5, geography=geo.make(state=9,county="*",county.subdivision="*"), table.number="B17024", col.names="pretty")

# shorten town names
# geography(table name full)[,1]=str_replace(geography(table name full)[,1]," town.*","")
geography(town65Incfull)[,1]=str_replace(geography(town65Incfull)[,1]," town.*","")

# delete county subdivisions undefined
# table name = table name full[c(2:79,81:95,97:123,125:173),]
town65Inc<-town65Incfull[c(2:79,81:95,97:123,125:173),]

GNH65Inc<-acs.fetch(2013, 5, geography=GNH, table.number="B17024", col.names="pretty")
GWB65Inc<-acs.fetch(2013, 5, geography=GWB, table.number="B17024", col.names="pretty")
Valley65Inc<-acs.fetch(2013, 5, geography=Valley, table.number="B17024", col.names="pretty")
FC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=1), table.number="B17024", col.names="pretty")
HC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=3), table.number="B17024", col.names="pretty")
LC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=5), table.number="B17024", col.names="pretty")
MC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=7), table.number="B17024", col.names="pretty")
NHC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=9), table.number="B17024", col.names="pretty")
NLC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=11), table.number="B17024", col.names="pretty")
TC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=13), table.number="B17024", col.names="pretty")
WC65Inc<-acs.fetch(2013, 5, geography=geo.make(state=9, county=15), table.number="B17024", col.names="pretty")

regionA <- rbind(CT65Inc, GNH65Inc)
regionB <- rbind(GWB65Inc, Valley65Inc)
regionC <- rbind(FC65Inc, HC65Inc)
regionD <- rbind(LC65Inc, MC65Inc)
regionE <- rbind(NHC65Inc, NLC65Inc)
regionF <- rbind(TC65Inc, WC65Inc)


regionAA <- rbind(regionA, regionB)
regionBB <- rbind(regionC, regionD)
regionCC <- rbind(regionE, regionF)

regionAAA <-rbind(regionAA, regionBB)

regionAAAA <-rbind(regionAAA,regionCC)

# Merge town and CT data
all65Inc<-rbind(regionAAAA, town65Inc)

all65inc <- all65Incexpand[,c(106:131)]

# Calculate population per age group per town
plus65A <-apply(X=all65inc[,c(1,14)], FUN=sum, MARGIN=2, agg.term="65 and over")
pov65A=apply(X=all65inc[,c(2:4,15:17)], FUN=sum, MARGIN=2, agg.term="Poverty 65 and over")
lowinc65A=apply(X=all65inc[,c(2:9,15:22)], FUN=sum, MARGIN=2, agg.term="Low Income 65 and over")



# Calculate pct of population per age group per town
Pct65plusPovertyA=divide.acs(numerator=pov65A, denominator=plus65A, method="proportion")
Pct65plusLowincA=divide.acs(numerator=lowinc65A, denominator=plus65A, method="proportion")









# Merge Data Frames !!!

allA <- CTtotalpopA
allB <- cbind.acs(age0to17A,PctAge0to17A)
allC <- cbind.acs(age65plusA, PctAge65plusA)
allD <- cbind.acs(MaleA, PctMaleA)
allE <- cbind.acs(FemaleA, PctFemaleA)
allF <- cbind.acs(HspA, PctHspA)
allG <- cbind.acs(WhiteNoHspA, PctWhiteNoHspA)
allH <- cbind.acs(BlackA, PctBlackA)
allI <- cbind.acs(OtherRaceA, PctOtherRaceA)
allJ <- cbind.acs(ForeignA, AllPctForeignA)
allK <- cbind.acs(TenureHouseholdsA, TenureOwnA)
allL <- cbind.acs(PctTenureOwnA, Adults25plusA)
allM <- cbind.acs(NoHSA, AdultPctNoHSA)
allN <- cbind.acs(BachPlusA, AdultPctBachPlusA)
allO <- cbind.acs(medianincA, PovstatusA)
allP <- cbind.acs(CTtotalpovA, CTpctpovA)
allQ <- cbind.acs(CTtotal1to2xpovA, CTpct1to2xpovA)
allR <- cbind.acs(plus18A,pov18A)
allS <- cbind.acs(Pct18plusPovertyA, lowinc18A)
allT <- cbind.acs(Pct18plusLowincA, plus65A)
allU <- cbind.acs(pov65A, Pct65plusPovertyA)
allV <- cbind.acs(lowinc65A,Pct65plusLowincA)

allA1 <- cbind.acs(allA, allB)
allB1 <- cbind.acs(allC, allD)
allC1 <- cbind.acs(allE, allF)
allD1 <- cbind.acs(allG, allH)
allE1 <- cbind.acs(allI, allJ)
allF1 <- cbind.acs(allK, allL)
allG1 <- cbind.acs(allM, allN)
allH1 <- cbind.acs(allO, allP)
allI1 <- cbind.acs(allQ, allR)
allJ1 <- cbind.acs(allS, allT)
allK1 <- cbind.acs(allU, allV)

allA2 <- cbind.acs(allA1, allB1)
allB2 <- cbind.acs(allC1, allD1)
allC2 <- cbind.acs(allE1, allF1)
allD2 <- cbind.acs(allG1, allH1)
allE2 <- cbind.acs(allI1, allJ1)
allF2 <- allK1

allA4 <- cbind.acs(allA2, allB2)
allB4 <- cbind.acs(allC2, allD2)
allC4 <- cbind.acs(allE2, allF2)

allA5 <- cbind.acs(allA4, allB4)
allB5 <- allC4

# All data combined
allA3 <-cbind.acs(allA5,allB5)

# Separate Estimates and Margins of Error
townprofiledf<-data.frame(estimate(allA3[,1]), 1.645*standard.error(allA3[,1]), estimate(allA3[,2]), 1.645*standard.error(allA3[,2]), estimate(allA3[,3]), 1.645*standard.error(allA3[,3]), estimate(allA3[,4]), 1.645*standard.error(allA3[,4]), estimate(allA3[,5]), 1.645*standard.error(allA3[,5]), estimate(allA3[,6]), 1.645*standard.error(allA3[,6]), estimate(allA3[,7]), 1.645*standard.error(allA3[,7]), estimate(allA3[,8]), 1.645*standard.error(allA3[,8]), estimate(allA3[,9]), 1.645*standard.error(allA3[,9]), estimate(allA3[,10]), 1.645*standard.error(allA3[,10]), estimate(allA3[,11]), 1.645*standard.error(allA3[,11]), estimate(allA3[,12]), 1.645*standard.error(allA3[,12]), estimate(allA3[,13]), 1.645*standard.error(allA3[,13]), estimate(allA3[,14]), 1.645*standard.error(allA3[,14]), estimate(allA3[,15]), 1.645*standard.error(allA3[,15]), estimate(allA3[,16]), 1.645*standard.error(allA3[,16]), estimate(allA3[,17]), 1.645*standard.error(allA3[,17]), estimate(allA3[,18]), 1.645*standard.error(allA3[,18]), estimate(allA3[,19]), 1.645*standard.error(allA3[,19]), estimate(allA3[,20]), 1.645*standard.error(allA3[,20]), estimate(allA3[,21]), 1.645*standard.error(allA3[,21]), estimate(allA3[,22]), 1.645*standard.error(allA3[,22]), estimate(allA3[,23]), 1.645*standard.error(allA3[,23]), estimate(allA3[,24]), 1.645*standard.error(allA3[,24]), estimate(allA3[,25]), 1.645*standard.error(allA3[,25]), estimate(allA3[,26]), 1.645*standard.error(allA3[,26]), estimate(allA3[,27]), 1.645*standard.error(allA3[,27]), estimate(allA3[,28]), 1.645*standard.error(allA3[,28]), estimate(allA3[,29]), 1.645*standard.error(allA3[,29]), estimate(allA3[,30]), 1.645*standard.error(allA3[,30]), estimate(allA3[,31]), 1.645*standard.error(allA3[,31]), estimate(allA3[,32]), 1.645*standard.error(allA3[,32]), estimate(allA3[,33]), 1.645*standard.error(allA3[,33]), estimate(allA3[,34]), 1.645*standard.error(allA3[,34]), estimate(allA3[,35]), 1.645*standard.error(allA3[,35]), estimate(allA3[,36]), 1.645*standard.error(allA3[,36]), estimate(allA3[,37]), 1.645*standard.error(allA3[,37]), estimate(allA3[,38]), 1.645*standard.error(allA3[,38]), estimate(allA3[,39]), 1.645*standard.error(allA3[,39]), estimate(allA3[,40]), 1.645*standard.error(allA3[,40]), estimate(allA3[,41]), 1.645*standard.error(allA3[,41]), estimate(allA3[,42]), 1.645*standard.error(allA3[,42]), estimate(allA3[,43]), 1.645*standard.error(allA3[,43]))
townprofiledf[,c(2:87)]<-townprofiledf[,c(1:86)]
townprofiledf[,1]<-rownames(townprofiledf)
colnames(townprofiledf)<-c("Town", "Total Population", "MoE Total Population", "Population Ages 0-17", "MoE Population Ages 0-17", "% of Total Population, Ages 0-17", "MoE % of Total Population, Ages 0-17", "Population Ages 65+", "MoE Population Ages 65+", "% of Total Population, Ages 65+", "MoE % of Total Population, Ages 65+", "Population Male", "MoE Population Male", "% of Total Population, Male", "MoE % of Total Population, Male", "Population Female", "MoE Population Female", "% of Total Population, Female", "MoE % of Total Population, Female", "Hispanic Population", "MoE Hispanic Population", "% of Total Population, Hispanic", "MoE % of Total Population, Hispanic", "White Non-Hispanic Population", "MoE White Non-Hispanic Population", "% of Total Population, White Non-Hispanic", "MoE % of Total Population, White Non-Hispanic", "Black Non-Hispanic Population", "MoE Black Non-Hispanic Population", "% of Total Population, Black Non-Hispanic", "MoE % of Total Population, Black Non-Hispanic", "Other Race Non-Hispanic Population", "MoE Other Race Non-Hispanic Population", "% of Total Population, Other Race Non-Hispanic", "MoE % of Total Population, Other Race Non-Hispanic", "Foreign-born Population", "MoE Foreign-born Population", "% of Total Population, Foreign-born", "MoE % of Total Population, Foreign-born", "Total Households", "MoE Total Households", "Owner-Occupied Households", "MoE Owner-Occupied Households", "Homeownership Rate", "MoE Homeownership Rate", "Population Ages 25+", "MoE Population Ages 25+", "Ages 25+ without a high school diploma", "MoE Ages 25+ without a high school diploma", "% of Population Ages 25+, without a high school diploma", "MoE % of Population Ages 25+, without a high school diploma", "Ages 25+ with a Bachelor's degree or more", "MoE Ages 25+ with a Bachelor's degree or more", "% of Population Ages 25+, with a Bachelor's degree or more", "MoE % of Population Ages 25+, with a Bachelor's degree or more", "Median Household Income", "MoE Median Household Income", "Total Population, Poverty Status Determined", "MoE Total Population, Poverty Status Determined", "Population in Poverty", "MoE Population in Poverty", "Poverty Rate", "MoE Poverty Rate", "Population Low-Income", "MoE Population Low-Income", "Low-Income Rate", "MoE Low-Income Rate", "Population Ages 0-17, Poverty Status Determined", "MoE Population Ages 0-17, Poverty Status Determined", "Population Ages 0-17 In Poverty", "MoE Population Ages 0-17 In Poverty", "Population Ages 0-17, Poverty Rate", "MoE Population Ages 0-17, Poverty Rate", "Population Ages 0-17 Low-Income", "MoE Population Ages 0-17 Low-Income", "Population Ages 0-17, Low-Income Rate", "MoE Population Ages 0-17, Low-Income Rate", "Population Ages 65+, Poverty Status Determined", "MoE Population Ages 65+, Poverty Status Determined", "Population Ages 65+ In Poverty", "MoE Population Ages 65+ In Poverty", "Population Ages 65+ Poverty Rate", "MoE Population Ages 65+ Poverty Rate", "Population Ages 65+ Low-Income", "MoE Population Ages 65+ Low-Income", "Population Ages 65+, Low-Income Rate", "MoE Population Ages 65+, Low-Income Rate")


# Round Estimates
townprofiledf[,5]=townprofiledf[,5]=round(townprofiledf[,5],0)
townprofiledf[,9]=townprofiledf[,9]=round(townprofiledf[,9],0)
townprofiledf[,25]=townprofiledf[,25]=round(townprofiledf[,25],0)
townprofiledf[,33]=townprofiledf[,33]=round(townprofiledf[,33],0)
townprofiledf[,37]=townprofiledf[,37]=round(townprofiledf[,37],0)
townprofiledf[,53]=townprofiledf[,53]=round(townprofiledf[,53],0)
townprofiledf[,61]=townprofiledf[,61]=round(townprofiledf[,61],0)
townprofiledf[,65]=townprofiledf[,65]=round(townprofiledf[,65],0)
townprofiledf[,69]=townprofiledf[,69]=round(townprofiledf[,69],0)
townprofiledf[,71]=townprofiledf[,71]=round(townprofiledf[,71],0)
townprofiledf[,75]=townprofiledf[,75]=round(townprofiledf[,75],0)
townprofiledf[,79]=townprofiledf[,79]=round(townprofiledf[,79],0)
townprofiledf[,81]=townprofiledf[,81]=round(townprofiledf[,81],0)
townprofiledf[,85]=townprofiledf[,85]=round(townprofiledf[,85],0)

# Round percentages
townprofiledf[,6]=paste(round(townprofiledf[,6]*100,1), "%",sep="")
townprofiledf[,7]=paste(round(townprofiledf[,7]*100,1), "%", sep="")
townprofiledf[,10]=paste(round(townprofiledf[,10]*100,1), "%", sep="")
townprofiledf[,11]=paste(round(townprofiledf[,11]*100,1), "%", sep="")
townprofiledf[,14]=paste(round(townprofiledf[,14]*100,1), "%", sep="")
townprofiledf[,15]=paste(round(townprofiledf[,15]*100,1), "%", sep="")
townprofiledf[,18]=paste(round(townprofiledf[,18]*100,1), "%", sep="")
townprofiledf[,19]=paste(round(townprofiledf[,19]*100,1), "%", sep="")
townprofiledf[,22]=paste(round(townprofiledf[,22]*100,1), "%", sep="")
townprofiledf[,23]=paste(round(townprofiledf[,23]*100,1), "%", sep="")
townprofiledf[,26]=paste(round(townprofiledf[,26]*100,1), "%", sep="")
townprofiledf[,27]=paste(round(townprofiledf[,27]*100,1), "%", sep="")
townprofiledf[,30]=paste(round(townprofiledf[,30]*100,1), "%", sep="")
townprofiledf[,31]=paste(round(townprofiledf[,31]*100,1), "%", sep="")
townprofiledf[,34]=paste(round(townprofiledf[,34]*100,1), "%", sep="")
townprofiledf[,35]=paste(round(townprofiledf[,35]*100,1), "%", sep="")
townprofiledf[,38]=paste(round(townprofiledf[,38]*100,1), "%", sep="")
townprofiledf[,39]=paste(round(townprofiledf[,39]*100,1), "%", sep="")
townprofiledf[,44]=paste(round(townprofiledf[,44]*100,1), "%", sep="")
townprofiledf[,45]=paste(round(townprofiledf[,45]*100,1), "%", sep="")
townprofiledf[,50]=paste(round(townprofiledf[,50]*100,1), "%", sep="")
townprofiledf[,51]=paste(round(townprofiledf[,51]*100,1), "%", sep="")
townprofiledf[,54]=paste(round(townprofiledf[,54]*100,1), "%", sep="")
townprofiledf[,55]=paste(round(townprofiledf[,55]*100,1), "%", sep="")
townprofiledf[,62]=paste(round(townprofiledf[,62]*100,1), "%", sep="")
townprofiledf[,63]=paste(round(townprofiledf[,63]*100,1), "%", sep="")
townprofiledf[,66]=paste(round(townprofiledf[,66]*100,1), "%", sep="")
townprofiledf[,67]=paste(round(townprofiledf[,67]*100,1), "%", sep="")
townprofiledf[,72]=paste(round(townprofiledf[,72]*100,1), "%", sep="")
townprofiledf[,73]=paste(round(townprofiledf[,73]*100,1), "%", sep="")
townprofiledf[,76]=paste(round(townprofiledf[,76]*100,1), "%", sep="")
townprofiledf[,77]=paste(round(townprofiledf[,77]*100,1), "%", sep="")
townprofiledf[,82]=paste(round(townprofiledf[,82]*100,1), "%", sep="")
townprofiledf[,83]=paste(round(townprofiledf[,83]*100,1), "%", sep="")
townprofiledf[,86]=paste(round(townprofiledf[,86]*100,1), "%", sep="")
townprofiledf[,87]=paste(round(townprofiledf[,87]*100,1), "%", sep="")


# Add Metadata columns
# Definition, Source, Year

townprofiledf$Source[1] <- "Wellbeing data from the DataHaven 2015 Community Wellbeing Survey. All other data from the US Census Bureau ACS 5-year estimate. The ACS surveys a sample of households on a rolling monthly basis; survey data are aggregated and averaged into 1, 3, and 5-year period estimates. The Census Bureau considers the 5-year estimates to be the most accurate and recommends using 5-year estimates for town-level data."
townprofiledf$Year[1] <- "Wellbeing data from 2015. All other data from 2009-2013."
townprofiledf$Definition[1] <- "MoE is the Margin of Error for each estimate with a 90% confidence interval. Due to sampling methodology, margins of error exist for all reported Census estimates. With 90 percent confidence, each estimate falls between a lower limit (subtracting margin of error from estimate) and an upper limit (adding margin of error to estimate).  
'Hispanic Population' includes all persons who identify as of Hispanic or Latino ethnicity. 'White Non-Hispanic Population' includes all persons who identify as of white or Caucasian race, and not of Hispanic or Latino ethnicity. 'Black Non-Hispanic Population' includes all persons who identify as of black or African American race, and not of Hispanic or Latino ethnicity. 'Other Race Non-Hispanic Population' includes all persons who identify as another race, and not of Hispanic or Latino ethnicity. 
'Foreign-born Population' includes all residents born outside of the United States to non-American parents. An immigrant is another term for a foreign-born person.
'Total Households' is equivalent to the number of occupied housing units in a given geographic area. The Census sometimes reports households as 'occupied housing units.'
'Owner-occupied households' includes all households that own their housing unit.
'Homeownership Rate' is owner-occupied households divided by total households.
'Total Population, Poverty Status Determined' is the total population, excluding persons living in prisons, nursing homes, college dormitories, military barracks, foster children under 15 years, and people in non-conventional housing. 
'Population in Poverty' includes any persons whose annual household income is below the poverty threshold. The federal government determines the poverty threshold based on the size of the family and the ages of its members.
'Poverty Rate' is the population in poverty divided by the total population whose poverty status is determined.
'Population Low-Income' counts all whose annual household income is less than 200 percent of the poverty threshold, including the population in poverty.
'Low-Income Rate' is the low-income population divided by the total population whose poverty status is determined."
townprofiledf$"Key Facts" <- "Key Facts"
townprofiledf$"Demographic, Total Population" <- "Demographic, Total Population"
townprofiledf$"Race and Ethnicity, Total Population" <- "Race and Ethnicity, Total Population"
townprofiledf$"Place of Birth, Total Population" <- "Place of Birth, Total Population"
townprofiledf$"Households" <- "Households"
townprofiledf$"Educational Attainment, Population 25 years and over" <- "Educational Attainment, Population 25 years and over"
townprofiledf$"Median Income" <- "Median Income"
townprofiledf$"Poverty and Low-Income, Total Population" <- "Poverty and Low-Income, Total Population"
townprofiledf$"Poverty and Low-Income, Population 0 to 17 years" <- "Poverty and Low-Income, Population 0 to 17 years"
townprofiledf$"Poverty and Low-Income, Population 65 years and over" <- "Poverty and Low-Income, Population 65 years and over"
townprofiledf$"Other Data Sources" <- "Other Data Sources"
townprofiledf$"Metadata" <- "Metadata"


censuslink <- read.csv("TownProfilesCensus.csv", header=TRUE, nrows=170, stringsAsFactors = FALSE)

profile <- merge(townprofiledf, censuslink)
profile <- profile[c(31,1:30,32:170),]

names(profile)[104:107] <- c("Social Characteristics", "Economic Characteristics", "Housing Characteristics", "Demographic Characteristics")

profiledf <- profile[,c(1,103,91,92,2:11,16:19,93,20:35,94,36:39,95,40:45,96,46:55,97,56:57,98,58:67,99,68:77,100,78:87,102,88:90,101,103:106)]


write.csv(profiledf, "5year2013_town_profile.csv", row.names=F)
