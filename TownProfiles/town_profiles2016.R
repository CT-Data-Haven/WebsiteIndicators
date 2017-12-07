library(acsprofiles)
library(tidyverse)

################## VARIABLES ############
year <- 2016
###############################################

ct_towns <- get_town_names()

regions_short <- regions[c("Greater New Haven", "Greater Waterbury", "Greater Bridgeport", "Lower Naugatuck Valley")]
# to fit CWS file:
names(regions_short)[2:3] <- c("GWB", "GBP")

table_nums <- list(
	total_pop = "B01003",
	sex_by_age = "B01001",
	race = "B03002",
	foreign_born = "B05001",
	tenure = "B25003",
	housing_cost = "B25106",
	vehicles = "B08201", 
	education = "B06009",
	median_income = "B19013",
	poverty = "C17002",
	pov_age = "B17024"
)

# fetch <- table_nums %>% map(~all_geo_table(ct_towns, ., 2015, regions_short))
# save(fetch, file = "fetch_all_towns16.RData")
load("fetch_all_towns16.RData")
table <- vector("list", length = length(fetch)) %>% set_names(names(fetch))

beepr::beep()

# TOTAL POPULATION
table$total_pop <- total_pop <- fetch$total_pop[, 1]
acs.colnames(table$total_pop) <- "num_total_pop"


# SEX & AGE
# #, % age 0-17; #, % age 65+; #, % male; #, % female
age <- fetch$sex_by_age
sexes <- list(
	male = 2,
	female = 26
)
ages <- list(
	under18 = c(3:6, 27:30),
	age65plus = c(20:25, 44:49)
)
table$sex_by_age <- cbind(
	calc_acs_table(ages, total_pop, age),
	calc_acs_table(sexes, total_pop, age)
)
acs.colnames(table$sex_by_age) <- c("num_age_0_17", "per_age_0_17", "num_age_65plus", "per_age_65plus",
																		 "num_male", "per_male", "num_female", "per_female")
rm(age, sexes, ages)

# RACE / HISPANIC
# #, % hispanic, white non-hispanic, black non-hispanic, other non-hispanic
race <- fetch$race
races <- list(
	hispanic = 12,
	white = 3,
	black = 4,
	other = 5:9
)
table$race <- calc_acs_table(races, total_pop, race)
acs.colnames(table$race) <- c("num_hispanic", "per_hispanic", "num_white", "per_white", "num_black", "per_black", "num_other_race", "per_other_race")
rm(race, races)


# FOREIGN BORN
# #, % foreign born
table$foreign_born <- calc_acs_table(list(fb = 5:6), total_pop, fetch$foreign_born)
acs.colnames(table$foreign_born) <- c("num_foreign_born", "per_foreign_born")


# TENURE
# # households, #, % owner occupied
hh <- fetch$tenure[, 1] # save this for other calcs
table$tenure <- list(hh, calc_acs_table(list(owned = 2), hh, fetch$tenure)) %>% reduce(cbind)
acs.colnames(table$tenure) <- c("num_households", "num_owned_hh", "per_owned_hh")


# HOUSING COST BURDEN
# #, % cost burdened -- combine owned + rented
table$housing_cost <- calc_acs_table(list(burden = c(6, 10, 14, 18, 22, 28, 32, 36, 40, 44)), hh, fetch$housing_cost)
acs.colnames(table$housing_cost) <- c("num_cost_burden", "per_cost_burden")


# VEHICLES
# #, % households with car
table$vehicles <- calc_acs_table(list(vehicle = 3:6), hh, fetch$vehicles)
acs.colnames(table$vehicles) <- c("num_hh_w_car", "per_hh_w_car")


# EDUCATIONAL ATTAINMENT
# # age 25+; #, % age 25+ w/o hs degree; #, % age 25+ w/ bachelor's or higher
age25 <- fetch$education[, 1]
edus <- list(
	no_hs = 2,
	bach_plus = 5:6
)
table$education <- list(
	age25,
	calc_acs_table(edus, age25, fetch$education)
) %>% reduce(cbind)
acs.colnames(table$education) <- c("num_pop_age_25plus", "num_no_hs", "per_no_hs", "num_bach_plus", "per_bach_plus")
rm(age25, edus)


# MEDIAN HOUSEHOLD INCOME
# make NA for regions
income <- fetch$median_income
is.na(income[2:5]@estimate) <- T
is.na(income[2:5]@standard.error) <- T
table$median_income <- income
acs.colnames(table$median_income) <- "num_median_hh_income"
rm(income)


