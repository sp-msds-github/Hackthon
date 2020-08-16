# Blueprint
# End Goal: Date, country filtered by (select countries), number of cases (by million)

# Load cdc data
# select data from both sources we will use
# Filter by country
# add column for "per million"
# visualize with line plot
# visualize map





library(utils)
library(tidyverse)



data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv", na.strings = "", fileEncoding = "UTF-8-BOM")

data_copy <- data

#country_list <- c("USA")
country_list <- c("USA", "GBR", "KOR", "CHN")
# mydates <- as.Date(c("2007-06-22", "2004-02-13"))

plot_data <- data_copy %>% select(
  dateRep,
  countriesAndTerritories,
  countryterritoryCode,
  cases,
  deaths,
  popData2019
) %>% filter(countryterritoryCode %in% country_list ) %>%
  mutate(caseDate = as.Date(dateRep, "%m/%d/%y")) %>%
  group_by(countryterritoryCode, .add=TRUE) %>%
  arrange(countryterritoryCode, dateRep) %>%
  mutate( cumulative = cumsum(cases)) %>% 
  mutate(cases_per_million = (cumulative / popData2019)*1000000) 
  