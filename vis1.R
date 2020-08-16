library(tidyverse)

#ggplot() +
#  geom_line(data=plot_data, aes(dateRep, cumulative), color = "blue")+scale_y_log10()

# +scale_x_date(labels = date_format("%m/%d"), breaks = date_breaks("2 weeks"))

ggplot() + geom_line(data=plot_data, aes(caseDate, cumulative, color = countryterritoryCode))+scale_y_log10()
       