# POVERTY & LOW INCOME
# # pov status determined; #, % below 1.0 ratio, below 2.0 ratio
poverty <- fetch$poverty
deter <- poverty[, 1]
povs <- list(
	pov = 2:3,
	low_inc = 2:7
)
table$poverty <- list(
	deter,
	calc_acs_table(povs, deter, poverty)
) %>% reduce(cbind)
acs.colnames(table$poverty) <- c("num_pov_status_determined", "num_poverty", "per_poverty", "num_low_income", "per_low_income")
rm(poverty, deter, povs)


# POVERTY, LOW INCOME BY AGE
# # pov status determined, #, % poverty, low income for ages 0-17, 65+
pov_age <- fetch$pov_age
under18deter <- apply(X = pov_age[, c(2, 15, 28)], FUN = sum, MARGIN = 2, agg.term = "under18")
over65deter <- apply(X = pov_age[, c(106, 119)], FUN = sum, MARGIN = 2, agg.term = "65plus")
povs18 <- list(
	pov = c(3:5, 16:18, 29:31),
	low = c(3:10, 16:23, 29:36)
)
povs65 <- list(
	pov = c(107:109, 120:122),
	low = c(107:114, 120:127)
)
table$pov_age <- list(
	under18deter,
	calc_acs_table(povs18, under18deter, pov_age),
	over65deter,
	calc_acs_table(povs65, over65deter, pov_age)
) %>% reduce(cbind)
acs.colnames(table$pov_age) <- c("num_pov_status_determined_0_17", "num_poverty_0_17", "per_poverty_0_17", "num_low_income_0_17", "per_low_income_0_17", "num_pov_status_determined_65plus", "num_poverty_65plus", "per_poverty_65plus", "num_low_income_65plus", "per_low_income_65plus")
rm(pov_age, under18deter, over65deter, povs18, povs65)


# BIND ALL TOGETHER
all_tables <- table %>% reduce(cbind)
# read in definitions from text files for website
source <- read_file("../ACS_profiles_code/source_files/town_profile_source.txt")
definition <- read_file("../ACS_profiles_code/source_files/town_profile_definition.txt")
cws <- read_csv("../ACS_profiles_code/source_files/CWSforWebsiteauto.csv")

fips <- fetch$total_pop@geography %>%
	tbl_df() %>%
	mutate_at(vars(c(state, county, countysubdivision)), funs(as.numeric)) %>% 
	filter(countysubdivision != 0 | is.na(countysubdivision)) %>%
	mutate(state = str_pad(state, 2, "left", "0"), 
				 county = str_pad(county, 3, "left", "0"), 
				 countysubdivision = str_pad(countysubdivision, 5, "left", "0"), 
				 code = paste0(state, county, countysubdivision) %>% str_replace_all("NA", ""),
				 code_len = nchar(code))
urls <- fips %>%
	select(code, code_len) %>%
	mutate(year = str_sub(year, start = 3)) %>%
	mutate(base_url = sprintf("http://factfinder.census.gov/bkmk/table/1.0/en/ACS/%s_5YR/", year)) %>%
	mutate(type = as.factor(code_len) %>% forcats::fct_recode(`04` = "2", `05` = "5", `06` = "10", NULL = "0")) %>%
	mutate(soc_url = sprintf("%sDP02/%s00000US%s", base_url, type, code)) %>%
	mutate(econ_url = sprintf("%sDP03/%s00000US%s", base_url, type, code)) %>%
	mutate(house_url = sprintf("%sDP04/%s00000US%s", base_url, type, code)) %>%
	mutate(demo_url = sprintf("%sDP05/%s00000US%s", base_url, type, code)) %>%
	select(-base_url, -type, -year) %>%
	mutate_at(vars(ends_with("_url")), funs(ifelse(code_len == 0, "", .)))
	




prof_df <- data.frame(name1 = all_tables@geography$NAME, all_tables@estimate, all_tables@standard.error * qnorm(0.95)) %>%
	as_tibble() %>%
	filter(!str_detect(name1, "not defined")) %>%
	mutate(name = str_replace(name1, " town.+", ""), county = str_extract(name1, "(?<=,\\s)(.+)(?=\\sCounty)")) %>%
	select(name, county, everything(), -name1) %>%
	mutate_at(vars(starts_with("per")), funs(round(. * 100, digits = 1) %>% format(nsmall = 1) %>% paste0("%"))) %>%
	mutate_at(vars(starts_with("num")), funs(round(., digits = 0))) %>%
	arrange_est_moe(omit = 1:2) %>%
	setNames(c('Town','County','Total Population','MoE Total Population','Population Ages 0-17','MoE Population Ages 0-17','% of Total Population, Ages 0-17','MoE % of Total Population, Ages 0-17','Population Ages 65+','MoE Population Ages 65+','% of Total Population, Ages 65+','MoE % of Total Population, Ages 65+','Population Male','MoE Population Male','% of Total Population, Male','MoE % of Total Population, Male','Population Female','MoE Population Female','% of Total Population, Female','MoE % of Total Population, Female','Hispanic Population','MoE Hispanic Population','% of Total Population, Hispanic','MoE % of Total Population, Hispanic','White Non-Hispanic Population','MoE White Non-Hispanic Population','% of Total Population, White Non-Hispanic','MoE % of Total Population, White Non-Hispanic','Black Non-Hispanic Population','MoE Black Non-Hispanic Population','% of Total Population, Black Non-Hispanic','MoE % of Total Population, Black Non-Hispanic','Other Race Non-Hispanic Population','MoE Other Race Non-Hispanic Population','% of Total Population, Other Race Non-Hispanic','MoE % of Total Population, Other Race Non-Hispanic','Foreign-born Population','MoE Foreign-born Population','% of Total Population, Foreign-born','MoE % of Total Population, Foreign-born','Total Households','MoE Total Households','Owner-Occupied Households','MoE Owner-Occupied Households','Homeownership Rate','MoE Homeownership Rate','Cost-Burdened Households','MoE Cost-Burdened Households','% of Households, Cost-Burdened','MoE % of Households, Cost-Burdened','Households with a car','MoE Households with a car','% of Households, with a car','MoE % of Households, with a car','Population Ages 25+','MoE Population Ages 25+','Ages 25+ without a high school diploma','MoE Ages 25+ without a high school diploma','% of Population Ages 25+, without a high school diploma','MoE % of Population Ages 25+, without a high school diploma','Ages 25+ with a Bachelor\'s degree or more','MoE Ages 25+ with a Bachelor\'s degree or more','% of Population Ages 25+, with a Bachelor\'s degree or more','MoE % of Population Ages 25+, with a Bachelor\'s degree or more','Median Household Income','MoE Median Household Income','Total Population, Poverty Status Determined','MoE Total Population, Poverty Status Determined','Population in Poverty','MoE Population in Poverty','Poverty Rate','MoE Poverty Rate','Population Low-Income','MoE Population Low-Income','Low-Income Rate','MoE Low-Income Rate','Population Ages 0-17, Poverty Status Determined','MoE Population Ages 0-17, Poverty Status Determined','Population Ages 0-17 In Poverty','MoE Population Ages 0-17 In Poverty','Population Ages 0-17, Poverty Rate','MoE Population Ages 0-17, Poverty Rate','Population Ages 0-17 Low-Income','MoE Population Ages 0-17 Low-Income','Population Ages 0-17, Low-Income Rate','MoE Population Ages 0-17, Low-Income Rate','Population Ages 65+, Poverty Status Determined','MoE Population Ages 65+, Poverty Status Determined','Population Ages 65+ In Poverty','MoE Population Ages 65+ In Poverty','Population Ages 65+ Poverty Rate','MoE Population Ages 65+ Poverty Rate','Population Ages 65+ Low-Income','MoE Population Ages 65+ Low-Income','Population Ages 65+, Low-Income Rate','MoE Population Ages 65+, Low-Income Rate')) %>%
	mutate(`Key Facts` = "Key Facts",
				 `Wellbeing, Population 18 years and over` = "Wellbeing, Population 18 years and over",
				 `Demographic, Total Population` = "Demographic, Total Population",
				 `Race and Ethnicity, Total Population` = "Race and Ethnicity, Total Population",
				 `Place of Birth, Total Population` = "Place of Birth, Total Population",
				 Households = "Households",
				 `Educational Attainment, Population 25 years and over` = "Educational Attainment, Population 25 years and over",
				 `Median Income` = "Median Income",
				 `Poverty and Low-Income, Total Population` = "Poverty and Low-Income, Total Population",
				 `Poverty and Low-Income, Population 0 to 17 years` = "Poverty and Low-Income, Population 0 to 17 years",
				 `Poverty and Low-Income, Population 65 years and over` = "Poverty and Low-Income, Population 65 years and over",
				 `Other Data Sources` = "Other Data Sources",
				 `Source` = source,
				 `Definition` = definition,
				 `Social Characteristics` = urls$soc_url,
				 `Economic Characteristics` = urls$econ_url,
				 `Housing Characteristics` = urls$house_url,
				 `Demographic Characteristics` = urls$demo_url) %>%
	left_join(cws %>% select(-County), by = "Town") %>%
	select(1:2, 97:98, 115:125, 99, 3:20, 100, 21:36, 101, 31:40, 102, 41:54, 103, 55:64, 104, 65:66, 105, 67:76,
				 106, 77:86, 107, 87:96, 109:114)
prof_df$Town[prof_df$Town == "GWB"] <- "Greater Waterbury"
prof_df$Town[prof_df$Town == "GBP"] <- "Greater Bridgeport"

write_csv(prof_df, paste0("5year", year, "town_profile_expanded_CWS.csv"), na = "")

beepr::beep()